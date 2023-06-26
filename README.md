# FlutterCart: Your Mobile Shopping Companion

FlutterCart is a versatile Flutter package that brings robust shopping cart capabilities to your mobile application. It leverages Hive for local storage, ensuring your shopping cart data is retained across different app sessions.

## Key Features

- **Initialization**: Kickstart the shopping cart with the `init()` method.
- **Cart Operations**: Include items to the cart with `addToCart`, and remove them using `removeFromCart`.
- **Quantity Control**: Fine-tune the item quantity with `incrementCartItemQuantity` and `decrementCartItemQuantity`.
- **Total Price Calculation**: Fetch the total price of cart items using `calculateTotalPrice`.
- **Item Count**: Retrieve the total number of items with `getCartItemCount`.
- **Cart Clearance**: Wipe out all items from the cart with `clearCart`.
- **Cart Item Display**: Visualize the cart items with `showCartItems`, offering customizable widgets for individual cart items and an empty cart message.
- **Item Count Widget**: Display a widget featuring the current cart item count using `showCartItemCountWidget`.
- **Total Amount Widget**: Showcase a widget revealing the total amount of items in the cart with `showTotalAmountWidget`.
- **Dynamic Cart Item Widget**: Illustrate a widget that updates based on whether a product is in the cart or not, using `showAndUpdateCartItemWidget`.
- **Cart Data Retrieval**: Use `getCartData` in the `FlutterCart` class to fetch a list of cart items and the total price.

## How to Get Started

1. Incorporate the package in your Dart file:

```dart
import 'package:flutter_cart/flutter_cart.dart';
```

2. Set the ball rolling by initializing the cart:

```dart
await FlutterCart().init();
```

3. You're all set to harness the shopping cart features in your application!

## Usage Examples

```dart
// Add products to the cart
await FlutterCart().addToCart(FlutterCartItem());

// Eliminate a product from the cart
await FlutterCart().removeFromCart(productId);

// Increase the product quantity in the cart
await FlutterCart().incrementCartItemQuantity(productId);

// Reduce the product quantity in the cart
await FlutterCart().decrementCartItemQuantity(productId);

// Fetch the total price of cart items
double totalPrice = FlutterCart().calculateTotalPrice();

// Get the total quantity of cart items
int itemCount = FlutterCart().getCartItemCount();

// Empty the cart
FlutterCart().clearCart();

// Fetch cart data and total price
Map<String, dynamic> cartData = FlutterCart().getCartData();
List<FlutterCartItem> cartItems = cartData['cartItems'];
double totalPriceFromData = cartData['totalPrice'];
```

## Widgets

### Cart Item Display

```dart
FlutterCart().showCartItems(
  cartTileWidget: ({required FlutterCartItem data}) {
    // Your personalized cart item widget
  },
  showEmptyCartMsgWidget: YourEmptyCartMessageWidget(),
);
```

### Cart Item Count Widget

```dart
FlutterCart().showCartItemCountWidget(
  cartItemCountWidgetBuilder: (int itemCount) {
    // Your personalized widget displaying the cart item count
  },
);
```

### Total Amount Widget

```dart
FlutterCart().showTotalAmountWidget(
  cartTotalAmountWidgetBuilder: (double totalAmount) {
    // Your personalized widget displaying the total amount
  },
);
```

### Dynamic Cart Item Widget

```dart
FlutterCart().showAndUpdateCartItemWidget(
  inCartWidget: YourInCartWidget(),
  notInCartWidget: YourNotInCartWidget(),
  product: yourProduct,
);
```

"Simplify your mobile shopping experience with FlutterCart!"
