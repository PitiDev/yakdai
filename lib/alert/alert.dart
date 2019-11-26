import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



 _onAlertButtonsPressed(context) {
  Alert(
    context: context,
    type: AlertType.warning,
    title: "ແຈ້ງເຕືອນ",
    desc: "ຕ້ອງການສົ່ງສິນຄ້າແທ້ບໍ",
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
//          Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(builder: (context) => LoginPage()),
//            ModalRoute.withName("/Home"),
//          );
        },
        gradient: LinearGradient(colors: [Colors.lightBlue, Colors.blue]),
      )
    ],
  ).show();
}