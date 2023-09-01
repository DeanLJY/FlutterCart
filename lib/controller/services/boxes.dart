import 'package:hive/hive.dart';
import 'package:flutter_cart/model/cart_model.dart';

/// A utility class providing access to the Hive box for storing cart data.
class Boxes {
  /// Gets the Hive box for storing [FlutterCartItem] data.
  ///
  /// Returns a [Box] instance for interacting with the cart data stored in Hive.
  static Box<FlutterCartItem> getData() =>
      Hive.box<FlutterCartItem>('cartBox');
}
