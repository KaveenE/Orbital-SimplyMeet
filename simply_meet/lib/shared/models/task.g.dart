// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json,String? firestoreDocID) {
  return Task(
    title: json['title'] as String,
    description: json['description'] as String,
    date: Task._dateTimeFromJson(json['date'] as String?),
    priority: json['priority'] as String,
    notifID: json['notifID'] as String?,
    completionStatus: json['completionStatus'] as bool,
    documentIDFireStore: firestoreDocID ,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'description': instance.description,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', Task._dateTimeToJson(instance.date));
  val['priority'] = instance.priority;
  val['completionStatus'] = instance.completionStatus;
  writeNotNull('documentIDFireStore', instance.documentIDFireStore);
  val['notifID'] = instance.notifID;
  return val;
}
