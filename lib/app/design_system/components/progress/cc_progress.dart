import 'package:flutter/material.dart';

class CCProgress extends StatelessWidget {
  final Color? valueColor;
  final bool visible;
  final double size;
  final double strokeWidth;

  const CCProgress({
    Key? key,
    this.valueColor,
    this.visible = true,
    this.size = 30.0,
    this.strokeWidth = 4.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: visible
          ? CircularProgressIndicator(
              color:
                  valueColor ?? Theme.of(context).progressIndicatorTheme.color,
              strokeWidth: strokeWidth,
            )
          : null,
    );
  }
}
