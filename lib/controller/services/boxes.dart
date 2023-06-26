import 'package:hive/hive.dart';
import 'package:flutter_cart/model/cart_model.dart';

class Boxes {
  static Box<CartModel> getData() => Hive.box<CartModel>('cartBox');
}
