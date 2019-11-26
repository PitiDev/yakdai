import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app_yakdai/screen/product/list.dart';

final formatter = new NumberFormat("#,###");

class DetailProduct extends StatefulWidget {
  final id;
  final image;
  final pro_name;
  final type_pro;
  int price_old;
  int price_sale;
  int number;
  final create_at;

  DetailProduct(
      {this.pro_name,
      this.type_pro,
      this.price_old,
      this.price_sale,
      this.number,
      this.id,
      this.image,
      this.create_at});

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  String sum_price_order;
  String sum_price_delivery;
  int total = 0;

  Future<List> _deleteProduct() async {
    final response = await http.post(Url_deleteProduct, body: {
      "id": widget.id.toString(),
    });

    print('Data Detail Product == ${response.body}');
    print(
        'Data Detail Product ID ============================================= ${widget.id}');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ຂໍ້ມູນສີນຄ້າ'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.print,
              color: Colors.white,
            ),
            onPressed: () {
              //_listOrderPrice();
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Image.network(
                  'http://192.168.43.220/yakdai_api/public/${widget.image}'),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      'ຂໍ້ມູນສີນຄ້າ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //_listOrderPrice();
                    },
                    child: Icon(Icons.clear_all),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 0.2,
              margin: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 5),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ຊື່: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${widget.pro_name} ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ໝວດໝູ່: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${widget.type_pro}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ລາຄາຕົ້ນທືນ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${formatter.format(widget.price_old)} ກີບ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ລາຄາຂາຍ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${formatter.format(widget.price_sale)} ກີບ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ຈໍານວນ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${widget.number} ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 0.2,
              margin: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 5),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.border_color,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        //_listOrderPrice();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _onAlertButtonsDelete(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 50,
              child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.transparent)),
                  color: Color(0xFF29b6f6),
                  child: Text(
                    'ກັບຄືນ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  _onAlertButtonsDelete(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "ແຈ້ງເຕືອນ",
      desc: "ຕ້ອງການລົບລາຍການແທ້ບໍ",
      buttons: [
        DialogButton(
          child: Text(
            "ຍົກເລີກ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.redAccent,
        ),
        DialogButton(
          child: Text(
            "ຢືນຢັນ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            _deleteProduct();
//            Navigator.pop(context);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => ListPro()),
              ModalRoute.withName("/listPro"),
            );
          },
          gradient: LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
        )
      ],
    ).show();
  }
}
