import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_app/daftar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageKu(),
    );
  }
}

class PageKu extends StatefulWidget {
  @override
  _PageKu createState() => _PageKu();
}

class _PageKu extends State<PageKu> {
  int _selectedNavbar = 2;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: false,
                backgroundColor: Colors.blue,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Tugas Dicoding",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ];
          },
          body: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                buildCard(Icons.create, "Daftar", Colors.lightBlueAccent),
                buildCard(Icons.access_alarm, "Alarm", Colors.redAccent),
                buildCard(Icons.access_time, "Times", Colors.greenAccent),
                buildCard(
                    Icons.accessibility_new, "Accessibility", Colors.blueGrey),
                buildCard(Icons.ac_unit, "Snow", Colors.lightBlueAccent),
                buildCard(Icons.access_alarm, "Alarm", Colors.redAccent),
                buildCard(Icons.access_time, "Times", Colors.greenAccent),
                buildCard(
                    Icons.accessibility_new, "Accessibility", Colors.blueGrey)
              ],
            ),
          )),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue[500],
        items: [
          TabItem(icon: Icons.account_box, title: "Akun"),
          TabItem(icon: Icons.accessibility, title: "Home"),
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.speed, title: "Home"),
          TabItem(icon: Icons.settings, title: "Pengaturan"),
        ],
        initialActiveIndex: _selectedNavbar,
        onTap: _changeSelectedNavBar,
      ),
    );
  }

  Card buildCard(IconData icon, String text, Color bgwarna) {
    return Card(
      color: bgwarna,
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Route route = MaterialPageRoute(builder: (context) => PageDaftar());
          Navigator.push(context, route);
        },
        splashColor: Colors.amber,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              Text(
                text,
                style: new TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
