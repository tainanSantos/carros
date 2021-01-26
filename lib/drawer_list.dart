import 'package:carros/pages/login/login_page.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();

    return SafeArea(
        child: Drawer(
      child: ListView(
        children: [
          FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              Usuario user = snapshot.data;
              return user != null ? _header(user) : Container();
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("favoritos"),
            subtitle: Text("meus favoritos ..."),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("mais informações ..."),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            subtitle: Text("meus favoritos ... "),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _conClickLgout(context);
            },
          ),
        ],
      ),
    ));
  }

  _conClickLgout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
