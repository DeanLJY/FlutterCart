import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/controller/services/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';

class ListCartItems extends StatelessWidget {
  final Widget Function({required LineItems data}) cartTileWidget;
  final Widget showEmptyCartMsgWidget;

  const ListCartItems({
    Key? key,
    required this.cartTileWidget,
    required this.showEmptyCartMsgWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: CartController().cartListenable,
      builder: (context, box, child) {
        if (box.isNotEmpty) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, cartIndex) {
              var cart = box.getAt(cartIndex);
              if (cart != null &&
                  cart.lineItems != null &&
                  cart.lineItems!.isNotEmpty) {
                return Column(
                  children: [
                    for (var data in cart.lineItems!)
                      cartTileWidget(data: data),
                    const SizedBox(
                      height: 126,
                    ),
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
