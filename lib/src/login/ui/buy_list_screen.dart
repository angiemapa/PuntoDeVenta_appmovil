import 'package:flutter/material.dart';

class BuyList extends StatefulWidget {
  @override
  _BuyListState createState() => _BuyListState();
}

class _BuyListState extends State<BuyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TUS PEDIDOS",
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "ORDEN",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListaPedidos(),
            ),
            BottomNavigationBar(
              onTap: (index) {},
              elevation: 0,
              currentIndex: 2,
              iconSize: 36,
              backgroundColor: Color(0xff17252A),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.black54,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  title: Text("perfil"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text("lista"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text("lista"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListaPedidos extends StatelessWidget {
  const ListaPedidos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Id",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Text(
                  "Fecha",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Q Sub 100",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Estado",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Divider(
            thickness: 4,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Id",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Text(
                  "Fecha",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Q Sub 100",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Estado",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Divider(
            thickness: 4,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Id",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Text(
                  "Fecha",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Q Sub 100",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Estado",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Divider(
            thickness: 4,
          ),
        ],
      ),
    );
  }
}
