// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartNotifierModelAdapter extends TypeAdapter<CartNotifierModel> {
  @override
  final int typeId = 0;

  @override
  CartNotifierModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartNotifierModel(
      id: fields[0] as String,
      price: fields[1] as double,
      quantity: fields[2] as int,
      title: fields[3] as String,
      image: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CartNotifierModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartNotifierModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
