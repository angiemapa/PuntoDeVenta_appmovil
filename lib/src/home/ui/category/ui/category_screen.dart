import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/home/ui/category/data/models/category_model.dart';
import 'package:proyecto_administracion/src/home/ui/category/widgets/item_card_widget.dart';

class CategoryBody extends StatelessWidget {
  final CategoryModel model;

  CategoryBody({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Hola",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2b7a78),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Paola",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF2b7a78),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "¿Qué te gustaría comprar?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF2b7a78),
                  ),
                )
              ],
            )
          ],
        )),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
              itemCount: model.results.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCardWidget(
                model: model.results[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
