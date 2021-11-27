import 'package:cat_gift/core/global.dart/theme_data.dart';
import 'package:flutter/material.dart';

class SnackWidget extends SnackBar {
  static showMessage(BuildContext context, String text,
          {bool isError = false}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackWidget(Text(text),
            backgroundColor: isError
                ? errorColor
                : Theme.of(context).snackBarTheme.backgroundColor),
      );

  @override
  // ignore: overridden_fields
  final Widget content;
  @override
  // ignore: overridden_fields
  final Duration duration;
  @override
  // ignore: overridden_fields
  final Color? backgroundColor;

  // ignore: use_key_in_widget_constructors
  const SnackWidget(
    this.content, {
    Key? key,
    this.duration = const Duration(seconds: 3),
    this.backgroundColor,
  }) : super(
          content: content,
          duration: duration,
          backgroundColor: backgroundColor,
        );
}
