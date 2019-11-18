import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/screen/product/data_list.dart';

class ListPro extends StatefulWidget {
  @override
  _ListProState createState() => _ListProState();
}

class _ListProState extends State<ListPro> {
  Future<List> _listPro() async {
    final response = await http.get("http://127.0.0.1:8000/api/list-pro");
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    return json.decode(response.body);
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 1.0,
        backgroundColorStart: Color(0xFF1565c0),
        backgroundColorEnd: Color(0xFF66a6ff),
        title: Text('Products'),
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
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.clear_all),
                      Text('ສີນຄ້າທັງໝົດ')
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/createPro');
                  },
                  child: Row(
                    children: <Widget>[Icon(Icons.add), Text('ເພີ່ມສີນຄ້າ')],
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
          SizedBox(
            height: 20,
          ),
          DataList(),
        ],
      ),
    );
  }
}
