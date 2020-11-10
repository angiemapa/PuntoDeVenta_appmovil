import 'package:flutter/material.dart';

import 'package:proyecto_administracion/src/home/ui/category/data/models/result_model.dart';

class ItemCardWidget extends StatelessWidget {
  final ResultModel model;
  ItemCardWidget({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset('assets/images/facebook.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 7.0),
          child: Text(
            "${model.categoria}",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
