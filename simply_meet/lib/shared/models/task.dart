import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  static const uuid = Uuid();
  final String title;

  @JsonKey(toJson: _dateTimeToJson, fromJson: _dateTimeFromJson)
  final DateTime date;

  final String priority;
  final bool completionStatus;

  @JsonKey(includeIfNull: false)
  final String? documentIDFireStore;

  final String? notifID;

  Task({
    this.title = '',
    required this.date,
    required this.priority,
    required this.notifID,
    this.completionStatus = false,
    this.documentIDFireStore,
  });

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json, String? documentID) =>
      _$TaskFromJson(json, documentID);

  factory Task.deepCopy(Task another) {
    return Task(
      title: another.title,
      documentIDFireStore: another.documentIDFireStore,
      priority: another.priority,
      completionStatus: another.completionStatus,
      date: another.date,
      notifID: another.notifID,
    );
  }

  static List<Task> deepCopyList(List<Task> anotherListOfReminders) {
    List<Task> defensiveCopy = [];

    for (final event in anotherListOfReminders) {
      defensiveCopy.add(Task.deepCopy(event));
    }

    return defensiveCopy;
  }

  Task copyWith({
    String? title,
    DateTime? date,
    String? priority,
    String? notifID,
    bool? completionStatus,
    String? documentIDFireStore,
  }) {
    return Task(
      date: date ?? this.date,
      notifID: notifID ?? this.notifID,
      priority: priority ?? this.priority,
      completionStatus: completionStatus ?? this.completionStatus,
      documentIDFireStore: documentIDFireStore ?? this.documentIDFireStore,
      title: title ?? this.title,
    );
  }

  //Helper functions for @JsonKey
  static String _dateTimeToJson(DateTime dateTime) =>
      DateFormat("d/M/y").add_jm().format(dateTime);

  static DateTime _dateTimeFromJson(String dateTime) =>
      DateFormat("d/M/y").add_jm().parse(dateTime);
}
