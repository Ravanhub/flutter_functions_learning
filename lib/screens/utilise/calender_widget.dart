import 'package:flutter/material.dart';

Future<void> pickDate(
    BuildContext context, TextEditingController controller,{Function(DateTime val)? onDateSelected,DateTime? firstDate,DateTime? lastDate,
    }) async {
  firstDate ??= DateTime.now();
  lastDate ??= DateTime.now();
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(2000,DateTime.january,),
    firstDate: firstDate,
    lastDate: lastDate,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (pickedDate != null) {
    String formattedDate =
        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    controller.text = formattedDate;
    if(onDateSelected != null){
      onDateSelected(pickedDate);
  }

  }
}