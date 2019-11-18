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
            leading: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon_menu%2Fbox1.png?alt=media&token=f4454d40-163c-4bd9-b1fe-d7d9d9af9e10',
              width: 55,
            ),
            title: Text('ເພີ່ມສີນຄ້າເຄື່ອງໃຫ້ລູກຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.keyboard_arrow_right),
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
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon_menu%2Forder.png?alt=media&token=65b3a641-7c5c-45de-9aca-9a00ff843f46'),
            title: Text('ສັ່ງເຄື່ອງໃຫ້ລູກຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right),
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
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon_menu%2Ftracking.png?alt=media&token=39770308-7e9f-4af9-8bca-95f65e15778e'),
            title: Text('ຕີດຕາມສີນຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('horse');
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
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon_menu%2Fdesign.png?alt=media&token=db8b115b-7541-4f64-9ada-c2e288b9b2d1'),
            title: Text('ອັບເດດລະຫັດສີນຄ້າ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('horse');
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
            leading: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/app-yakdai.appspot.com/o/icon_menu%2Fstock.png?alt=media&token=61991f1d-2507-4027-981e-3ef9ab837544'),
            title: Text('ສີນຄ້າຮອດສາງ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print('horse');
            },
            selected: true,
          ),
        ],
      ),
    );
  }
}
