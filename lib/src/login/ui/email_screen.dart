import 'package:flutter/material.dart';

class Emailscreen extends StatefulWidget {
  @override
  _EmailscreenState createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {
  bool mostrar = true;
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        title: Text(
          "Volver",
          style: TextStyle(color: Color(0xFF2b7a78)),
        ),
      ),
      body: SafeArea(child: _body(context)),
      backgroundColor: Colors.white,
    );
  }

  void mostrardatos() {
    setState(() {
      mostrar = !mostrar;
    });
  }

  final _formKey = GlobalKey<FormState>();

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Crea tu cuenta UWU',
              style: TextStyle(fontSize: 30, color: Color(0xFF2b7a78)),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    "Nombre Completo",
                    //textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1,
            ),
            /*TextFielWidget(
              labelText: "Nombre y Apellido",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 18,
            ),*/
            Container(
              width: MediaQuery.of(context).size.width / 1.05,
              height: MediaQuery.of(context).size.height / 18,
              child: TextFormField(
                decoration: new InputDecoration(
                  labelText: "Nombre y Apellido",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(100),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Text(
                    'Telefono',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "+502",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.23,
                  height: MediaQuery.of(context).size.height / 18,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Telefono",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(100),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Dirección',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: MediaQuery.of(context).size.height / 18,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Direccion",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(100),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Correo Electrónico',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: MediaQuery.of(context).size.height / 18,
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Correo Electronico",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(100),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Text(
                        'Contraseña',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                /*TextFielWidget(
                      labelText: "Contraseña4",
                      hinText: "***************",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 18,
                      suffixIcon: IconButton(
                        icon: mostrar
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: mostrardatos,
                      ),
                      obscureText: mostrar == true ? mostrar : false,
                    ),*/
                Container(
                  width: MediaQuery.of(context).size.width / 1.05,
                  height: MediaQuery.of(context).size.height / 18,
                  child: TextFormField(
                    obscureText: mostrar == true ? mostrar : false,
                    decoration: new InputDecoration(
                      suffixIcon: IconButton(
                        icon: mostrar
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: mostrardatos,
                      ),
                      labelText: "Contraseña",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(100),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 251,
                  height: 50,
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Crear Usuario",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                    color: Color(0xFF17252A),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).popAndPushNamed("Home");
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
