// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductModelAdapter extends TypeAdapter<HiveProductModel> {
  @override
  final int typeId = 1;

  @override
  HiveProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProductModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      price: fields[2] as int?,
      rating: fields[3] as double?,
      stock: fields[4] as int?,
      brand: fields[5] as String?,
      thumbnail: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.stock)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.thumbnail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
