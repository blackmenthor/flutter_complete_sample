import 'package:flutter_complete/api/base/response_object.dart';
import 'package:flutter_complete/models/breed_image.dart';
import 'package:flutter_complete/models/breed_weight.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed.freezed.dart';
part 'breed.g.dart';

@freezed
class Breed extends ResponseObject with _$Breed {

  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory Breed({
    required String id,
    required String name,
    required String? cfaUrl,
    required Weight? weight,
    required BreedImage? image,
  }) = _Breed;

  factory Breed.fromJson(Map<String, Object?> json)
  => _$BreedFromJson(json);

  static Breed Function(Map<String, Object?>) get serializer
  => _$BreedFromJson;

}
