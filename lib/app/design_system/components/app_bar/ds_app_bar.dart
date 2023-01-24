import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class DsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? customTitle;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final List<Widget>? icons;

  DsAppBar({
    super.key,
    this.title,
    this.fontSize = 24,
    this.backgroundColor,
    this.backButtonColor,
    this.icons,
    this.customTitle,
    this.fontWeight = FontWeight.w600,
  });

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      iconTheme: IconThemeData(color: backButtonColor ?? CCColors.white),
      title: customTitle ??
          Text(
            title ?? "",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: backButtonColor ?? CCColors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
          ),
      shadowColor: Colors.transparent,
      actions: icons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
