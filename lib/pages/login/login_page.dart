import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carro/home_page.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController(text: "user");
  final _tSenha = TextEditingController(text: "123");

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future<Usuario> future = Usuario.get();

    future.then((Usuario user) {
      if (user != null) {
        // se tiver um usuário no sistema eu já vou direto para a tela de home
        push(context, HomePage(), replace: true);
        // setState(() {
        //   _tLogin.text = user.login;
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            AppText(
              "Login",
              "Digite seu Login",
              controller: _tLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            AppText(
              "Senha",
              "Digite sua Senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            AppButton(
              text: "Login",
              onClickLogin: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  _text(
    String labelText,
    String hintText, {
    bool password = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) =>
      TextFormField(
        controller: controller,
        obscureText: password,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: (String text) {
          if (nextFocus != null)
            FocusScope.of(context).requestFocus(_focusSenha);
        },
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      );

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok)
      push(context, HomePage(), replace: true);
    else
      alert(context, response.msg);

    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String text) {
    if (text.isEmpty) return "Digite o Login";
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) return "Digite a Senha";
    return null;
  }
}
