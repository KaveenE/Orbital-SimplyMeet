// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json,String? firestoreDocID) {
  return Event(
    startTimeZone: json['startTimeZone'] as String?,
    endTimeZone: json['endTimeZone'] as String?,
    documentIDFireStore: firestoreDocID,
    recurrenceRule: json['recurrenceRule'] as String?,
    isAllDay: json['isAllDay'] as bool,
    description: json['description'] as String,
    startTime: Event._dateTimeFromJson(json['startTime'] as String),
    endTime: Event._dateTimeFromJson(json['endTime'] as String),
    subject: json['subject'] as String,
    color: Event._colorFromJson(json['color'] as String),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{
    'recurrenceRule': instance.recurrenceRule,
    'isAllDay': instance.isAllDay,
    'description': instance.description,
    'startTime': Event._dateTimeToJson(instance.startTime),
    'endTime': Event._dateTimeToJson(instance.endTime),
    'subject': instance.subject,
    'color': Event._colorToJson(instance.color),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('documentIDFireStore', instance.documentIDFireStore);
  val['startTimeZone'] = instance.startTimeZone;
  val['endTimeZone'] = instance.endTimeZone;
  return val;
}
