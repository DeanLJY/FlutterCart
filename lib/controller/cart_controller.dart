import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/model/cart_model.dart';

/// Manages the shopping cart functionality, including adding, removing,
/// and updating items in the cart.
class CartController {
  /// The Hive box used to store cart items.
  final Box<FlutterCartItem> _cartBox =
      Hive.box<FlutterCartItem>('cartBox');

  /// A [ValueListenable] for the cart box, allowing widgets to listen for changes in the cart.
  ValueListenable<Box<FlutterCartItem>> get cartListenable =>
      _cartBox.listenable();

  /// Adds a [FlutterCartItem] to the shopping cart.
  ///
  /// If the product is already in the cart, it updates the quantity. If not, it adds a new instance.
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
            quantity: item.quantity,
            productName: item.productName,
            unitPrice: item.unitPrice,
            productDescription: item.productDescription,
            productDetails: item.productDetails,
            productImages: item.productImages,
            productThumbnail: item.productThumbnail,
          ));
    }
  }

  /// Removes a product from the shopping cart.
  ///
  /// Returns `true` if the product is successfully removed, `false` if the product is not found in the cart.
  bool removeFromCart(String productId) {
    if (_cartBox.keys.contains(productId)) {
      _cartBox.delete(productId);
      return true; // Product successfully removed
    } else {
      return false; // Product not found in the cart
    }
  }

  /// Increments the quantity of a cart item.
  void incrementQuantity(String productId) {
    FlutterCartItem? item = _cartBox.get(productId);
    if (item != null) {
      item.increment();
      _cartBox.put(item.key, item);
    }
  }

  /// Decrements the quantity of a cart item.
  ///
  /// Optionally, removes the item from the cart if the quantity becomes 1.
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

  /// Calculates the total price of all items in the shopping cart.
  double calculateTotalPrice() {
    double total = 0;
    for (var i = 0; i < _cartBox.length; i++) {
      total += _cartBox.getAt(i)!.totalPrice;
    }
    return total;
  }

  /// Gets the total number of items in the shopping cart.
  int getCartItemCount() {
    return _cartBox.length;
  }

  /// Checks if a product with the given [productId] exists in the shopping cart.
  bool isItemExistsInCart(String productId) {
    return _cartBox.keys.contains(productId);
  }

  /// Removes a product from the cart using the [productId].
  ///
  /// Returns `true` if the product is successfully removed, `false` if the product is not found in the cart.
  bool removeProduct(String productId) {
    if (_cartBox.keys.contains(productId)) {
      _cartBox.delete(productId);
      return true; // Product successfully removed
    } else {
      return false; // Product not found in the cart
    }
  }

  /// Gets the total price of all items in the shopping cart.
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

  /// Retrieves a list of [FlutterCartItem] from the shopping cart.
  List<FlutterCartItem> getCartItems() {
    List<FlutterCartItem> cartItems = [];

    for (var i = 0; i < _cartBox.length; i++) {
      FlutterCartItem item = _cartBox.getAt(i)!;
      cartItems.add(item);
    }

    return cartItems;
  }

  /// Clears all items from the shopping cart.
  void clearCart() {
    _cartBox.clear();
  }
}
