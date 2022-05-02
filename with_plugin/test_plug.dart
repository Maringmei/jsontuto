import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'modals/user.dart';

const NESTED_JSON =
    '[{"name":"User One","phone":"7777777777","email":"userone@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Two","phone":"8888888888","email":"usertwo@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Three","phone":"9999999999","email":"userthree@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}},{"name":"User Four","phone":"4444444444","email":"userfour@gmail.com","subscription":true,"address":{"street":"Some Street","landmark":"Some Landmark","city":"Some City","state":"Some City"}}]';

class MyHomePage extends StatelessWidget {
  late dynamic a;
  Future<List<User>> getDataFromFakeServer() async {
    return await Future.delayed(Duration(seconds: 2), () {
      List<dynamic> data = jsonDecode(NESTED_JSON);

      List<User> users = data.map((data) => User.fromJson(data)).toList();
      print(users[0].phone);
      a = users;
      return users;
    });
  }

  Future<List<User>> getjson() async {
    String url = "https://maringmei.000webhostapp.com/jsonTest/testThree.json";
    Response response = await http.get(Uri.parse(url.toString()));
    List<dynamic> redData = jsonDecode(response.body);
    List<User> users = redData.map((data) => User.fromJson(data)).toList();
    a = users;
    print("HELLLLp");
    print(users[0].address.visit[0].place);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dynamic"),
        ),
        body: Container(
          child: FutureBuilder(
              future: getjson(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  var userList = a;
                  return Text('asdf');
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
