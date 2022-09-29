import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'breed_image.freezed.dart';
part 'breed_image.g.dart';

@freezed
class BreedImage with _$BreedImage {
  @HiveType(typeId: 1, adapterName: 'BreedImageDataAdapter')
  @JsonSerializable(fieldRename:FieldRename.snake)
  const factory BreedImage({
    @HiveField(0) required String id,
    @HiveField(1) required int width,
    @HiveField(2) required int height,
    @HiveField(3) required String url,
  }) = _BreedImage;

  factory BreedImage.fromJson(Map<String, Object?> json)
  => _$BreedImageFromJson(json);

  static BreedImage Function(Map<String, Object?>) get serializer
  => _$BreedImageFromJson;

}