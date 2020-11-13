import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/data/models/models.dart';
import 'package:proyecto_administracion/src/home/data/repositories/repository.dart';
import 'package:proyecto_administracion/src/home/ui/home_screen.dart';
import 'package:proyecto_administracion/src/login/ui/login_screen.dart';

import '../login/ui/list_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "Login": (BuildContext context) => LoginScreen(),
    "Home": (BuildContext context) {
      return BlocProvider(
        create: (context) => HomeBloc(
          ProductRepository(),
          CategoryRepository(),
          CategoryModel(count: 0, next: null, previous: null, results: null),
          ProductModel(count: 0, next: null, previous: null, results: null),
        ),
        child: HomeScreen(),
      );
    },
    "List/Screen": (BuildContext context) => List(),
  };
}
