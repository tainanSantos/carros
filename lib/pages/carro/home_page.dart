import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/carros_page.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _intiTabs();
  }

  _intiTabs() async {
    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController.index = tabIdx;
    });

    // future.then((int tabIdx) {
    //   _tabController.index = tabIdx;
    // });    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
      print(">>>>>>>>> ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "Classicos",
              ),
              Tab(
                text: "Exportivos",
              ),
              Tab(
                text: "Luxo",
              ),
            ],
          ),
        ),
        drawer: DrawerList(),
        body: TabBarView(
          controller: _tabController,
          children: [
            CarrosPage(
              "classicos",
            ),
            CarrosPage(
              "esportivos",
            ),
            CarrosPage(
              "luxo",
            )
          ],
        ),
      ),
    );
  }
}
