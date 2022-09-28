// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

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
