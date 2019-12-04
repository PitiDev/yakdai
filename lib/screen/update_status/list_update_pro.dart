import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_yakdai/service/api.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:app_yakdai/screen/update_status/edit_status.dart';

class UpdatePro extends StatefulWidget {
  @override
  _UpdateProState createState() => _UpdateProState();
}

class _UpdateProState extends State<UpdatePro> {
  Future<List> _listPro() async {
    final response = await http.post(Url_update_status, body: {
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
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        elevation: 1.0,
        backgroundColorStart: Color(0xFF29b6f6),
        backgroundColorEnd: Color(0xFF03a9f4),
        title: Text('ອັບເດດສີນຄ້າ'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5.0,
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
            height: 560,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: data_listPro,
          ),
        ],
      ),
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
            Container(
              //margin: EdgeInsets.only(),
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
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
                  subtitle: Text('ສະຖານະ:  ${list[i]['status']}'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        //Passing Data to Detail
                        builder: (context) => new EditProduct(
                          pro_name: list[i]['pro_name'],
                          type_pro: list[i]['type_pro'],
                          id: list[i]['id'],
                          image: list[i]['image'],
                          price_old: list[i]['price_old'],
                          price_sale: list[i]['price_sale'],
                          delivery_price: list[i]['delivery_price'],
                          number: list[i]['number'],
                          status: list[i]['status'],
                          create_at: list[i]['create_at'],
                        ),
                      ),
                    );
                  },
                  selected: true,
                ),
              ),
            ),

//            Container(
//              margin: EdgeInsets.only(top: 5, bottom: 10),
//              height: 0.2,
//              width: 300,
//              color: Colors.grey,
//            ),
          ],
        );
      },
    );
  }
}
