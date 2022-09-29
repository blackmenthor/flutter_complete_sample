// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedDataAdapter extends TypeAdapter<_$_Breed> {
  @override
  final int typeId = 0;

  @override
  _$_Breed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Breed(
      id: fields[0] as String,
      name: fields[1] as String,
      cfaUrl: fields[2] as String?,
      weight: fields[3] as Weight?,
      image: fields[4] as BreedImage?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Breed obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cfaUrl)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Breed _$$_BreedFromJson(Map<String, dynamic> json) => _$_Breed(
      id: json['id'] as String,
      name: json['name'] as String,
      cfaUrl: json['cfa_url'] as String?,
      weight: json['weight'] == null
          ? null
          : Weight.fromJson(json['weight'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : BreedImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BreedToJson(_$_Breed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cfa_url': instance.cfaUrl,
      'weight': instance.weight,
      'image': instance.image,
    };
