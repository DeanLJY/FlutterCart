// flutter_cart.dart
library flutter_cart;

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cart/controller/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/widgets/cart_list.dart';

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

class FlutterCart {
  // Initialize hive
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    // Register the adapters
    Hive.registerAdapter(FlutterCartItemAdapter());
    //open cart box
    await Hive.openBox<FlutterCartItem>('cartBox');
  }

  Future<void> addToCart(FlutterCartItem cartItem) async {
    CartController().addToCart(cartItem);
    log('CartItem added to Hive box: ${cartItem.toJson()}');
  }

  Future<bool> removeFromCart(String productId) async {
    bool removed = CartController().removeFromCart(productId);
    if (removed) {
      log('CartItem removed from Hive box: $productId');
    } else {
      log('Product not found in the cart: $productId');
    }
    return removed;
  }

  Future<void> incrementCartItemQuantity(String productId) async {
    CartController().incrementQuantity(productId);
    log('CartItem quantity incremented: $productId');
  }

  Future<void> decrementCartItemQuantity(String productId) async {
    CartController().decrementQuantity(productId);
    log('CartItem quantity decremented: $productId');
  }

  double calculateTotalPrice() {
    return CartController().calculateTotalPrice();
  }

  int getCartItemCount() {
    return CartController().getCartItemCount();
  }

  void clearCart() {
    CartController().clearCart();
  }

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

  Widget showCartItemCountWidget({required Widget Function(int itemCount) cartItemCountWidgetBuilder}) {
    return ValueListenableBuilder<Box<FlutterCartItem>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        var itemCount = CartController().getCartItemCount();
        return cartItemCountWidgetBuilder(itemCount);
      },
    );
  }

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
