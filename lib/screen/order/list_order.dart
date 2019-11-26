import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'package:app_yakdai/screen/order/data_list.dart';

class listOrder extends StatefulWidget {
  @override
  _listOrderState createState() => _listOrderState();
}

class _listOrderState extends State<listOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
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
                  onTap: () {
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
                    children: <Widget>[
                      Icon(Icons.border_color),
                      Text('ເພີ່ມລາຍການສັ່ງເຄື່ອງ')
                    ],
                  ),
                ),
              ),
            ],
          ),
          OrderList(),
        ],
      ),
    );
  }
}
