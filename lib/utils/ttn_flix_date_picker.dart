import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TtnFlixDatePicker {
  final BuildContext context;
  final String dateFormat;
  final ValueChanged<String>? date;

  TtnFlixDatePicker(this.context, {this.dateFormat = 'yyyy-MM-dd', this.date});

  void show() async {
    var pickedDate = await showDatePicker(
      builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
        primary: Colors.blue, // header background color
        onPrimary: Colors.black, // header text color
        onSurface: Colors.blue, // body text color
      ),

    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
    foregroundColor: Colors.red,
    ),
    ),
        ),
        child: child!,
      );
      },
    // button text color,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),

    );
    if (pickedDate != null) {
      String formattedDate =
      DateFormat(dateFormat).format(pickedDate);
      if (date != null) {
        date!(formattedDate);
      }
    }
  }
}

