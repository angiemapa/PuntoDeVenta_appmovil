import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/category/bloc/category_bloc.dart';
import 'package:proyecto_administracion/src/home/ui/category/data/models/category_model.dart';
import 'package:proyecto_administracion/src/home/ui/category/data/repository/category_repository.dart';
import 'package:proyecto_administracion/src/home/ui/home_screen.dart';
import 'package:proyecto_administracion/src/login/ui/login_screen.dart';

import '../login/ui/list_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "Login": (BuildContext context) => LoginScreen(),
    "Home": (BuildContext context) {
      return BlocProvider(
        create: (context) => CategoryBloc(
          repository: CategoryRepository(),
          model: CategoryModel(
            count: null,
            next: null,
            previous: null,
            results: null,
          ),
        ),
        child: HomeScreen(),
      );
    },
    "List/Screen": (BuildContext context) => List(),
  };
}
