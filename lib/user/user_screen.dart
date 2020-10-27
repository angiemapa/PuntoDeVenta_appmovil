//import 'dart:async';
//import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class User extends StatefulWidget{
  @override
  State createState() => UserState();
}

class UserState extends State<User>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Perfil de Usuario'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          //: _buildBody(),
        ));
  }

}
