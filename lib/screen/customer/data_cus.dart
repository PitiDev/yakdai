import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';

class DataCus extends StatefulWidget {
  @override
  _DataCusState createState() => _DataCusState();
}

class _DataCusState extends State<DataCus> {
  Future<List> _listPro() async {
    final response = await http.post(Url_Customer, body: {
      "name": search.text,
    });

    return json.decode(response.body);
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data_listPro = new FutureBuilder<List>(
      future: _listPro(),
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

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 3.0,
            child: Center(
              child: Padding(
                //Add padding around textfield
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "ຄົ້ນຫາ, ຊື່ ຫຼື ເບີໂທ",
                    border: InputBorder.none,
                    icon: CircleAvatar(
                      backgroundColor: Color(0xFF29b6f6),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text('ລູກຄ້າທັງໝົດ'),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/createCus');
                },
                child: Row(
                  children: <Widget>[Icon(Icons.add_box), Text('ເພີ່ມລູກຄ້າ',style: TextStyle(fontWeight: FontWeight.bold),)],
                ),
              ),
            )
          ],
        ),
        Container(
          height: 525,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: data_listPro,
        )
      ],
    );
  }
}

class ServiceHome extends StatelessWidget {
  final List list;

  ServiceHome({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
//      scrollDirection: Axis.horizontal,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        final image = list[i]['cus_image'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage:
                    NetworkImage('${Url_image}$image'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                list[i]['name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'ເບີໂທ: ${list[i]['phone']} |  ${list[i]['address']}'),
              trailing: Column(
                children: <Widget>[
                  Text('ໄອດີ'),
                  Text('${list[i]['id']}',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              onTap: () {

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
