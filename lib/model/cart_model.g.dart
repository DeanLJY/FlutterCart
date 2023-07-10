// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlutterCartItemAdapter
    extends TypeAdapter<FlutterCartItem> {
  @override
  final int typeId = 0;

  @override
  FlutterCartItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlutterCartItem(
      productId: fields[0] as String,
      productName: fields[1] as String,
      productThumbnail: fields[3] as String?,
      productDescription: fields[2] as String?,
      productImages: (fields[4] as List?)?.cast<String>(),
      unitPrice: fields[5] as double,
      quantity: fields[6] as int,
      productDetails: (fields[7] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FlutterCartItem obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productDescription)
      ..writeByte(3)
      ..write(obj.productThumbnail)
      ..writeByte(4)
      ..write(obj.productImages)
      ..writeByte(5)
      ..write(obj.unitPrice)
      ..writeByte(6)
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.productDetails)
      ..writeByte(8)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlutterCartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
