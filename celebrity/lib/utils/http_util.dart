import "package:http/http.dart" as http;
import "dart:io";
import "dart:convert";

class HttpHelper {
  final String urlBase = "http://192.168.1.16:8080/v1/api/auth";
  final String urlUpcoming = "/upcoming?";
  final String urlLanguage = "&language=ko-KR";
  final String urlSearchBase = "https://api.themoviedb.org/3/search/movie?api_key=952a21a203ad2415fd13cbaf87e663c1&query=";


  Future<Map<String, String>> resValidateMail() async {
    final String validateMail = "/validate/mail";
    http.Response result = await http.post(Uri.parse(validateMail));

    if(result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse["results"];
      return moviesMap;
    } else {
      return Map();
    }
  }

}

