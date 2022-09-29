// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_weight.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeightDataAdapter extends TypeAdapter<_$_Weight> {
  @override
  final int typeId = 2;

  @override
  _$_Weight read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Weight(
      imperial: fields[0] as String,
      metric: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Weight obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.imperial)
      ..writeByte(1)
      ..write(obj.metric);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeightDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weight _$$_WeightFromJson(Map<String, dynamic> json) => _$_Weight(
      imperial: json['imperial'] as String,
      metric: json['metric'] as String,
    );

Map<String, dynamic> _$$_WeightToJson(_$_Weight instance) => <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };
