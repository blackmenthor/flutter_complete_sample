import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'breed_weight.freezed.dart';
part 'breed_weight.g.dart';

@freezed
class Weight with _$Weight {
  @HiveType(typeId: 2, adapterName: 'WeightDataAdapter')
  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory Weight({
    @HiveField(0) required String imperial,
    @HiveField(1) required String metric,
  }) = _Weight;

  factory Weight.fromJson(Map<String, Object?> json)
  => _$WeightFromJson(json);

  static Weight Function(Map<String, Object?>) get serializer
  => _$WeightFromJson;

}
