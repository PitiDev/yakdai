import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/style/theme.dart' as Theme;
import 'package:app_yakdai/service/api.dart';
import 'package:app_yakdai/screen/order/list_order.dart';

class createOrder extends StatefulWidget {
  @override
  _createOrderState createState() => _createOrderState();
}

class _createOrderState extends State<createOrder> {
  String msg = '', msg_ip = '';
  String user, status, token;

  Future<List> _addOrder() async {
    final response = await http.post(Url_AddOrder, body: {
      "cus_id": id_cus.text,
      "pro_id": id_pro.text,
      "number": number.text,
      "pro_size": size.text,
      "detail": detail.text
    });

    if (response.statusCode == 200) {
      print("Add Order OK Success");
    } else {
      print("Add Order Failed");
    }
  }

  TextEditingController id_cus = TextEditingController();
  TextEditingController id_pro = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController detail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ເພີ່ມການສັ່ງສີນຄ້າ'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(msg),
            ),
            SizedBox(
              height: 5.0,
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
                      controller: id_cus,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Id ລູກຄ້າ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.perm_identity,
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
                      controller: id_pro,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Id ສິນຄ້າ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.videogame_asset,
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
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "ຈໍານວນ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.format_list_numbered,
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
                      controller: size,
                      decoration: InputDecoration(
                        hintText: "ຂະຫນາດ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.format_size,
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
                      controller: detail,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: "ລາຍລະອຽດ",
                        border: InputBorder.none,
                        icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.dashboard,
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
              margin: EdgeInsets.only(top: 10.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.Colors.loginGradientStart,
                    blurRadius: 20.0,
                  ),
                ],
                gradient: new LinearGradient(
                  colors: [
                    Theme.Colors.loginBtnStart,
                    Theme.Colors.loginBtnEnd
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: MaterialButton(
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "ເພີ່ມລາຍການສັ່ງເຄື່ອງ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                onPressed: () => setState(() {
                  print('Add Order ============ Add Order');
                  _addOrder();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 20,
                            ),
                            Text("ກໍາລັງອັບໂຫລດຂໍ້ມູນ..........."),
                          ],
                        ),
                      );
                    },
                  );

                  new Future.delayed(new Duration(seconds: 3), () {
//                    Navigator.of(context).push(
//                      new MaterialPageRoute(
//                        //Passing Data to Detail
//                        builder: (context) => new listOrder(),
//
//                      ),
//                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => listOrder()),
                      ModalRoute.withName("/listOrder"),
                    );
                  });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
