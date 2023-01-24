import 'package:flutter/material.dart';

class DsGapVertical extends StatelessWidget {
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }

  const DsGapVertical.small({
    super.key,
    this.size = 8,
  });

  const DsGapVertical.normal({
    super.key,
    this.size = 16,
  });

  const DsGapVertical.large({
    super.key,
    this.size = 32,
  });
}
