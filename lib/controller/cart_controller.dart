import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/model/cart_model.dart';

class CartController {

  final Box<FlutterCartItem> _cartBox =
      Hive.box<FlutterCartItem>('cartBox');

  ValueListenable<Box<FlutterCartItem>> get cartListenable =>
      _cartBox.listenable();

  void addToCart(FlutterCartItem item) {
    // Retrieve the existing item using the product ID as the key
    FlutterCartItem? existingItem = _cartBox.get(item.productId);
    if (existingItem != null) {
      // Product is already in the cart, update the quantity
      existingItem.quantity = item.quantity; // Resetting the quantity:)
      _cartBox.put(
        existingItem.key,
        FlutterCartItem(
          productId: existingItem.productId,
          productDescription: existingItem.productDescription,
          quantity: 1,
          productName: existingItem.productName,
          productDetails: existingItem.productDetails,
          productImages: existingItem.productImages,
          unitPrice: existingItem.unitPrice,
          productThumbnail: existingItem.productThumbnail,
        ),
      );
    } else {
      // Product is not in the cart, add a new instance
      _cartBox.put(
          item.key,
          FlutterCartItem(
            productId: item.productId,
            quantity: 1,
            productName: item.productName,
            unitPrice: item.unitPrice,
            productDescription: item.productDescription,
            productDetails: item.productDetails,
            productImages: item.productImages,
            productThumbnail: item.productThumbnail,
          ));
    }
  }

  // Function to remove a product from the cart
  bool removeFromCart(String productId) {
    if (_cartBox.keys.contains(productId)) {
      _cartBox.delete(productId);
      return true; // Product successfully removed
    } else {
      return false; // Product not found in the cart
    }
  }

  void incrementQuantity(String productId) {
    FlutterCartItem? item = _cartBox.get(productId);
    if (item != null) {
      item.increment();
      _cartBox.put(item.key, item);
    }
  }

  void decrementQuantity(String productId) {
    FlutterCartItem? item = _cartBox.get(productId);
    if (item != null) {
      if (item.quantity > 1) {
        item.decrement();
        _cartBox.put(item.key, item);
      } else {
        // Optionally, we can remove the item from the cart if the quantity is 1
        // removeProduct(productId);
      }
    }
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var i = 0; i < _cartBox.length; i++) {
      total += _cartBox.getAt(i)!.totalPrice;
    }
    return total;
  }

  int getCartItemCount() {
    return _cartBox.length;
  }

  bool isItemExistsInCart(String productId) {
    return _cartBox.keys.contains(productId);
  }

  // Function to remove a product from the cart
  bool removeProduct(String productId) {
    if (_cartBox.keys.contains(productId)) {
      _cartBox.delete(productId);
      return true; // Product successfully removed
    } else {
      return false; // Product not found in the cart
    }
  }

  // Function to get the total price from the cart
  double getTotalPrice() {
    var box = Hive.box<FlutterCartItem>('cartBox');

    double totalAmount = 0;

    // Iterate through each item in the cart and calculate the total price
    for (var i = 0; i < box.length; i++) {
      FlutterCartItem item = box.getAt(i)!;
      totalAmount += item.totalPrice;
    }

    return totalAmount;
  }

  // Function to clear all items from the cart
  void clearCart() {
    _cartBox.clear();
  }
}
