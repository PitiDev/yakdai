import 'package:app_yakdai/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_yakdai/style/theme.dart' as Theme;
import 'package:app_yakdai/screen/home/menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: GradientAppBar(
            elevation: 0.0,
            backgroundColorStart: Color(0xFF1565c0),
            backgroundColorEnd: Color(0xFF66a6ff),
            automaticallyImplyLeading: false,
            bottom: TabBar(
              // labelPadding: EdgeInsets.all(15),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.view_list,
                              size: 26.0,
                            ),
                            Text(
                              "ລາຍການສັ່ງ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.insert_chart,
                              size: 26.0,
                            ),
                            Text(
                              "ລາຍງານ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              indicatorColor: Colors.white,
            ),
            title: Center(
              child: Text('Yakdai'),
            ),
          ),
          body: TabBarView(
            children: [
              Menu(),
              Icon(Icons.directions_transit),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                ModalRoute.withName("/home"),
              );
            }),
            tooltip: 'Logout',
            child: Icon(Icons.power_settings_new),
          ),
        ),
      ),
    );
  }
}
