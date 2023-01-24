import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class CCDefaultThemeProgress {
  static ProgressIndicatorThemeData get progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: CCColors.primary,
    );
  }
}
