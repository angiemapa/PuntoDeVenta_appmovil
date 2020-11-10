import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserScreen extends StatelessWidget {
  Widget textfield({@required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Perfil",
            style: TextStyle(
                color: Color(0xFF17252A),
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFfeffff),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                      hintText: "nombre y apellido",
                    ),
                    textfield(
                      hintText: "correo electrónico",
                    ),
                    textfield(
                      hintText: "número de teléfono",
                    ),
                    textfield(
                      hintText: "dirección",
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xffBC0B0B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            "Cerrar Sesión",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                /*child: Text(
                     "peril",
                     style: TextStyle(
                       fontSize: 35,
                       letterSpacing: 1.5,
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                       ),
                   )*/
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                  //aquí sustituir imagen obtenida de bd/firebase
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/profile.jpg"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(Icons.edit, color: Colors.white),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff42D9C8);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
