import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:app_yakdai/screen/product/detail_product.dart';

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  Future<List> _listPro() async {
    final response = await http.post(Url_listProduct, body: {
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
//      scrollDirection: Axis.horizontal,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        final image = list[i]['image'];
        int number = list[i]['number'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${Url_image}$image'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                list[i]['pro_name'],
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Id: ${list[i]['id']} | ລາຄາຂາຍ: ${list[i]['price_sale']} KIP'),
              trailing: Column(
                children: <Widget>[
                  Text('ຈໍານວນ'),
                  Text('$number')
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    //Passing Data to Detail
                    builder: (context) => new DetailProduct(
                      pro_name: list[i]['pro_name'],
                      type_pro: list[i]['type_pro'],
                      id: list[i]['id'],
                      image: list[i]['image'],
                      price_old: list[i]['price_old'],
                      price_sale: list[i]['price_sale'],
                      number: list[i]['number'],
                      status: list[i]['status'],
                      create_at: list[i]['create_at'],
                    ),
                  ),
                );
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
