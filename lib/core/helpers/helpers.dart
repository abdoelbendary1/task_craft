import 'package:flutter/material.dart';

void openAdditionSheet(
  BuildContext context, {
  required Widget Function(BuildContext) builder,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: builder,
  );
}

extension BuildContextX on BuildContext {
  void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}

extension StringX on String {
  String capitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}

extension FormatDateAndTime on DateTime {
  String format() =>
      '${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}/${year.toString().padLeft(2, '0')} ';
}
