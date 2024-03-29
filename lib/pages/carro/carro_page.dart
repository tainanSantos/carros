import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/loripsom_api.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsomApiBloc = LoripsomBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loripsomApiBloc.fetch();
  }

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
          Image.network(widget.carro?.urlFoto ??
              "https://img.olx.com.br/images/61/616098458720941.jpg"),
          _bloco1(),
          Divider(),
          _bloco2()
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(
              widget.carro.nome,
              fontSize: 20,
              bold: true,
            ),
            text(
              widget.carro.tipo,
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
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        text(widget.carro.descricao, fontSize: 16, bold: true),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<String>(
            stream: _loripsomApiBloc.stream,
            builder: (BuildContext context, AsyncSnapshot snapShot) {
              if (!snapShot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return text(snapShot.data, fontSize: 16);
            })
      ],
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loripsomApiBloc.dispose();
  }
}
