import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carro/simple_bloc.dart';
import 'package:carros/pages/login/login_api.dart';

class LoginBloc {
  final buttonBloc = SimpleBloc<bool>();

  Future<ApiResponse> login(String login, String senha) async {
    buttonBloc.add(true);

    ApiResponse response = await LoginApi.login(login, senha);
    buttonBloc.add(false);

    return response;
  }

  void dispose() {
    buttonBloc.dispose();
  }
}


 
