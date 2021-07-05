import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_colorpicker.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_datetimepicker_wrapper.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_dropdown_wrapper.dart';
import 'package:simply_meet/core/ui/helper_widgets/formbuilder_textfield_wrapper.dart';
import 'package:simply_meet/core/view_models/create_edit_event_viewmodel.dart';
import 'package:simply_meet/shared/models/event.dart';
import 'package:simply_meet/shared/services/local_notif.dart';
import 'package:simply_meet/shared/utility/loader.dart';
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

  @override
  void initState() {
    super.initState();
    LocalNotification.singleton.initialize();
  }

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
            final currTime = myModel.currTime;

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
                    firstDate: event?.startTime ?? currTime,
                    initialValue: event?.startTime ?? currTime,
                    validator: FormBuilderValidators.required(context,
                        errorText: "Field cannot be empty"),
                  ),
                  Divider(),
                  FormBuilderDateTimePickerWrapper(
                    name: "endDate",
                    wordBelowIcon: "End",
                    firstDate: event?.endTime ?? currTime,
                    initialValue: event?.endTime ?? currTime,
                    validator: FormBuilderValidators.required(context,
                        errorText: "Field cannot be empty"),
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
                  FormBuilderDropdownWrapper(
                    dropdownMenu: myModel.dropdownMenu,
                    initialValue: event?.recurrenceRule ?? "ONE-TIME",
                    name: "recurrenceType",
                    hintText: "Select Recurrence Pattern",
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Recurrence Pattern",
                    ),
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
              ? Loaders.singleton.wave(screenHeight(context) * 0.03)
              : Text("Save"),
        ),
      ],
    );
  }
}
