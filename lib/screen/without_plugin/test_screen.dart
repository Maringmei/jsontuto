import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'Model/UserModel.dart';

class TestScreen extends StatelessWidget {

  UserModel userObject = new UserModel("123","Maringmei","maringmei@gmail.com");

  String userJSON = '{"id": "123", "fullname": "Rohit Semriwal", "email": "rohitsharma"}';

Future<dynamic> getjson() async {
  String url = "https://maringmei.000webhostapp.com/jsonTest/test.json";
Response response = await http.get(Uri.parse(url.toString()));
var redData = jsonDecode(response.body);
print(response.body);
if(response.statusCode == 200){

  return redData;
}else{
  print("Something has went wrong");
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              getjson();
              // Map<String, dynamic> userMap = userObject.toMap();
              // var json = jsonEncode(userMap);
              // print(json.toString());

            }, child: Text('Encode')),
            ElevatedButton(onPressed: (){
              var decoded = userJSON;
              Map<String, dynamic> userMap = decoded as Map<String, dynamic>;
              UserModel newUser = new UserModel.fromMap(userMap);
              print(newUser.toString());
            }, child: Text('Decode'))
          ],
        ),
      ),
    );
  }
}
