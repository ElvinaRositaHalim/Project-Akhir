import 'package:tga_login/style/color.dart';
import 'package:flutter/material.dart';

class FormCovid extends StatefulWidget {
  @override
  _FormCovidState createState() => _FormCovidState();
}

class _FormCovidState extends State<FormCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Input Data Covid"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
