import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_image.freezed.dart';
part 'breed_image.g.dart';

@freezed
class BreedImage with _$BreedImage {

  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory BreedImage({
    required String id,
    required int width,
    required int height,
    required String url,
  }) = _BreedImage;

  factory BreedImage.fromJson(Map<String, Object?> json)
  => _$BreedImageFromJson(json);

  static BreedImage Function(Map<String, Object?>) get serializer
  => _$BreedImageFromJson;

}