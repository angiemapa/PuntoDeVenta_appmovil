import 'package:flutter/material.dart';
import 'package:proyecto_administracion/src/login/ui/seguircomprando_screen.dart';
import 'package:proyecto_administracion/src/login/ui/user_screen.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  int _posicion = 0;
  final items = <Widget>[
    UserScreen(),
    _body(),
    SeguirComprando(),
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: null)
        ],
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _posicion = index;
          });
        },
        elevation: 0,
        currentIndex: 2,
        iconSize: 36,
        backgroundColor: Color(0xff17252A),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black54,
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
      body: items[_posicion],
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
  }) : super(key: key);

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
            'Facebook',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class _body extends StatefulWidget {
  @override
  __bodyState createState() => __bodyState();
}

class __bodyState extends State<_body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/iconos/regresar.jpg",
            ),
            onPressed: () => {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _body1(context),
    );
  }
}

Widget _body1(BuildContext context) {
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
            itemCount: 15,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCard(),
          ),
        ),
      ),
    ],
  );
}