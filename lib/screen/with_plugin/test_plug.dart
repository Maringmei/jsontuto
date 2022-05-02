import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jsontuto/screen/with_plugin/details_page.dart';
import 'modals/user.dart';

const NESTED_JSON =
    '[{"name":"User One","phone":"7777777777","email":"userone@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Two","phone":"8888888888","email":"usertwo@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Three","phone":"9999999999","email":"userthree@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Four","phone":"4444444444","email":"userfour@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}}]';

class MyHomePage extends StatelessWidget {
  late dynamic a;
  Future<List<User>> getDataFromFakeServer() async {
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = jsonDecode(NESTED_JSON);

      List<User> users = data.map((data) => User.fromJson(data)).toList();
      print(users);
      a = users;
      return users;
    });
  }


  Future<List<User>> getjson() async {
    String url = "https://maringmei.000webhostapp.com/jsonTest/testTwo.json";
    Response response = await http.get(Uri.parse(url.toString()));
    List<dynamic> redData = jsonDecode(response.body);
      List<User> users = redData.map((data) => User.fromJson(data)).toList();
    a = users;
      print(users);
      return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Json Serialization"),
        ),
        body: Container(
          child: FutureBuilder(
            future: getjson(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState != ConnectionState.waiting) {
                var userList = a;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      var userData = userList[index];
                      return ExpansionTile(
                        key: Key("$index"),
                        title: Text(userData.name ?? ""),
                        subtitle: Text(userData.email ?? ""),
                        children: <Widget>[
                          Container(
                            color: Colors.grey.withAlpha(55),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(userData)));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Street: ${userData.address.street}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "Landmark: ${userData.address.landmark}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("City: ${userData.address.city}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("State: ${userData.address.state}"),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              }else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
        ),
      ),
    );
  }
}
