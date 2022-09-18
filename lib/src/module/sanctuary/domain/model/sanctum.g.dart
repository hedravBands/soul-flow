// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sanctum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sanctum _$$_SanctumFromJson(Map<String, dynamic> json) => _$_Sanctum(
      id: json['id'] as String,
      element: json['element'] as String,
      type: json['type'] as String,
      name: json['name'] as String,
      level: json['level'] as int,
      description: json['description'] as String,
      info: (json['info'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SanctumToJson(_$_Sanctum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'element': instance.element,
      'type': instance.type,
      'name': instance.name,
      'level': instance.level,
      'description': instance.description,
      'info': instance.info,
    };
