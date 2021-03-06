import 'package:apprental/_widgets/appBar.dart';
import 'package:apprental/screen/CarScreen.dart';
import 'package:apprental/screen/ContactScreen.dart';
import 'package:apprental/screen/OrderScreen.dart';
import 'package:apprental/services/sign_in.dart';
import 'package:apprental/ui/auth.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  String tes = 'hallo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: _getPage(currentPage),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "Home",
          ),
          TabData(iconData: Icons.shop, title: "Order"),
          TabData(iconData: Icons.info, title: "Tentang")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        barBackgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        circleColor: Colors.white70,
        inactiveIconColor: Colors.white,
        textColor: Colors.white,
        onTabChangedListener: (posisi) {
          setState(() {
            currentPage = posisi;
          });
        },
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30.0,
                      ),
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                title: Text(
                  'logout',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  signOutGoogle();
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return AuthGoogle();
                  }), ModalRoute.withName("/"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_getPage(int page) {
  switch (page) {
    case 0:
      return CarScreen();
    case 1:
      return OrderScreen();
    case 2:
      return ContactScreen();
  }
}
