import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';

import 'package:proyecto_administracion/src/home/data/models/models.dart';

part 'item_card_widget.dart';

class CategoryBody extends StatefulWidget {
  CategoryBody({
    Key key,
  }) : super(key: key);

  @override
  _CategoryBodyState createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  ScrollController controllerCategory;
  CategoryModel model;

  @override
  void initState() {
    super.initState();
    this.model = BlocProvider.of<HomeBloc>(context).catModel;
    controllerCategory = ScrollController();
    controllerCategory.addListener(() {
      if (controllerCategory.position.pixels ==
              controllerCategory.position.maxScrollExtent &&
          BlocProvider.of<HomeBloc>(context).state != InProgressPagination()) {
        context.bloc<HomeBloc>().add(LoadPagination(true));
        print("ALGO");
        setState(() {
          this.model = BlocProvider.of<HomeBloc>(context).catModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controllerCategory,
      scrollDirection: Axis.horizontal,
      itemCount: model.results.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ItemCardWidget(model: model.results[index]));
      },
    );
  }
}
