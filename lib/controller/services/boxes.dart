import 'package:hive/hive.dart';
import 'package:flutter_cart/model/cart_model.dart';

class Boxes {
  static Box<FlutterCartItem> getData() => Hive.box<FlutterCartItem>('cartBox');
}
