 import 'package:flutter/material.dart';

void openAdditionSheet(BuildContext context, {required Widget Function(BuildContext) builder}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: builder,
    );
  }