import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class createOrder extends StatefulWidget {
  @override
  _createOrderState createState() => _createOrderState();
}

class _createOrderState extends State<createOrder> {

  Future<List> _listPro() async {
    final response =
    await http.get("http://127.0.0.1:8000/api/list-cus");
//    print("Response status: ${response.statusCode}");
//    print("Response body: ${response.body}");

    return json.decode(response.body);
  }

  String _value;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: GradientAppBar(
        elevation: 1.0,
        backgroundColorStart: Color(0xFF1565c0),
        backgroundColorEnd: Color(0xFF66a6ff),
        title: Text('ເພີ່ມການສັ່ງສີນຄ້າ'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
