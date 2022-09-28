import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_weight.freezed.dart';
part 'breed_weight.g.dart';

@freezed
class Weight with _$Weight {

  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory Weight({
    required String imperial,
    required String metric,
  }) = _Weight;

  factory Weight.fromJson(Map<String, Object?> json)
  => _$WeightFromJson(json);

  static Weight Function(Map<String, Object?>) get serializer
  => _$WeightFromJson;

}
