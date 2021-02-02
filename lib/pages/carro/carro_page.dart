import 'package:carros/pages/carro/carro.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carro"),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMap,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton(
            onSelected: (String value) => _onClickMapPopupMenu(value),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: "Editar",
                child: Text("Editar"),
              ),
              PopupMenuItem(
                value: "Deletar",
                child: Text("Deletar"),
              ),
              PopupMenuItem(
                value: "Share",
                child: Text("Share"),
              ),
            ],
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Image.network(carro?.urlFoto ??
              "https://img.olx.com.br/images/61/616098458720941.jpg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    carro.nome,
                    fontSize: 20,
                    bold: true,
                  ),
                  text(
                    carro.tipo,
                    fontSize: 16,
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 35,
                    ),
                    onPressed: _onClickFavorito,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 35,
                    ),
                    onPressed: _onClickShare,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _onClickMap() {}

  void _onClickVideo() {}

  _onClickMapPopupMenu(String value) {
    switch (value) {
      case "Editar":
        break;
      case "Deletar":
        break;
      case "Share":
        break;
    }
  }

  void _onClickFavorito() {}

  void _onClickShare() {}
}
