import 'package:drinkme/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';
import '../view/favorite/favorite.dart';
import '../view/home/home.dart';
import '../view/profile/profile.dart';
import 'drawer.dart';

class TabsController extends StatelessWidget {
  // final UserModel user;
  int user;
  var Tab1, Tab2;
  TabsController({required this.Tab1, required this.Tab2, required this.user});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 251, 251, 251),
          elevation: 0,
          title: const Text(
            'Home',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 0, 0, 0),
            labelColor: black,
            tabs: [
              Tab(
                text: 'Semua',
              ),
              Tab(
                text: 'Place',
              )
            ],
          ),
        ),
        drawer: DrawerWidget(
          user: user,
        ),
        body: TabBarView(
          children: <Widget>[Tab1, Tab2],
        ),
        // bottomNavigationBar: Controller(),
        // bottomNavigationBar: Butnov(onTabChange: null,),
      ),
    );
  }
}
