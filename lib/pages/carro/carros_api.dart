import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    // String s = tipo.toString().replaceAll("TipoCarro.", "");

    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    var url =
        "https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo";
    var response = await http.get(url, headers: headers);

    String json = response.body;
    List list = convert.json.decode(json);

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    final dao = CarroDAO();

    // Salvando os carros no banco de dados
    carros.forEach((carro) => dao.save(carro));
    // carros.forEach(dao.save);

    // for (Carro c in carros) {
    //   await dao.save(c);
    // }

    return carros;
  }
}
