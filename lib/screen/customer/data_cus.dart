import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataCus extends StatefulWidget {
  @override
  _DataCusState createState() => _DataCusState();
}

class _DataCusState extends State<DataCus> {
  Future<List> _listPro() async {
    final response = await http.get("http://127.0.0.1:8000/api/list-pro");
//    print("Response status: ${response.statusCode}");
//    print("Response body: ${response.body}");

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

    return Container(
      height: 600,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: data_listPro,
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
        final image = list[i]['image'];
        return Column(
          children: <Widget>[
            ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage:
              NetworkImage('http://localhost/yakdai_api/public/$image'),
              backgroundColor: Colors.transparent,
            ),
              title: Text(
                list[i]['name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('haha'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print('ສັ່ງເຄື່ອງໃຫ້ລູກຄ້າ');
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
