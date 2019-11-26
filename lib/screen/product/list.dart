import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_yakdai/screen/product/data_list.dart';

class ListPro extends StatefulWidget {
  @override
  _ListProState createState() => _ListProState();
}

class _ListProState extends State<ListPro> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
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
                    children: <Widget>[Icon(Icons.add), Text('ເພີ່ມສີນຄ້າ',style: TextStyle(fontWeight: FontWeight.bold),)],
                  ),
                ),
              )
            ],
          ),

          DataList(),
        ],
      ),
    );
  }
}
