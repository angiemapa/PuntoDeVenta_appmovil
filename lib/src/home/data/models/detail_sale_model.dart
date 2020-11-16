part of 'models.dart';

class DetailSaleModel {
  ProductResultModel product;
  int amount;
  DetailSaleModel({
    this.product,
    this.amount,
  });

  @override
  String toString() => 'DetailSaleModel(product: $product, amount: $amount)';
}
