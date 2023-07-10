import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/controller/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';

class ListCartItems extends StatelessWidget {
  final Widget Function({required FlutterCartItem data})
      cartTileWidget;
  final Widget showEmptyCartMsgWidget;

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
