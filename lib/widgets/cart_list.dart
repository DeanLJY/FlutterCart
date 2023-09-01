import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/controller/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';

/// A widget that displays a list of cart items using a provided tile widget.
///
/// This widget listens to changes in the cart and updates the UI accordingly.
class ListCartItems extends StatelessWidget {
  /// The widget builder function for each cart item.
  final Widget Function({required FlutterCartItem data})
      cartTileWidget;

  /// The widget to display when the cart is empty.
  final Widget showEmptyCartMsgWidget;

  /// Creates a [ListCartItems] instance.
  ///
  /// The [cartTileWidget] is a builder function for each cart item, and [showEmptyCartMsgWidget] is displayed when the cart is empty.
  const ListCartItems({
    Key? key,
    required this.cartTileWidget,
    required this.showEmptyCartMsgWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<FlutterCartItem>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        if (box.isNotEmpty) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, cartIndex) {
              var cartItem = box.getAt(cartIndex);
              if (cartItem != null) {
                return Column(
                  children: [
                    cartTileWidget(data: cartItem),
                  ],
                );
              } else {
                return showEmptyCartMsgWidget;
              }
            },
          );
        } else {
          return showEmptyCartMsgWidget;
        }
      },
    );
  }
}
