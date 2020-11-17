part of 'models.dart';

class SaleModel {
  List<DetailSaleModel> detail = List<DetailSaleModel>();
  double total;
  SaleModel({
    @required this.total,
  });

  void addDetailSale(ProductResultModel product, int amount){
    this.total+=amount*product.precio;
    this.detail.add(DetailSaleModel(amount: amount, product: product));
  }
  void removeDetailSale(int position, ProductResultModel product){
    this.total-=this.detail[position].amount*product.precio;
    this.detail.removeAt(position);
  }
  void changeDetailSale(int position,int amount){
    this.total-=this.detail[position].amount*this.detail[position].product.precio;
    this.total+=amount*this.detail[position].product.precio;
    this.detail[position].amount=amount;
  }

  @override
  String toString() => 'SaleModel(detail: $detail, total: $total)';
}
