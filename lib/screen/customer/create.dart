import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:app_yakdai/style/theme.dart' as Theme;
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
import 'package:app_yakdai/screen/customer/list_cus.dart';
import 'package:app_yakdai/service/api.dart';

class CreateCus extends StatefulWidget {
  @override
  _CreateCusState createState() => _CreateCusState();
}

TextEditingController name = new TextEditingController();
TextEditingController phone = new TextEditingController();
TextEditingController address = new TextEditingController();
TextEditingController image = new TextEditingController();

class _CreateCusState extends State<CreateCus> {
  File _image;
  TextEditingController cTitle = new TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    //Navigator.of(context).pop();
  }

  Future _createCus(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse(Url_CreateCustomer);

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("cus_image", stream, length,
        filename: basename(imageFile.path));
    request.fields['name'] = name.text;
    request.fields['phone'] = phone.text;
    request.fields['address'] = address.text;
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }

    print(response);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ເພີ່ມລູກຄ້າ'),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        child: prefix0.SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 800.0
                ? MediaQuery.of(context).size.height
                : 900.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Center(
                      child: OutlineButton(
                        onPressed: getImage,
                        child: Text('ເລືອກຮູບພາບ'),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Center(
                    child: _image == null
                        ? new Text("No image selected!")
                        : new Image.file(_image),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Card(
                          elevation: 2.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 25.0, right: 25.0),
                                  child: TextField(
                                    controller: name,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon%2Fpro.png?alt=media&token=12aecd00-1851-4f12-acfb-d0b37c772e2d',
                                        width: 30,
                                      ),
                                      hintText: "ຊື່ລູກຄ້າ",
                                      hintStyle: TextStyle(fontSize: 17.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 25.0, right: 25.0),
                                  child: TextField(
                                    controller: phone,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon%2Ftype_pro.png?alt=media&token=18c9fbe4-e533-4c63-b1c3-2a240193ec4c',
                                        width: 30,
                                      ),
                                      hintText: "ເບີໂທ",
                                      hintStyle: TextStyle(fontSize: 17.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0, left: 25.0, right: 25.0),
                                  child: TextField(
                                    controller: address,
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon%2Funit.png?alt=media&token=cc69a7b1-9ec7-40e5-ae76-50ac2c839207',
                                        width: 30,
                                      ),
                                      hintText: "ທີ່ຢູ່",
                                      hintStyle: TextStyle(fontSize: 17.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  height: 1.0,
                                  color: Colors.grey[400],
                                  margin: EdgeInsets.only(bottom: 50),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 30.0, bottom: 20),
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Theme.Colors.loginGradientStart,
                                        offset: Offset(1.0, 6.0),
                                        blurRadius: 20.0,
                                      ),
                                    ],
                                    gradient: new LinearGradient(
                                        colors: [
                                          Theme.Colors.loginBtnStart,
                                          Theme.Colors.loginBtnEnd
                                        ],
                                        begin: const FractionalOffset(0.2, 0.2),
                                        end: const FractionalOffset(1.0, 1.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: MaterialButton(
                                    highlightColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 42.0),
                                      child: Text(
                                        "ເພີ່ມລູກຄ້າ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () => setState(() {
                                      _createCus(_image);
                                      print(
                                          'OKOKOKO PITI ============ Insert OK');

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                CircularProgressIndicator(),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                    "ກໍາລັງອັບໂຫລດຂໍ້ມູນ..........."),
                                              ],
                                            ),
                                          );
                                        },
                                      );

                                      new Future.delayed(
                                          new Duration(seconds: 3), () {
//                                        Navigator.pop(context); //pop dialog
//                                        Navigator.pushNamed(context, '/listCus');
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => listCus()),
                                          ModalRoute.withName("/listCus"),
                                        );
                                      });
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
