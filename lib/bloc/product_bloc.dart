import 'dart:async';

import 'package:shoes/data/product_service.dart';
import 'package:shoes/model/product.dart';

class ProductBloc{
final productsStreamController=StreamController.broadcast();

Stream get getStream=>productsStreamController.stream;
  
List<Product> getALL(){
  
  return ProductService.getALL();
}

}
final productBloc=ProductBloc();