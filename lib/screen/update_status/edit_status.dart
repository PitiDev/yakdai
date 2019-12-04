import 'package:app_yakdai/screen/product/create.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app_yakdai/screen/product/list.dart';
import 'package:app_yakdai/alert/alert.dart';
import 'package:app_yakdai/alert/alert_fail.dart';

final formatter = new NumberFormat("#,###");

class EditProduct extends StatefulWidget {
  final id;
  final image;
  final pro_name;
  final type_pro;
  final price_old;
  final price_sale;
  final delivery_price;
  final number;
  final status;
  final create_at;

  EditProduct(
      {this.pro_name,
      this.type_pro,
      this.price_old,
      this.price_sale,
      this.delivery_price,
      this.number,
      this.status,
      this.id,
      this.image,
      this.create_at});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  String sum_price_order;
  String sum_price_delivery;
  int total = 0;

  String StatusCode;

  TextEditingController price_old;
  TextEditingController price_sale;
  TextEditingController number_pro;
  TextEditingController logistic;

  @override
  void initState() {
    //controllerUsername= new TextEditingController(text: widget.list[widget.index]['username'] );
    price_old = TextEditingController(text: widget.price_old.toString());
    price_sale = TextEditingController(text: widget.price_sale.toString());
    number_pro = TextEditingController(text: widget.number.toString());
    logistic = TextEditingController(text: widget.delivery_price.toString());
    super.initState();
  }

  String _radioValue; //Initial definition of radio button value
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'ກໍາລັງສັ່ງ':
          choice = value;
          break;
        case 'ຈັດຊື້ສໍາເລັດ':
          choice = value;
          break;
        case 'ສີນຄ້າຮອດສາງລາວ':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  Future<List> _updateProduct() async {
    final response = await http.post(update_pro_status, body: {
      "id": widget.id.toString(),
      "price_old": price_old.text,
      "price_sale": price_sale.text,
      "delivery_price": logistic.text,
      "number": number_pro.text,
      "status": choice.toString()
    });

    setState(() {
      StatusCode = json.decode(response.body);
    });

    print('StatusCode === ${StatusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ອັບເດດສີນຄ້າ'),
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
              child: Image.network('${Url_image}${widget.image}'),
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
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'ສະຖານະ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${widget.status} ',
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
              margin: EdgeInsets.all(2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1.0,
                child: Center(
                  child: Padding(
                    //Add padding around textfield
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: price_old,
                      decoration: InputDecoration(
                        hintText: "ລາຄາຕົ້ນທືນ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1.0,
                child: Center(
                  child: Padding(
                    //Add padding around textfield
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: price_sale,
                      decoration: InputDecoration(
                        hintText: "ລາຄາຂາຍ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1.0,
                child: Center(
                  child: Padding(
                    //Add padding around textfield
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: logistic,
                      decoration: InputDecoration(
                        hintText: "ຄ່າຂົນສົ່ງ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.directions_car,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 1.0,
                child: Center(
                  child: Padding(
                    //Add padding around textfield
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: number_pro,
                      decoration: InputDecoration(
                        hintText: "ລະຫັດສີນຄ້າ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.keyboard_hide,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'ສະຖານະສີນຄ້າ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 'ກໍາລັງສັ່ງ',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "ກໍາລັງສັ່ງ",
                ),
                Radio(
                  value: 'ຈັດຊື້ສໍາເລັດ',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "ຈັດຊື້ສໍາເລັດ",
                ),
                Radio(
                  value: 'ສີນຄ້າຮອດສາງລາວ',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "ສີນຄ້າຮອດສາງລາວ",
                ),
              ],
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
                    'ອັບເດດ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    _updateProduct();

                    new Future.delayed(new Duration(seconds: 2), () {
                      if (StatusCode == 'success') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialog(
                            buttonText: "Okay",
                          ),
                        );

                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => CustomDialogFail(
                            buttonText: "Okay",
                          ),
                        );
                      }
                    });
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
}


