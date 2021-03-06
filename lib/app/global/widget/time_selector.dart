import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/time_table/time_table.dart';

class TimeFieldController {
  final _dayTime = Rx<DayTime?>(null);
  final displayTimeController = TextEditingController();

  void setTime(BuildContext context, TimeOfDay? value) {
    _dayTime.value = DayTime(
      hour: value?.hour ?? 0,
      minute: value?.minute ?? 0,
    );
    displayTimeController.text = value?.format(context) ?? "00:00 am";
  }

  DayTime? get dayTime => _dayTime.value;

  void dispose() {
    _dayTime.close();
    displayTimeController.dispose();
  }
}

class SelectTimeFIeld extends StatelessWidget {
  final TimeFieldController dayTimeController;
  const SelectTimeFIeld({
    Key? key,
    required this.dayTimeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          TextFormField(
            controller: dayTimeController.displayTimeController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintText: "Select time",
            ),
            validator: (value) =>
                (value == null || value.isEmpty) ? "Please select time" : null,
            textInputAction: TextInputAction.next,
          ),
          Positioned.fill(
            child: Container(
              color: Colors.transparent,
              child: InkWell(
                radius: 8.0,
                onTap: () => _showTimePicker(context),
              ),
            ),
          )
        ],
      );

  void _showTimePicker(BuildContext context) =>
      Navigator.of(context).push(showPicker(
        context: context,
        value: const TimeOfDay(hour: 09, minute: 00),
        onChange: (value) => dayTimeController.setTime(context, value),
      ));
}
