// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return _Breed.fromJson(json);
}

/// @nodoc
mixin _$Breed {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get cfaUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  Weight? get weight => throw _privateConstructorUsedError;
  @HiveField(4)
  BreedImage? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedCopyWith<Breed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedCopyWith<$Res> {
  factory $BreedCopyWith(Breed value, $Res Function(Breed) then) =
      _$BreedCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? cfaUrl,
      @HiveField(3) Weight? weight,
      @HiveField(4) BreedImage? image});

  $WeightCopyWith<$Res>? get weight;
  $BreedImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$BreedCopyWithImpl<$Res> implements $BreedCopyWith<$Res> {
  _$BreedCopyWithImpl(this._value, this._then);

  final Breed _value;
  // ignore: unused_field
  final $Res Function(Breed) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cfaUrl = freezed,
    Object? weight = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cfaUrl: cfaUrl == freezed
          ? _value.cfaUrl
          : cfaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Weight?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as BreedImage?,
    ));
  }

  @override
  $WeightCopyWith<$Res>? get weight {
    if (_value.weight == null) {
      return null;
    }

    return $WeightCopyWith<$Res>(_value.weight!, (value) {
      return _then(_value.copyWith(weight: value));
    });
  }

  @override
  $BreedImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $BreedImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$$_BreedCopyWith<$Res> implements $BreedCopyWith<$Res> {
  factory _$$_BreedCopyWith(_$_Breed value, $Res Function(_$_Breed) then) =
      __$$_BreedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? cfaUrl,
      @HiveField(3) Weight? weight,
      @HiveField(4) BreedImage? image});

  @override
  $WeightCopyWith<$Res>? get weight;
  @override
  $BreedImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$_BreedCopyWithImpl<$Res> extends _$BreedCopyWithImpl<$Res>
    implements _$$_BreedCopyWith<$Res> {
  __$$_BreedCopyWithImpl(_$_Breed _value, $Res Function(_$_Breed) _then)
      : super(_value, (v) => _then(v as _$_Breed));

  @override
  _$_Breed get _value => super._value as _$_Breed;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? cfaUrl = freezed,
    Object? weight = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Breed(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cfaUrl: cfaUrl == freezed
          ? _value.cfaUrl
          : cfaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Weight?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as BreedImage?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'BreedDataAdapter')
@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Breed implements _Breed {
  const _$_Breed(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.cfaUrl,
      @HiveField(3) required this.weight,
      @HiveField(4) required this.image});

  factory _$_Breed.fromJson(Map<String, dynamic> json) =>
      _$$_BreedFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? cfaUrl;
  @override
  @HiveField(3)
  final Weight? weight;
  @override
  @HiveField(4)
  final BreedImage? image;

  @override
  String toString() {
    return 'Breed(id: $id, name: $name, cfaUrl: $cfaUrl, weight: $weight, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Breed &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.cfaUrl, cfaUrl) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(cfaUrl),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_BreedCopyWith<_$_Breed> get copyWith =>
      __$$_BreedCopyWithImpl<_$_Breed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BreedToJson(
      this,
    );
  }
}

abstract class _Breed implements Breed {
  const factory _Breed(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String? cfaUrl,
      @HiveField(3) required final Weight? weight,
      @HiveField(4) required final BreedImage? image}) = _$_Breed;

  factory _Breed.fromJson(Map<String, dynamic> json) = _$_Breed.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get cfaUrl;
  @override
  @HiveField(3)
  Weight? get weight;
  @override
  @HiveField(4)
  BreedImage? get image;
  @override
  @JsonKey(ignore: true)
  _$$_BreedCopyWith<_$_Breed> get copyWith =>
      throw _privateConstructorUsedError;
}
