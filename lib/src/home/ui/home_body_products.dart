import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/widgets/progress_widget.dart';
import 'package:proyecto_administracion/src/home/widgets/snackbar_widget.dart';

import 'category/ui/category_screen.dart';
import 'product/ui/product_screen.dart';

class HomeBodyProducts extends StatelessWidget {
  const HomeBodyProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is Failure) {
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
        print(context.bloc<HomeBloc>().saleModel);
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
    );
  }

  Widget _categoryBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.1,
      child: CategoryBody(),
    );
  }

  Widget _productBody(BuildContext context) {
    return ProductBody();
  }
}
