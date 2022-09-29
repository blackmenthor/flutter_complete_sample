// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedImageDataAdapter extends TypeAdapter<_$_BreedImage> {
  @override
  final int typeId = 1;

  @override
  _$_BreedImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_BreedImage(
      id: fields[0] as String,
      width: fields[1] as int,
      height: fields[2] as int,
      url: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_BreedImage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedImageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreedImage _$$_BreedImageFromJson(Map<String, dynamic> json) =>
    _$_BreedImage(
      id: json['id'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_BreedImageToJson(_$_BreedImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };
