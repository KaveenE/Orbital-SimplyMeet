// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json, String? firestoreDocID) {
  return Task(
    text: json['text'] as String,
    documentIDFireStore: firestoreDocID,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('documentIDFireStore', instance.documentIDFireStore);
  return val;
}
