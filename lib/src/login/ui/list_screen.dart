import 'package:flutter/material.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () => {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(),
              ),
            ),
          ),
        ],
      ),
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
        Text(
          'Precio \$\$\$',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
