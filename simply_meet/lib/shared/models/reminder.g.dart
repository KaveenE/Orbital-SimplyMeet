// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json, String? firestoreDocID) {
  return Reminder(
    text: json['text'] as String,
    documentIDFireStore: firestoreDocID,
  );
}

Map<String, dynamic> _$ReminderToJson(Reminder instance) {
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
