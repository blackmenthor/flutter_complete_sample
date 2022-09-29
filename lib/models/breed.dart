import 'package:flutter_complete/api/base/response_object.dart';
import 'package:flutter_complete/models/breed_image.dart';
import 'package:flutter_complete/models/breed_weight.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed extends ResponseObject with _$Breed {
  @HiveType(typeId: 0, adapterName: 'BreedDataAdapter')
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  const factory Breed({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String? cfaUrl,
    @HiveField(3) required Weight? weight,
    @HiveField(4) required BreedImage? image,
  }) = _Breed;

  factory Breed.fromJson(Map<String, Object?> json)
  => _$BreedFromJson(json);

  static Breed Function(Map<String, Object?>) get serializer
  => _$BreedFromJson;

}
