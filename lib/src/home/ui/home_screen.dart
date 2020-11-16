import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/home_body_products.dart';

import 'Sale/seguircomprando_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _position = 0;
  List<Widget> bodies = [
    Center(
      child: Text("data"),
    ),
    HomeBodyProducts(),
    SeguirComprando(),
  ];

  @override
  void initState() {
    super.initState();
    this._position = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            _titleAppbar(),
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            (_position == 1)
                ? IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () =>
                        context.bloc<HomeBloc>().add(LoadInitial()),
                    tooltip: "Recargar",
                  )
                : Center(),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () => exit(1),
              tooltip: "Salir",
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _position = index;
            });
          },
          elevation: 0,
          currentIndex: _position,
          iconSize: 36,
          backgroundColor: Color(0xff17252A),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Usuairo"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Productos"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Carrito"),
            )
          ],
        ),
        body: bodies[_position]);
  }

  String _titleAppbar() {
    if (_position == 0)
      return "Usuario";
    else if (_position == 1)
      return "Productos";
    else
      return "Mi Orden";
  }
}
