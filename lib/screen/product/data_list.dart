import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  Future<List> _listPro() async {
    final response =
        await http.post("http://127.0.0.1:8000/api/search-pro", body: {
      "name": search.text,
    });
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
    
  return Column(
    children: <Widget>[

      Container(
        margin: EdgeInsets.all(10),
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
                  hintText: "ຄົ້ນຫາ",
                  border: InputBorder.none,
                  icon: CircleAvatar(
                    backgroundColor: Color(0xFF1565c0),
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
      Container(
        height: 600,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: data_listPro,
      ),
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
        final image = list[i]['image'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: Image.network(
                'http://localhost/yakdai_api/public/$image',
                width: 55,
              ),
              title: Text(
                list[i]['name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  '${list[i]['type_pro']} | ລາຄາຂາຍ: ${list[i]['price_sale']} KIP'),
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
