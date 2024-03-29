import 'dart:convert';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse> login(String login, String senha) async {
    // var url = "http://livrowebservices.com.br/rest/login";

    try {
      var url = "https://carros-springboot.herokuapp.com/api/v2/login";

      Map<String, String> headers = {"Content-Type": "application/json"};

      final params = {
        "username": login,
        "password": senha,
      };

      String s = json.encode(params);

      var response = await http.post(url, body: s, headers: headers);

      print(response.body);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse['error']);
    } catch (error) {
      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
