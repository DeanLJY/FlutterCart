// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      type: fields[0] as String?,
      id: fields[1] as String?,
      version: fields[2] as int?,
      createdAt: fields[3] as String?,
      lastModifiedAt: fields[4] as String?,
      lastModifiedBy: fields[5] as LastModifiedBy?,
      createdBy: fields[6] as CreatedBy?,
      lineItems: (fields[7] as List?)?.cast<LineItems>(),
      cartState: fields[8] as String?,
      totalPrice: fields[9] as TotalPrice?,
      shippingMode: fields[10] as String?,
      itemShippingAddresses:
          (fields[11] as List?)?.cast<ItemShippingAddresses>(),
      inventoryMode: fields[12] as String?,
      taxMode: fields[13] as String?,
      taxRoundingMode: fields[14] as String?,
      taxCalculationMode: fields[15] as String?,
      origin: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.version)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.lastModifiedAt)
      ..writeByte(5)
      ..write(obj.lastModifiedBy)
      ..writeByte(6)
      ..write(obj.createdBy)
      ..writeByte(7)
      ..write(obj.lineItems)
      ..writeByte(8)
      ..write(obj.cartState)
      ..writeByte(9)
      ..write(obj.totalPrice)
      ..writeByte(10)
      ..write(obj.shippingMode)
      ..writeByte(11)
      ..write(obj.itemShippingAddresses)
      ..writeByte(12)
      ..write(obj.inventoryMode)
      ..writeByte(13)
      ..write(obj.taxMode)
      ..writeByte(14)
      ..write(obj.taxRoundingMode)
      ..writeByte(15)
      ..write(obj.taxCalculationMode)
      ..writeByte(16)
      ..write(obj.origin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LastModifiedByAdapter extends TypeAdapter<LastModifiedBy> {
  @override
  final int typeId = 1;

  @override
  LastModifiedBy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastModifiedBy(
      isPlatformClient: fields[0] as bool?,
      userId: fields[1] as String?,
      username: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LastModifiedBy obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isPlatformClient)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastModifiedByAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CreatedByAdapter extends TypeAdapter<CreatedBy> {
  @override
  final int typeId = 2;

  @override
  CreatedBy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatedBy(
      isPlatformClient: fields[0] as bool?,
      userId: fields[1] as String?,
      username: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreatedBy obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isPlatformClient)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatedByAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LineItemsAdapter extends TypeAdapter<LineItems> {
  @override
  final int typeId = 3;

  @override
  LineItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LineItems(
      id: fields[0] as String?,
      productId: fields[1] as String?,
      quantity: fields[2] as int?,
      unitPrice: fields[3] as UnitPrice?,
      totalPrice: fields[4] as TotalPrice?,
      discounts: (fields[5] as List?)?.cast<Discounts>(),
      imageUrls: (fields[6] as List?)?.cast<String>(),
      title: fields[7] as String?,
      description: fields[8] as String?,
      rating: fields[9] as double?,
      stock: fields[10] as int?,
      brand: fields[11] as String?,
      category: fields[12] as String?,
      thumbnail: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LineItems obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.unitPrice)
      ..writeByte(4)
      ..write(obj.totalPrice)
      ..writeByte(5)
      ..write(obj.discounts)
      ..writeByte(6)
      ..write(obj.imageUrls)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.stock)
      ..writeByte(11)
      ..write(obj.brand)
      ..writeByte(12)
      ..write(obj.category)
      ..writeByte(13)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LineItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnitPriceAdapter extends TypeAdapter<UnitPrice> {
  @override
  final int typeId = 4;

  @override
  UnitPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitPrice(
      type: fields[0] as String?,
      currencyCode: fields[1] as String?,
      centAmount: fields[2] as int?,
      fractionDigits: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnitPrice obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.currencyCode)
      ..writeByte(2)
      ..write(obj.centAmount)
      ..writeByte(3)
      ..write(obj.fractionDigits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DiscountsAdapter extends TypeAdapter<Discounts> {
  @override
  final int typeId = 5;

  @override
  Discounts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Discounts(
      code: fields[0] as String?,
      amount: fields[1] as UnitPrice?,
    );
  }

  @override
  void write(BinaryWriter writer, Discounts obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscountsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalPriceAdapter extends TypeAdapter<TotalPrice> {
  @override
  final int typeId = 6;

  @override
  TotalPrice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalPrice(
      type: fields[0] as String?,
      currencyCode: fields[1] as String?,
      centAmount: fields[2] as int?,
      fractionDigits: fields[3] as int?,
      tax: fields[4] as Tax?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalPrice obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.currencyCode)
      ..writeByte(2)
      ..write(obj.centAmount)
      ..writeByte(3)
      ..write(obj.fractionDigits)
      ..writeByte(4)
      ..write(obj.tax);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalPriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaxAdapter extends TypeAdapter<Tax> {
  @override
  final int typeId = 7;

  @override
  Tax read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tax(
      type: fields[0] as String?,
      percentage: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Tax obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.percentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemShippingAddressesAdapter extends TypeAdapter<ItemShippingAddresses> {
  @override
  final int typeId = 8;

  @override
  ItemShippingAddresses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemShippingAddresses(
      itemId: fields[0] as String?,
      address: fields[1] as Address?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemShippingAddresses obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.itemId)
      ..writeByte(1)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemShippingAddressesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 9;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      street: fields[0] as String?,
      city: fields[1] as String?,
      postalCode: fields[2] as String?,
      country: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.postalCode)
      ..writeByte(3)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
