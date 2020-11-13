import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_administracion/src/home/bloc/home_bloc.dart';
import 'package:proyecto_administracion/src/home/data/models/models.dart';
import 'package:proyecto_administracion/src/home/ui/product/ui/product_detail.dart';

class ProductBody extends StatefulWidget {
  ProductBody();

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  ProductModel model;
  ScrollController controllerProduct;
  List data;
  bool bandera = false;

  @override
  void initState() {
    super.initState();
    model = BlocProvider.of<HomeBloc>(context).prodModel;
    controllerProduct = ScrollController();
    controllerProduct.addListener(() {
      if (controllerProduct.position.pixels ==
              controllerProduct.position.maxScrollExtent &&
          BlocProvider.of<HomeBloc>(context).state != InProgressPagination()) {
        context.bloc<HomeBloc>().add(LoadPagination(false));
        setState(() {
          model = BlocProvider.of<HomeBloc>(context).prodModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        controller: controllerProduct,
        itemCount: model.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(
                model: model.results[index],
              ),
            ),
          ),
          child: Card(
              color: Color(0XFFf4f4f4),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: _productInfo(index)),
        ),
      ),
    );
  }

  Widget _productInfo(int index) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              child:
                  Image.memory(model.results[index].imagen, fit: BoxFit.cover)),
          Divider(
            color: Colors.black38,
          ),
          Container(
            height: 25,
            width: double.infinity,
            child: Text(
              "${model.results[index].nombre}",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: Text(
              model.results[index].descripcion ?? "Descripción del producto",
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
