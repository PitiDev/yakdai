import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/screen/product/data_list.dart';
import 'package:app_yakdai/screen/customer/data_cus.dart';


class listCus extends StatefulWidget {
  @override
  _listCusState createState() => _listCusState();
}

class _listCusState extends State<listCus> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 1.0,
        backgroundColorStart: Color(0xFF1565c0),
        backgroundColorEnd: Color(0xFF66a6ff),
        title: Text('ລູກຄ້າ'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
//          InkWell(
//            onTap: () {
//              Navigator.pushNamed(context, '/searchCus');
//            },
//            child: Container(
//              margin: EdgeInsets.all(10),
//              child: Card(
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(15.0),
//                ),
//                elevation: 3.0,
//                child: Center(
//                  child: Padding(
//                    //Add padding around textfield
//                    padding: EdgeInsets.symmetric(horizontal: 5.0),
//                    child: Row(
//                      children: <Widget>[
//                        Container(
//                          margin: EdgeInsets.only(top: 5, bottom: 5),
//                          child: CircleAvatar(
//                            backgroundColor: Color(0xFF1565c0),
//                            child: Icon(
//                              Icons.search,
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                        Container(
//                            margin:
//                            EdgeInsets.only(top: 5, bottom: 5, left: 10),
//                            child: Text(
//                              "ຄົ້ນຫາ",
//                              style: TextStyle(color: Colors.grey),
//                            )),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ),
//          ),

          DataCus(),
        ],
      ),
    );
  }
}
