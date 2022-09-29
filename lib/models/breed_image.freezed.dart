// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'breed_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BreedImage _$BreedImageFromJson(Map<String, dynamic> json) {
  return _BreedImage.fromJson(json);
}

/// @nodoc
mixin _$BreedImage {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get width => throw _privateConstructorUsedError;
  @HiveField(2)
  int get height => throw _privateConstructorUsedError;
  @HiveField(3)
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedImageCopyWith<BreedImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedImageCopyWith<$Res> {
  factory $BreedImageCopyWith(
          BreedImage value, $Res Function(BreedImage) then) =
      _$BreedImageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int width,
      @HiveField(2) int height,
      @HiveField(3) String url});
}

/// @nodoc
class _$BreedImageCopyWithImpl<$Res> implements $BreedImageCopyWith<$Res> {
  _$BreedImageCopyWithImpl(this._value, this._then);

  final BreedImage _value;
  // ignore: unused_field
  final $Res Function(BreedImage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BreedImageCopyWith<$Res>
    implements $BreedImageCopyWith<$Res> {
  factory _$$_BreedImageCopyWith(
          _$_BreedImage value, $Res Function(_$_BreedImage) then) =
      __$$_BreedImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int width,
      @HiveField(2) int height,
      @HiveField(3) String url});
}

/// @nodoc
class __$$_BreedImageCopyWithImpl<$Res> extends _$BreedImageCopyWithImpl<$Res>
    implements _$$_BreedImageCopyWith<$Res> {
  __$$_BreedImageCopyWithImpl(
      _$_BreedImage _value, $Res Function(_$_BreedImage) _then)
      : super(_value, (v) => _then(v as _$_BreedImage));

  @override
  _$_BreedImage get _value => super._value as _$_BreedImage;

  @override
  $Res call({
    Object? id = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_BreedImage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'BreedImageDataAdapter')
@JsonSerializable(fieldRename: FieldRename.snake)
class _$_BreedImage implements _BreedImage {
  const _$_BreedImage(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.width,
      @HiveField(2) required this.height,
      @HiveField(3) required this.url});

  factory _$_BreedImage.fromJson(Map<String, dynamic> json) =>
      _$$_BreedImageFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int width;
  @override
  @HiveField(2)
  final int height;
  @override
  @HiveField(3)
  final String url;

  @override
  String toString() {
    return 'BreedImage(id: $id, width: $width, height: $height, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BreedImage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_BreedImageCopyWith<_$_BreedImage> get copyWith =>
      __$$_BreedImageCopyWithImpl<_$_BreedImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreedImageToJson(
      this,
    );
  }
}

abstract class _BreedImage implements BreedImage {
  const factory _BreedImage(
      {@HiveField(0) required final String id,
      @HiveField(1) required final int width,
      @HiveField(2) required final int height,
      @HiveField(3) required final String url}) = _$_BreedImage;

  factory _BreedImage.fromJson(Map<String, dynamic> json) =
      _$_BreedImage.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  int get width;
  @override
  @HiveField(2)
  int get height;
  @override
  @HiveField(3)
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_BreedImageCopyWith<_$_BreedImage> get copyWith =>
      throw _privateConstructorUsedError;
}
