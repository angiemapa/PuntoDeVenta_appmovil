import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/category/ui/category_screen.dart';
import 'package:proyecto_administracion/src/home/ui/product/ui/product_screen.dart';
import 'package:proyecto_administracion/src/home/widgets/progress_widget.dart';
import 'package:proyecto_administracion/src/home/widgets/snackbar_widget.dart';

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
                Icons.refresh,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () => context.bloc<HomeBloc>().add(LoadInitial()),
              tooltip: "Recargar",
            ),
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
              title: Text("Categoría"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Carrito"),
            )
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is Failure) {
              print(":V");
              SnackbarWidget(
                context: context,
                text: state.error,
                color: Colors.red,
              ).showSnackbar();
            } else if (state is NoMoreData) {
              SnackbarWidget(
                context: context,
                text: state.error,
                color: Colors.orange[300],
              ).showSnackbar();
            }
          },
          builder: (context, state) {
            if (state is HomeInitial)
              context.bloc<HomeBloc>().add(LoadInitial());
            else if (state is InProgress)
              return ProgressWidget(title: "Cargando datos");
            else if (state is Failure)
              return Container(
                child: Center(
                  child: Text("${state.error}"),
                ),
              );
            return Column(
              children: [_categoryBody(context), _productBody(context)],
            );
          },
        ));
  }

  Widget _categoryBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.width * 0.25,
      color: Color(0xFFe9ecef),
      child: CategoryBody(),
    );
  }

  Widget _productBody(BuildContext context) {
    return Container(
      color: Color(0xffe9ecef),
      height: MediaQuery.of(context).size.height * 0.71,
      child: ProductBody(),
    );
  }
}
