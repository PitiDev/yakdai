import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(' EEE d MMM').format(now);
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('images/icon_report/growth.png',width: 55,
                  ),
                  title: Text('ລາຍງານທັງໝົດ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  subtitle: Text(formattedDate),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: () {
                    //Navigator.pushNamed(context, '/listPro');
                  },
                  selected: true,
                ),
              ),
            ),
            //SizedBox(height: 5,),
            Container(
              margin: EdgeInsets.only(top: 8,left: 20,right: 20),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('images/icon_report/analytics.png',width: 55,
                  ),
                  title: Text('ລາຍງານການສັ່ງຈອ່ງ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  subtitle: Text(formattedDate),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: () {
                    //Navigator.pushNamed(context, '/listPro');
                  },
                  selected: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8,left: 20,right: 20),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('images/icon_report/wallet.png',width: 55,
                  ),
                  title: Text('ລາຍງານການເງິນ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  subtitle: Text(formattedDate),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: () {
                    //Navigator.pushNamed(context, '/listPro');
                  },
                  selected: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8,left: 20,right: 20),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: Image.asset('images/icon_report/box.png',width: 55,
                  ),
                  title: Text('ສິນຄ້າທີ່ມາຮັບເຄື່ອງແລ້ວ',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                  subtitle: Text(formattedDate),
                  trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
                  onTap: () {
                    //Navigator.pushNamed(context, '/listPro');
                  },
                  selected: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
