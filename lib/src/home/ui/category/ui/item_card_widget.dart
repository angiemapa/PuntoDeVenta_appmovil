part of 'category_screen.dart';

class ItemCardWidget extends StatelessWidget {
  final CategoryResultModel model;
  ItemCardWidget({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 60,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: FlutterLogo()),
        Text(
          "${model.categoria}",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
