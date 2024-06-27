import 'package:shoes/model/product.dart';

class ProductService {
  static List<Product> products = <Product>[];
  static final ProductService _singleton = ProductService._internal();

  factory ProductService() => _singleton;

  ProductService._internal();

  static List<Product> getALL() {
    products.add(
        Product(1, 'lib/assets/images/nike1.jpeg', 'Nike Air Force 1', 2300));
    products.add(
        Product(2, 'lib/assets/images/nike2.jpeg', 'Nike Air Force 2', 5000));
    products.add(
        Product(3, 'lib/assets/images/nike3.jpeg', 'Nike Air Force 3', 4300));
    products.add(Product(
        4, 'lib/assets/images/shoes1.jped.avif', 'Nike Air Force 4', 1300));
    products.add(
        Product(5, 'lib/assets/images/shoes2.avif', 'Nike Air Force 5', 1300));
    return products;
  }
}
