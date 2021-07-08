import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageDaftar(),
    );
  }
}

class PageDaftar extends StatefulWidget {
  PageDaftar({Key key}) : super(key: key);

  @override
  _PageDaftarState createState() => _PageDaftarState();
}

class _PageDaftarState extends State<PageDaftar> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: Colors.blue,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Daftar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: buildColumnPageDaftar(),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumnPageDaftar() {
    return Column(
      children: [
        buildForm("Masukan Nama Anda", "Nama", Icons.people,"","",1),
        Padding(padding: EdgeInsets.all(5)),
        buildForm("Masukan Kelas Anda", "Kelas", Icons.class__outlined,"TI ","",1),
        Padding(padding: EdgeInsets.all(5)),
        buildForm("Masukan Email Anda", "Email", Icons.email,"","@uniku.ac.id",1),
        Padding(padding: EdgeInsets.all(5)),
        buildForm("Masukan Keluhan Anda", "Keluhan", Icons.notes,"","",6),
        RaisedButton(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () {
            if (_formKey.currentState.validate()) {}
          },
        ),
      ],
    );
  }

  TextFormField buildForm(String hintText, String labelText, IconData icon,String prefixText, String suffixText, int ml) {
    return TextFormField(
      decoration: new InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixText: prefixText,
        suffixText: suffixText,
        icon: Icon(icon),
        prefixStyle: TextStyle(color:Colors.blue),
        suffixStyle: TextStyle(color:Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),maxLines: ml,
      validator: (value) {
        if (value.isEmpty) {
          return 'Tidak Boleh Kosong';
        }
        return null;
      },
    );
  }
}
