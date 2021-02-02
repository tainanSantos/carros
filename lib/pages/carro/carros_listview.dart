import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosLisView extends StatelessWidget {
  List<Carro> carros;

  CarrosLisView(this.carros);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      carros[index].urlFoto ??
                          "https://s2.glbimg.com/mYgwlPa7vtIiUk6kROUxJUi2yyo=/0x0:620x413/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/a/4/Ik8J1fQYirf6wYRvRJ8Q/2020-03-20-novo-tracker-1.jpg",
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    carros[index].nome,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    carros[index].descricao,
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          _onClickCarro(context, carros[index]);
                        },
                        icon: Icon(Icons.info),
                        label: Text(
                          "DETALHES",
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                        label: Text(
                          "SHARE",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(context, Carro c) {
    push(context, CarroPage(c));
  }
}
