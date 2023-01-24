import 'package:flutter/material.dart';

class DsGapHorizontal extends StatelessWidget {
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }

  const DsGapHorizontal.small({
    super.key,
    this.size = 8,
  });

  const DsGapHorizontal.normal({
    super.key,
    this.size = 16,
  });

  const DsGapHorizontal.large({
    super.key,
    this.size = 32,
  });
}
