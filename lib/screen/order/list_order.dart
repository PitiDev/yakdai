import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/screen/product/data_list.dart';

class listOrder extends StatefulWidget {
  @override
  _listOrderState createState() => _listOrderState();
}

class _listOrderState extends State<listOrder> {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 1.0,
        backgroundColorStart: Color(0xFF1565c0),
        backgroundColorEnd: Color(0xFF66a6ff),
        title: Text('ລາຍການສັ່ງສີນຄ້າ'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/listCus');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.supervised_user_circle),
                      Text('ລູກຄ້າທັງໝົດ')
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/createOrder');
                  },
                  child: Row(
                    children: <Widget>[Icon(Icons.border_color), Text('ເພີ່ມລາຍການສັ່ງເຄື່ອງ')],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/createCus');
                  },
                  child: Row(
                    children: <Widget>[Icon(Icons.add_box), Text('ເພີ່ມລູກຄ້າ')],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 3.0,
              child: Center(
                child: Padding(
                  //Add padding around textfield
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      hintText: "ຄົ້ນຫາ",
                      border: InputBorder.none,
                      icon: CircleAvatar(
                        backgroundColor: Color(0xFF1565c0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('ລາຍການສັ່ງທັງໝົດ'),
          SizedBox(
            height: 20,
          ),
          DataList(),
        ],
      ),
    );
  }
}
