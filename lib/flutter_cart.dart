// flutter_cart.dart

library flutter_cart;

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cart/controller/services/boxes.dart';
import 'package:flutter_cart/controller/services/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/widgets/cart_list.dart';
import 'package:flutter_cart/widgets/checkout_button_widget.dart';

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
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  Future<void> registerAdapters() async {
    // Register all adapters
    Hive.registerAdapter(CartModelAdapter());
    Hive.registerAdapter(LastModifiedByAdapter());
    Hive.registerAdapter(CreatedByAdapter());
    Hive.registerAdapter(LineItemsAdapter());
    Hive.registerAdapter(UnitPriceAdapter());
    Hive.registerAdapter(DiscountsAdapter());
    Hive.registerAdapter(TotalPriceAdapter());
    Hive.registerAdapter(TaxAdapter());
    Hive.registerAdapter(ItemShippingAddressesAdapter());
    Hive.registerAdapter(AddressAdapter());
  }

  Future<void> openCartBox() async {
    await Hive.openBox<CartModel>('cartBox');
  }

  Future<void> addCartToBox(CartModel cartModel) async {
    final box = Boxes.getData();

    // Check if a cart with the same ID already exists in the Hive box
    final existingCart = box.values.firstWhereOrNull(
      (cart) => cart.id == cartModel.id,
    );

    if (existingCart == null) {
      // If the cart doesn't exist in the Hive box, add it
      box.add(cartModel);
      log('Cart added to Hive box: ${cartModel.toJson()}');
    } else {
      log('Cart with ID ${cartModel.id} already exists in Hive box.');
    }
  }

  Future<String> readJsonFromAsset(String assetPath) async {
    try {
      return await rootBundle.loadString(assetPath);
    } catch (e) {
      log('Error reading JSON asset: $e');
      return ''; // Return an empty string or handle the error as needed
    }
  }

  Widget showCartItems({
    required Widget Function({required LineItems data}) cartTileWidget,
    required Widget showEmptyCartMsgWidget,
  }) {
    return ListCartItems(
      cartTileWidget: cartTileWidget,
      showEmptyCartMsgWidget: showEmptyCartMsgWidget,
    );
  }

  Widget showCheckoutButton({required VoidCallback onPress}) {
    return CheckoutButton(onPress: onPress);
  }

  Widget showCartItemCountWidget(
      {required Widget Function(int itemCount) cartItemCountWidgetBuilder}) {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, child) {
        var itemCount = CartController().getCartItemCount();
        return cartItemCountWidgetBuilder(itemCount);
      },
    );
  }

  Widget showAndUpdateCartItemWidget({
    required Widget inCartWidget,
    required Widget notInCartWidget,
    required LineItems product,
  }) {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, box, child) {
        bool existsInCart =
            CartController().isItemExistsInCart(product.productId.toString());

        return IconButton(
          onPressed: () async {
            CartController().updateCart(product);
          },
          icon: existsInCart ? inCartWidget : notInCartWidget,
        );
      },
    );
  }
}
