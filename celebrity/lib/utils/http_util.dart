import "package:http/http.dart" as http;
import "dart:io";
import "dart:convert";

class HttpUtil {
  final String urlBase = "http://192.168.1.16:8080/v1/api/auth";

  Future<Map<String, dynamic>> validateMail(String email) async {
    final String validateMail = urlBase + "/validate/mail";

    Map<String, String> resBody = {"username": email};

    http.Response result = await http.post(
      Uri.parse(validateMail),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> validateCode(String email, String code) async {
    final String validateCode = urlBase + "/validate/mail/cert";

    Map<String, String> resBody = {"username": email, "certCode": code};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> validateNickname(String nickname) async {
    final String validateCode = urlBase + "/validate/nickname";

    Map<String, String> resBody = {"nickname": nickname};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> login(String id, String pwd) async {
    final String validateCode = urlBase + "/login";

    Map<String, String> resBody = {"username": id, "password": pwd};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> findId(String phone) async {
    final String validateCode = urlBase + "/find/id";

    Map<String, String> resBody = {"phone": phone};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> findPw(String id, String phone) async {
    final String validateCode = urlBase + "/find/pw";

    Map<String, String> resBody = {"username": id, "phone": phone};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }

  Future<Map<String, dynamic>> modPw(String id, String pwd) async {
    final String validateCode = urlBase + "/mod/pw";

    Map<String, String> resBody = {"username": id, "password": pwd};

    http.Response result = await http.post(
      Uri.parse(validateCode),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(resBody),
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(utf8.decode(result.bodyBytes));
      return jsonResponse;
    } else {
      return {};
    }
  }
}
