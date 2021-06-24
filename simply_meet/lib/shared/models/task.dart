import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String text;
  
  @JsonKey(includeIfNull: false)
  final String? documentIDFireStore;

  Task({this.text = '', this.documentIDFireStore});

  Map<String, dynamic> toJson() => _$TaskToJson(this);
  factory Task.fromJson(Map<String, dynamic> json, String? documentID) =>
      _$TaskFromJson(json, documentID);

  factory Task.deepCopy(Task another) {
    return Task(
      text: another.text,
      documentIDFireStore: another.documentIDFireStore,
    );
  }

  static List<Task> deepCopyList(List<Task> anotherListOfReminders) {
    List<Task> defensiveCopy = [];

    for (final event in anotherListOfReminders) {
      defensiveCopy.add(Task.deepCopy(event));
    }

    return defensiveCopy;
  }
}
