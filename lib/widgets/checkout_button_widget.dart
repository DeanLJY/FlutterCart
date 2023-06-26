import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/controller/services/cart_controller.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_cart/res/components/round_button.dart';

class CheckoutButton extends StatelessWidget {
  final VoidCallback onPress;

  CheckoutButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final CartController _cartController = CartController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 40, left: 20),
      height: 160,
      width: size.width,
      color: Colors.grey.shade100,
      child: Center(
        child: SizedBox(
          width: size.width / 1.25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder<Box<CartModel>>(
                valueListenable: _cartController.cartListenable,
                builder: (context, box, child) {
                  var totalAmount = _cartController.getTotalPrice();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total: \$${totalAmount?.centAmount?.toStringAsFixed(2) ?? '0.00'}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  );
                },
              ),
              RoundButton(onPress: onPress, title: 'Checkout'),
            ],
          ),
        ),
      ),
    );
  }
}
