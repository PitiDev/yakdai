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
        actions: <Widget>[

        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
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
                margin: EdgeInsets.only(right: 10),
                height: 40,
                child: RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.transparent)),
                    color: Color(0xFF29b6f6),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.add,color: Colors.white,),
                        Text(
                          'ເພີ່ມສີນຄ້າ',
                          style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/createPro');
                    }),
              ),
            ],
          ),
          DataList(),
        ],
      ),
    );
  }
}
