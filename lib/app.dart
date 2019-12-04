import 'package:flutter/material.dart';
import 'package:app_yakdai/screen/login.dart';
import 'package:app_yakdai/screen/home/home.dart';
import 'package:app_yakdai/screen/product/list.dart';
import 'package:app_yakdai/screen/product/create.dart';
import 'package:app_yakdai/screen/register.dart';
import 'package:app_yakdai/screen/customer/create.dart';
import 'package:app_yakdai/screen/customer/list_cus.dart';
import 'package:app_yakdai/screen/order/createOrder.dart';
import 'package:app_yakdai/screen/order/list_order.dart';
import 'package:app_yakdai/screen/tracking/list_tracking.dart';
import 'package:app_yakdai/screen/update_status/list_update_pro.dart';
import 'package:app_yakdai/screen/stock/list_stock.dart';
import 'package:app_yakdai/screen/update_status/edit_status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'BoonBaan',
        primarySwatch: Colors.blue,
      ),

      routes: <String, WidgetBuilder>{
        '/home': (_) => new HomePage(),
        '/logIn': (_) => new LoginPage(),
        '/listPro': (_) => new ListPro(),
        '/createPro': (_) => new CreatePro(),
        '/register': (_) => new Register(),
        '/createCus': (_) => new CreateCus(),
        '/listCus': (_) => new listCus(),
        '/createOrder': (_) => new createOrder(),
        '/listOrder': (_) => new listOrder(),
        '/listTracking': (_) => new ListTracking(),
        '/updatePro': (_) => new UpdatePro(),
        'editStatus': (_) => new EditProduct(),
        '/listStock': (_) => new ListStock()
      },

      home: LoginPage(),
    );
  }
}
