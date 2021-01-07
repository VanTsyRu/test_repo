// GENERATED CODE - DO NOT MODIFY BY HAND
// Был изменён для правильного отображения дней постов в поле days
// НЕ ИЗМЕНЯТЬ

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    name: json['name'] as String,
    description: json['description'] as String,
    days: (json['days'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => {
                    'date': DateTime.parse(e['date']),
                    'description': e['description']
                  })
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'name': instance.name,
      'description': instance.description,
      'days': instance.days,
    };
