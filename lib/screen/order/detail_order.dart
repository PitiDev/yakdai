import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:app_yakdai/screen/order/list_order.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:app_yakdai/screen/product/detail_product.dart';

final formatter = new NumberFormat("#,###");

class DetailOrder extends StatefulWidget {
  final cus_id;
  final image;
  final name;
  final phone;
  final address;
  final date_order;

  DetailOrder(
      {this.name,
      this.phone,
      this.address,
      this.cus_id,
      this.image,
      this.date_order});

  @override
  _DetailOrderState createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
  String sum_price_order;
  String sum_price_delivery;
  int total = 0;

  String StatusCode;

  String _radioValue; //Initial definition of radio button value
  String choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'ກໍາລັງສັ່ງ':
          choice = value;
          break;
        case 'ກໍາລັງຈັດຊື້':
          choice = value;
          break;
        case 'ລໍຖ້າຮັບເຄື່ອງ':
          choice = value;
          break;

        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  Future<List> _listOrder() async {
    final response = await http.post(Url_ListOrder_Detail, body: {
      "name": widget.cus_id.toString(),
    });

    var data_order = json.decode(response.body);
    var order_return = data_order['listOrder'];
    var sum_price = json.decode(response.body);
    //print('Data Detail Order == ${response.body}');
    // print('Data Detail Order ID ===================== ${widget.cus_id}');

    setState(() {
      sum_price_order = sum_price['sum_price'];
      sum_price_delivery = sum_price['sum_price_delivery'];
      total = sum_price['total'];
    });

    return order_return;
  }

  //update Status
  Future<List> _update_status_order() async {
    final response = await http.post(update_status_order, body: {
      "cus_id": widget.cus_id.toString(),
      "status": choice.toString()
    });

    setState(() {
      StatusCode = json.decode(response.body);
    });

    print('StatusCode === ${StatusCode}');
  }

  //Confrim Order Success
  Future<List> _successOrder() async {
    final response = await http.post(Url_Order_success, body: {
      "cus_id": widget.cus_id.toString(),
    });

    print('Data Detail Order == ${response.body}');
    print(
        'Data Detail Order ID ============================================= ${widget.cus_id}');
    //return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    final data_listOrder = new FutureBuilder<List>(
      future: _listOrder(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? new ServiceHome(
                list: snapshot.data,
              )
            : new Center(
                child: new CircularProgressIndicator(),
              );
      },
    );

    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ລາຍການສັ່ງສີນຄ້າ'),
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
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ClipOval(
                      child: Image.network(
                        '${Url_image}${widget.image}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ໄອດີ: ${widget.cus_id}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ຊື່: ${widget.name}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ເບີໂທ: ${widget.phone}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ທີ່ຢູ່: ${widget.address}',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'ວັນທີສັ່ງເຄື່ອງ: ${widget.date_order}',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Center(
                  child: Text(
                    'ລາຍການສັ່ງ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              height: 300,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: data_listOrder,
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      'ລາຄາ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //_listOrderPrice();
                    },
                    child: Container(
                      // margin: EdgeInsets.only(right: 10),
                      height: 30,
                      child: RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.transparent)),
                          color: Color(0xFF29b6f6),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.cached,
                                color: Colors.white,
                              ),
                              Text(
                                'ກົດຄິດໄລ່ລາຄາ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          onPressed: () {
                            _listOrder();
                          }),
                    ),
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
                    'ລວມລາຄາສີນຄ້າ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${(sum_price_order)} ກີບ',
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
                    'ຄ່າຂົນສົ່ງຈາກຈີນ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${sum_price_delivery} ກີບ',
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
                    'ລວມລາຄາທັງໝົດ: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${formatter.format(total)} ກີບ',
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
                  value: 'ກໍາລັງຈັດຊື້',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "ກໍາລັງຈັດຊື້",
                ),

                Radio(
                  value: 'ລໍຖ້າຮັບເຄື່ອງ',
                  groupValue: _radioValue,
                  onChanged: radioButtonChanges,
                ),
                Text(
                  "ສີນຄ້າຮອດສາງລາວ",
                ),

                //ສົ່ງເຄື່ອງສໍາເລັດ
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
                    'ອັບເດດສະຖານະລູກຄ້າ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    _update_status_order();

                    new Future.delayed(new Duration(seconds: 2), () {
                      if (StatusCode == 'success') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.golf_course,
                                    color: Colors.greenAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text("ອັບເດດສາຖານະສໍາເລັດ"),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.golf_course,
                                    color: Colors.redAccent,
                                    size: 60,
                                  ),
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "!! ອັບເດດສາຖານະບໍ່ສໍາເລັດ",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 50,
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.blue,
                  child: Text(
                    'ສົ່ງເຄື່ອງລູກຄ້າ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      print(' Order ============ Successs');

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text("Loading"),
                                )
                              ],
                            ),
                          );
                        },
                      );

                      new Future.delayed(new Duration(seconds: 3), () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => listOrder()),
                          ModalRoute.withName("/listOrder"),
                        );
                        //Navigator.pop(context);
                      });
                      _successOrder();
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

class ServiceHome extends StatelessWidget {
  final List list;

  ServiceHome({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        final image = list[i]['image'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${Url_image}$image'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                list[i]['pro_name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ລາຄາ: ${formatter.format(list[i]['price_sale'])} Kip',
                style: TextStyle(color: Colors.pinkAccent),
              ),
              trailing: Column(
                children: <Widget>[
                  Text('ໄອດີ'),
                  Text(
                    '${list[i]['pro_id']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    //Passing Data to Detail
                    builder: (context) => new DetailProduct(
                      pro_name: list[i]['pro_name'],
                      type_pro: list[i]['type_pro'],
                      id: list[i]['id'],
                      image: list[i]['image'],
                      price_old: list[i]['price_old'],
                      price_sale: list[i]['price_sale'],
                      number: list[i]['number'],
                      create_at: list[i]['create_at'],
                    ),
                  ),
                );
              },
              selected: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              height: 0.2,
              width: 300,
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }
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
        onPressed: () {},
        gradient: LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
      )
    ],
  ).show();
}
