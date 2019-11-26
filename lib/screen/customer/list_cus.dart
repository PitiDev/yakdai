import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_yakdai/screen/customer/data_cus.dart';

class listCus extends StatefulWidget {
  @override
  _listCusState createState() => _listCusState();
}

class _listCusState extends State<listCus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ລູກຄ້າ'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          DataCus(),
        ],
      ),
    );
  }
}
