import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  String? type;
  @HiveField(1)
  String? id;
  @HiveField(2)
  int? version;
  @HiveField(3)
  String? createdAt;
  @HiveField(4)
  String? lastModifiedAt;
  @HiveField(5)
  LastModifiedBy? lastModifiedBy;
  @HiveField(6)
  CreatedBy? createdBy;
  @HiveField(7)
  List<LineItems>? lineItems;
  @HiveField(8)
  String? cartState;
  @HiveField(9)
  TotalPrice? totalPrice;
  @HiveField(10)
  String? shippingMode;
  @HiveField(11)
  List<ItemShippingAddresses>? itemShippingAddresses;
  @HiveField(12)
  String? inventoryMode;
  @HiveField(13)
  String? taxMode;
  @HiveField(14)
  String? taxRoundingMode;
  @HiveField(15)
  String? taxCalculationMode;
  @HiveField(16)
  String? origin;

  CartModel(
      {this.type,
      this.id,
      this.version,
      this.createdAt,
      this.lastModifiedAt,
      this.lastModifiedBy,
      this.createdBy,
      this.lineItems,
      this.cartState,
      this.totalPrice,
      this.shippingMode,
      this.itemShippingAddresses,
      this.inventoryMode,
      this.taxMode,
      this.taxRoundingMode,
      this.taxCalculationMode,
      this.origin});

  CartModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    version = json['version'];
    createdAt = json['createdAt'];
    lastModifiedAt = json['lastModifiedAt'];
    lastModifiedBy = json['lastModifiedBy'] != null
        ? new LastModifiedBy.fromJson(json['lastModifiedBy'])
        : null;
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    if (json['lineItems'] != null) {
      lineItems = <LineItems>[];
      json['lineItems'].forEach((v) {
        lineItems!.add(new LineItems.fromJson(v));
      });
    }
    cartState = json['cartState'];
    totalPrice = json['totalPrice'] != null
        ? new TotalPrice.fromJson(json['totalPrice'])
        : null;
    shippingMode = json['shippingMode'];
    if (json['itemShippingAddresses'] != null) {
      itemShippingAddresses = <ItemShippingAddresses>[];
      json['itemShippingAddresses'].forEach((v) {
        itemShippingAddresses!.add(new ItemShippingAddresses.fromJson(v));
      });
    }
    inventoryMode = json['inventoryMode'];
    taxMode = json['taxMode'];
    taxRoundingMode = json['taxRoundingMode'];
    taxCalculationMode = json['taxCalculationMode'];
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['version'] = this.version;
    data['createdAt'] = this.createdAt;
    data['lastModifiedAt'] = this.lastModifiedAt;
    if (this.lastModifiedBy != null) {
      data['lastModifiedBy'] = this.lastModifiedBy!.toJson();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.lineItems != null) {
      data['lineItems'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    data['cartState'] = this.cartState;
    if (this.totalPrice != null) {
      data['totalPrice'] = this.totalPrice!.toJson();
    }
    data['shippingMode'] = this.shippingMode;
    if (this.itemShippingAddresses != null) {
      data['itemShippingAddresses'] =
          this.itemShippingAddresses!.map((v) => v.toJson()).toList();
    }
    data['inventoryMode'] = this.inventoryMode;
    data['taxMode'] = this.taxMode;
    data['taxRoundingMode'] = this.taxRoundingMode;
    data['taxCalculationMode'] = this.taxCalculationMode;
    data['origin'] = this.origin;
    return data;
  }
}

@HiveType(typeId: 1)
class LastModifiedBy extends HiveObject {
  @HiveField(0)
  bool? isPlatformClient;
  @HiveField(1)
  String? userId;
  @HiveField(2)
  String? username;

  LastModifiedBy({this.isPlatformClient, this.userId, this.username});

  LastModifiedBy.fromJson(Map<String, dynamic> json) {
    isPlatformClient = json['isPlatformClient'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPlatformClient'] = this.isPlatformClient;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}

@HiveType(typeId: 2)
class CreatedBy extends HiveObject {
  @HiveField(0)
  bool? isPlatformClient;
  @HiveField(1)
  String? userId;
  @HiveField(2)
  String? username;

  CreatedBy({this.isPlatformClient, this.userId, this.username});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    isPlatformClient = json['isPlatformClient'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPlatformClient'] = this.isPlatformClient;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}

@HiveType(typeId: 3)
class LineItems extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? productId;
  @HiveField(2)
  int? quantity;
  @HiveField(3)
  UnitPrice? unitPrice;
  @HiveField(4)
  TotalPrice? totalPrice;
  @HiveField(5)
  List<Discounts>? discounts;
  @HiveField(6)
  List<String>? imageUrls;

  // Additional fields
  @HiveField(7)
  String? title;
  @HiveField(8)
  String? description;
  @HiveField(9)
  double? rating;
  @HiveField(10)
  int? stock;
  @HiveField(11)
  String? brand;
  @HiveField(12)
  String? category;
  @HiveField(13)
  String? thumbnail;

  LineItems({
    this.id,
    this.productId,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
    this.discounts,
    this.imageUrls,
    this.title,
    this.description,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
  });

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'] != null
        ? new UnitPrice.fromJson(json['unitPrice'])
        : null;
    totalPrice = json['totalPrice'] != null
        ? new TotalPrice.fromJson(json['totalPrice'])
        : null;
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(new Discounts.fromJson(v));
      });
    }
    imageUrls = json['imageUrls'].cast<String>();

    // New fields
    title = json['title'];
    description = json['description'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.unitPrice != null) {
      data['unitPrice'] = this.unitPrice!.toJson();
    }
    if (this.totalPrice != null) {
      data['totalPrice'] = this.totalPrice!.toJson();
    }
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    data['imageUrls'] = this.imageUrls;

    // New fields
    data['title'] = this.title;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;

    return data;
  }
}

@HiveType(typeId: 4)
class UnitPrice extends HiveObject {
  @HiveField(0)
  String? type;
  @HiveField(1)
  String? currencyCode;
  @HiveField(2)
  int? centAmount;
  @HiveField(3)
  int? fractionDigits;

  UnitPrice(
      {this.type, this.currencyCode, this.centAmount, this.fractionDigits});

  UnitPrice.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    currencyCode = json['currencyCode'];
    centAmount = json['centAmount'];
    fractionDigits = json['fractionDigits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['currencyCode'] = this.currencyCode;
    data['centAmount'] = this.centAmount;
    data['fractionDigits'] = this.fractionDigits;
    return data;
  }
}

@HiveType(typeId: 5)
class Discounts extends HiveObject {
  @HiveField(0)
  String? code;
  @HiveField(1)
  UnitPrice? amount;

  Discounts({this.code, this.amount});

  Discounts.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    amount =
        json['amount'] != null ? new UnitPrice.fromJson(json['amount']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 6)
class TotalPrice extends HiveObject {
  @HiveField(0)
  String? type;
  @HiveField(1)
  String? currencyCode;
  @HiveField(2)
  int? centAmount;
  @HiveField(3)
  int? fractionDigits;
  @HiveField(4)
  Tax? tax;

  TotalPrice(
      {this.type,
      this.currencyCode,
      this.centAmount,
      this.fractionDigits,
      this.tax});

  TotalPrice.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    currencyCode = json['currencyCode'];
    centAmount = json['centAmount'];
    fractionDigits = json['fractionDigits'];
    tax = json['tax'] != null ? new Tax.fromJson(json['tax']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['currencyCode'] = this.currencyCode;
    data['centAmount'] = this.centAmount;
    data['fractionDigits'] = this.fractionDigits;
    if (this.tax != null) {
      data['tax'] = this.tax!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 7)
class Tax extends HiveObject {
  @HiveField(0)
  String? type;
  @HiveField(1)
  int? percentage;

  Tax({this.type, this.percentage});

  Tax.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['percentage'] = this.percentage;
    return data;
  }
}

@HiveType(typeId: 8)
class ItemShippingAddresses extends HiveObject {
  @HiveField(0)
  String? itemId;
  @HiveField(1)
  Address? address;

  ItemShippingAddresses({this.itemId, this.address});

  ItemShippingAddresses.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 9)
class Address extends HiveObject {
  @HiveField(0)
  String? street;
  @HiveField(1)
  String? city;
  @HiveField(2)
  String? postalCode;
  @HiveField(3)
  String? country;

  Address({this.street, this.city, this.postalCode, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    postalCode = json['postalCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['country'] = this.country;
    return data;
  }
}
