import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_cart/controller/services/boxes.dart';
import 'package:flutter_cart/model/cart_model.dart';

class CartController {
  final Box<CartModel> _cartBox = Boxes.getData();

  ValueListenable<Box<CartModel>> get cartListenable => _cartBox.listenable();

  Future<void> updateCart(LineItems product) async {
    CartModel? existingCart;

    var box = Hive.box<CartModel>('cartBox');

    for (var cart in box.values) {
      if (cart.lineItems!.any((item) => item.productId == product.productId)) {
        existingCart = cart;
        break;
      }
    }

    // If the item is in the cart, remove it
    if (existingCart != null) {
      existingCart.lineItems!
          .removeWhere((item) => item.productId == product.productId);
      await box.put(existingCart.key, existingCart);
      print('Item removed from cart: ${product.productId}');
    } else {
      // If the item is not in the cart, add it
      CartModel cartModel = box.isNotEmpty ? box.getAt(0)! : CartModel();
      cartModel.lineItems ??= [];
      cartModel.lineItems!.add(LineItems.fromJson(product.toJson()));
      await box.put(0, cartModel);
      print('Item added to cart: ${product.productId}');
    }
    await updateTotalPrice();
  }

  bool isItemExistsInCart(String productId) {
    var box = Hive.box<CartModel>('cartBox');

    for (var cart in box.values) {
      if (cart.lineItems!.any((item) => item.productId == productId)) {
        return true;
      }
    }
    return false;
  }

  int getCartItemCount() {
    var cart = Hive.box<CartModel>('cartBox').isNotEmpty
        ? Hive.box<CartModel>('cartBox').getAt(0)
        : null;
    return cart?.lineItems?.length ?? 0;
  }

  //  decrement product quantity in cart
  void decrementQuantity(String productId) {
    _updateQuantity(productId, -1);
    updateTotalPrice();
  }

  void incrementQuantity(String productId) {
    _updateQuantity(productId, 1);
    // After updating the quantity, call updateTotalPrice
    updateTotalPrice();
  }

  void _updateQuantity(String productId, int change) {
    var box = Hive.box<CartModel>('cartBox');
    for (var cart in box.values) {
      for (var item in cart.lineItems!) {
        if (item.productId == productId) {
          item.quantity = (item.quantity ?? 0) + change;

          // Ensure the quantity doesn't go below 0
          item.quantity = item.quantity! < 0 ? 0 : item.quantity;

          box.put(cart.key, cart);
          print('Quantity updated for $productId: ${item.quantity}');
          return;
        }
      }
    }
  }

  // Function to remove a product from the cart by its product ID
  Future<bool> removeProduct(String productId) async {
    var box = Hive.box<CartModel>('cartBox');
    for (var cart in box.values) {
      for (var item in cart.lineItems!) {
        if (item.productId == productId) {
          cart.lineItems!.remove(item);
          box.put(cart.key, cart);
          print('Product removed from cart: $productId');
          // After removing the product, call updateTotalPrice
          await updateTotalPrice();
          return true; // Indicate that removal was successful
        }
      }
    }

    return false; // Indicate that the product was not found in the cart
  }

  // Function to calculate and update the total price in the cart
  Future<void> updateTotalPrice() async {
    var box = Hive.box<CartModel>('cartBox');

    // Retrieve the CartModel from Hive
    CartModel? cartModel = box.isNotEmpty ? box.getAt(0) : null;

    if (cartModel != null) {
      // Calculate the total price
      TotalPrice totalPriceObject = calculateTotalPrice(cartModel.lineItems);

      // Update the CartModel with the calculated total price
      cartModel.totalPrice = totalPriceObject;

      // Put the updated CartModel back into Hive
      await box.put(0, cartModel);

      print('Total price updated: ${totalPriceObject.centAmount}');
    }
  }

  // Function to calculate total price based on line items
  TotalPrice calculateTotalPrice(List<LineItems>? lineItems) {
    int totalAmount = 0;

    if (lineItems != null) {
      for (var item in lineItems) {
        int itemTotalAmount =
            (item.quantity ?? 0) * (item.totalPrice?.centAmount ?? 0);
        totalAmount += itemTotalAmount;
      }
    }

    // Dummy tax calculation
    int taxAmount = (totalAmount * 0.0).round(); // 10% tax, adjust accordingly

    // Creating a totalPrice object with calculated values
    TotalPrice totalPriceObject = TotalPrice(
      type: 'dummy',
      currencyCode: 'USD',
      centAmount: totalAmount + taxAmount,
      fractionDigits: 2,
    );

    return totalPriceObject;
  }

  // Function to get the total price from the cart
  TotalPrice? getTotalPrice() {
    var box = Hive.box<CartModel>('cartBox');

    // Retrieve the CartModel from Hive
    CartModel? cartModel = box.isNotEmpty ? box.getAt(0) : null;

    // Return the total price from the CartModel
    return cartModel?.totalPrice;
  }
}
