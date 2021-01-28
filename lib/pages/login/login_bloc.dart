import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  Future<ApiResponse> login(String login, String senha) async {
    _streamController.add(true);

    ApiResponse response = await LoginApi.login(login, senha);
    _streamController.add(false);

    return response;
  }

  get stream => _streamController.stream;

  void dispose() {
    _streamController.close();
  }
}
