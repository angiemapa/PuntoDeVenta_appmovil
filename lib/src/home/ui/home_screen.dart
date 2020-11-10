import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/category/bloc/category_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/category/data/repository/category_repository.dart';
import 'package:proyecto_administracion/src/home/ui/category/ui/category_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _position = 0;

  @override
  void initState() {
    super.initState();
    this._position = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEFFFF),
        elevation: 0,
        actions: [
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
          CategoryRepository cat = CategoryRepository();
          cat.getCategories();
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
            title: Text("Categoría"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Carrito"),
          )
        ],
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is Initial) {
            context.bloc<CategoryBloc>().add(LoadInitialCategory());
          } else if (state is InProgress) {
            return Container(
              child: Center(
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text("Obteniendo Categorías"),
                    subtitle: Text("Cargando..."),
                    trailing: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          } else if (state is Success) {
            return CategoryBody(
              model: state.model,
            );
          }
        },
        listener: (context, state) {
          if (state is InProgress) {
            CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
