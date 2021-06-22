import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  String text;
  @JsonKey(includeIfNull: false)
  final String? documentIDFireStore;

  Reminder({this.text = '', this.documentIDFireStore});

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
  factory Reminder.fromJson(Map<String, dynamic> json, String? documentID) =>
      _$ReminderFromJson(json, documentID);

  factory Reminder.deepCopy(Reminder another) {
    return Reminder(
      text: another.text,
      documentIDFireStore: another.documentIDFireStore,
    );
  }

  static List<Reminder> deepCopyList(List<Reminder> anotherListOfReminders) {
    List<Reminder> defensiveCopy = [];

    for (final event in anotherListOfReminders) {
      defensiveCopy.add(Reminder.deepCopy(event));
    }

    return defensiveCopy;
  }
}
