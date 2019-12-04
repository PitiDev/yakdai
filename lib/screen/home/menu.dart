import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.asset('images/icon/box1.png',width: 55,
            ),
            title: Text('ເພີ່ມສີນຄ້າເຄື່ອງໃຫ້ລູກຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, '/listPro');
            },
            selected: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 0.2,
            width: 300,
            color: Colors.grey,
          ),
          ListTile(
            leading: Image.asset('images/icon/order.png',width: 55,
            ),
            title: Text('ສັ່ງເຄື່ອງໃຫ້ລູກຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, '/listOrder');
            },
            selected: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 0.2,
            width: 300,
            color: Colors.grey,
          ),
          ListTile(
            leading: Image.asset('images/icon/tracking.png',width: 55,
            ),
            title: Text('ຕີດຕາມສີນຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, '/listTracking');
            },
            selected: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 0.2,
            width: 300,
            color: Colors.grey,
          ),
          ListTile(
            leading: Image.asset('images/icon/design.png',width: 55,
            ),
            title: Text('ອັບເດດລະຫັດສີນຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, '/updatePro');
            },
            selected: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 0.2,
            width: 300,
            color: Colors.grey,
          ),
          ListTile(
            leading: Image.asset('images/icon/stock.png',width: 55,
            ),
            title: Text('ສີນຄ້າຮອດສາງ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, '/listStock');
            },
            selected: true,
          ),
        ],
      ),
    );
  }
}
