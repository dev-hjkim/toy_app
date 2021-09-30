import "package:http/http.dart" as http;
import "dart:io";
import "dart:convert";

class HttpUtil {
  final String urlBase = "http://192.168.1.16:8080/v1/api/auth";
  final String urlUpcoming = "/upcoming?";
  final String urlLanguage = "&language=ko-KR";
  final String urlSearchBase =
      "https://api.themoviedb.org/3/search/movie?api_key=952a21a203ad2415fd13cbaf87e663c1&query=";

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
}
