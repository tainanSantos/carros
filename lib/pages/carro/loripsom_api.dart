import 'dart:async';

import 'package:http/http.dart' as http;

class LoripsomBloc {
  final _streamController = StreamController<String>();

  Stream<String> get stream => _streamController.stream;

  fetch() async {
    try {
      String s = await LoripsomApi.getLoripsum();
      _streamController.add(s);
    } catch (e) {
      //  fazendo isso para que a stream possa pegar o erro que vem da api
      _streamController.addError(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}

class LoripsomApi {
  static Future<String> getLoripsum() async {
    String url = 'https://loripsum.net/api';

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "").replaceAll("</p>", "");

    return text;
  }
}
