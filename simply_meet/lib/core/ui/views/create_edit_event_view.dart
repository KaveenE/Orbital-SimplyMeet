import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_colorpicker.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_datetimepicker_wrapper.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_textfield_wrapper.dart';
import 'package:simply_meet/core/view_models/create_edit_event_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/utility/ui_helpers.dart';

class CreateEditEventView extends StatefulWidget {
  static const routeName = "/createEditEventView";
  final Event? event;
  const CreateEditEventView({this.event});

  @override
  _CreateEditEventViewState createState() => _CreateEditEventViewState();
}

class _CreateEditEventViewState extends State<CreateEditEventView> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  void changeColor(Color initialColor, Color color) {
    setState(
      () {
        initialColor = color;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return ChangeNotifierProvider(
      create: (_) => CreateEditEventViewModel(
        formKey: _formKey,
        initialColor: event?.color ?? theme(context).primaryColor,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth(context) * 0.04),
        child: Consumer<CreateEditEventViewModel>(
          builder: (_, myModel, __) {
            return FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FormBuilderTextFieldWrapper(
                    name: "subject",
                    hintText: "Subject",
                    keyboardType: TextInputType.text,
                    initialValue: event?.subject ?? '',
                    context: context,
                  ),
                  Divider(),
                  FormBuilderTextFieldWrapper(
                    name: "description",
                    hintText: "Description",
                    keyboardType: TextInputType.text,
                    initialValue: event?.description ?? '',
                    textInputAction: TextInputAction.done,
                    context: context,
                  ),
                  Divider(),
                  FormBuilderDateTimePickerWrapper(
                    name: "startDate",
                    wordBelowIcon: "Start",
                    currTime: myModel.currTime,
                    initialValue: event?.startTime ?? DateTime.now(),
                  ),
                  Divider(),
                  FormBuilderDateTimePickerWrapper(
                    name: "endDate",
                    wordBelowIcon: "End",
                    currTime: myModel.currTime,
                    initialValue: event?.endTime ?? DateTime.now(),
                  ),
                  Divider(),
                  FormBuilderColorPicker(
                    initialColor: myModel.initialColor,
                    changeColor: myModel.changeColor,
                  ),
                  Divider(),
                  FormBuilderSwitchExtract(
                    formKey: _formKey,
                    initialValue: event?.isAllDay ?? false,
                  ),
                  FormBuilderDropdownExtract(
                    dropdownMenu: myModel.dropdownMenu,
                    initialValue: event?.recurrenceRule ?? "ONE-TIME",
                  ),
                  ButtonsAtBottom(
                    busy: myModel.busy,
                    addEventAction: event == null
                        ? () async => await myModel.addEvent(context)
                        : () async => await myModel.updateEvent(context, event),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FormBuilderSwitchExtract extends StatelessWidget {
  late final GlobalKey<FormBuilderState> _formKey;
  final bool initialValue;
  FormBuilderSwitchExtract({
    required GlobalKey<FormBuilderState> formKey,
    required this.initialValue,
  }) {
    _formKey = formKey;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      name: "allDay",
      initialValue: this.initialValue,
      focusNode: _formKey.currentState?.fields["allDay"]?.effectiveFocusNode,
      title: Text(
        "All Day Event",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      controlAffinity: ListTileControlAffinity.platform,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}

class FormBuilderDropdownExtract extends StatelessWidget {
  final List<DropdownMenuItem<String>> dropdownMenu;
  final String initialValue;
  const FormBuilderDropdownExtract({
    required this.dropdownMenu,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    print(dropdownMenu.where((val) {
      return val.value != this.initialValue;
    }).length);
    return FormBuilderDropdown(
      name: "recurrenceType",
      initialValue: this.initialValue,
      items: dropdownMenu.where((val) {
        return val.value == this.initialValue;
      }).toList(),
      decoration: InputDecoration(
          border: InputBorder.none, labelText: "Recurrence Pattern"),
      hint: Text("Select Recurrence Pattern"),
    );
  }
}

class ButtonsAtBottom extends StatelessWidget {
  final bool busy;
  final void Function() addEventAction;
  const ButtonsAtBottom({required this.busy, required this.addEventAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.clear_rounded),
        ),
        ElevatedButton.icon(
          onPressed: addEventAction,
          icon: Icon(Icons.save_alt_rounded),
          label: busy
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : Text("Save"),
        ),
      ],
    );
  }
}
