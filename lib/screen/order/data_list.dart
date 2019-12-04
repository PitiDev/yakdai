import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:app_yakdai/screen/order/detail_order.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  Future<List> _listPro() async {
    final response = await http.post(Url_ListOrder, body: {
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
          height: 525,
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
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        final image = list[i]['cus_image'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${Url_image}$image'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                list[i]['name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'ວັນທີສັ່ງ: ${list[i]['date_order']}',
                style: TextStyle(color: Colors.pinkAccent),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    //Passing Data to Detail
                    builder: (context) => new DetailOrder(
                      name: list[i]['name'],
                      phone: list[i]['phone'],
                      address: list[i]['address'],
                      cus_id: list[i]['cus_id'],
                      image: list[i]['cus_image'],
                      date_order: list[i]['date_order'],
                    ),
                  ),
                );
              },
              selected: true,
            ),
            Text('ສະຖານະ: ${list[i]['status']}'),
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
