/// The main library for the fluttercart package.
/// Provides functionality to manage a shopping cart using Hive for local storage.
library flutter_cart;

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cart/controller/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/widgets/cart_list.dart';

// Extension method for Iterable class
extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}

/// The main class for interacting with the fluttercart.
class FlutterCart {
  /// Initializes Hive and opens the cart box.
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    // Register the adapters
    Hive.registerAdapter(FlutterCartItemAdapter());
    //open cart box
    await Hive.openBox<FlutterCartItem>('cartBox');
  }

  /// Adds a [FlutterCartItem] to the shopping cart.
  Future<void> addToCart(FlutterCartItem cartItem) async {
    CartController().addToCart(cartItem);
    log('CartItem added to Hive box: ${cartItem.toJson()}');
  }

  /// Removes a product from the shopping cart.
  Future<bool> removeFromCart(String productId) async {
    bool removed = CartController().removeFromCart(productId);
    if (removed) {
      log('CartItem removed from Hive box: $productId');
    } else {
      log('Product not found in the cart: $productId');
    }
    return removed;
  }

  /// Increments the quantity of a cart item.
  Future<void> incrementCartItemQuantity(String productId) async {
    CartController().incrementQuantity(productId);
    log('CartItem quantity incremented: $productId');
  }

  /// Decrements the quantity of a cart item.
  Future<void> decrementCartItemQuantity(String productId) async {
    CartController().decrementQuantity(productId);
    log('CartItem quantity decremented: $productId');
  }

  /// Calculates the total price of all items in the shopping cart.
  double calculateTotalPrice() {
    return CartController().calculateTotalPrice();
  }

  /// Gets the total number of items in the shopping cart.
  int getCartItemCount() {
    return CartController().getCartItemCount();
  }

  /// Clears all items from the shopping cart.
  void clearCart() {
    CartController().clearCart();
  }

  /// Retrieves the cart data including items and total price.
  Map<String, dynamic> getCartData() {
    final cartController = CartController();

    // Get the list of cart items
    List<FlutterCartItem> cartItems = cartController.getCartItems();

    // Get the total price
    double totalPrice = cartController.calculateTotalPrice();

    // Return a map with cart data and total price
    return {
      'cartItems': cartItems,
      'totalPrice': totalPrice,
    };
  }

  /// Displays the list of cart items using the provided widgets.
  Widget showCartItems({
    required Widget Function({required FlutterCartItem data})
        cartTileWidget,
    required Widget showEmptyCartMsgWidget,
  }) {
    return ListCartItems(
      cartTileWidget: cartTileWidget,
      showEmptyCartMsgWidget: showEmptyCartMsgWidget,
    );
  }

  /// Displays the current cart item count using the provided widget builder.
  Widget showCartItemCountWidget(
      {required Widget Function(int itemCount) cartItemCountWidgetBuilder}) {
    return ValueListenableBuilder<Box<FlutterCartItem>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        var itemCount = CartController().getCartItemCount();
        return cartItemCountWidgetBuilder(itemCount);
      },
    );
  }

  /// Displays the total amount in the cart using the provided widget builder.
  Widget showTotalAmountWidget(
      {required Widget Function(double totalAmount)
          cartTotalAmountWidgetBuilder}) {
    return ValueListenableBuilder<Box<FlutterCartItem>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        double totalAmount = CartController().getTotalPrice();
        return cartTotalAmountWidgetBuilder(totalAmount);
      },
    );
  }

  /// Displays an icon button based on whether a product is in the cart or not.
  Widget showAndUpdateCartItemWidget({
    required Widget inCartWidget,
    required Widget notInCartWidget,
    required FlutterCartItem product,
  }) {
    return ValueListenableBuilder<Box<FlutterCartItem>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        bool existsInCart =
            CartController().isItemExistsInCart(product.productId);

        return IconButton(
          onPressed: () async {
            existsInCart
                ? await removeFromCart(product.productId)
                : await addToCart(product);
          },
          icon: existsInCart ? inCartWidget : notInCartWidget,
        );
      },
    );
  }
}
