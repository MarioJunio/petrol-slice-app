import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_horizontal.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class DsLabeledValue extends StatelessWidget {
  final String label;
  final String? prefixValue;
  final String value;
  final String? suffixValue;

  const DsLabeledValue({
    super.key,
    required this.label,
    required this.value,
    this.prefixValue,
    this.suffixValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: CCColors.neutralN6.withAlpha(20),
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: CCColors.neutralN4,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(context),
          const DsGapVertical.small(),
          _buildValue(context),
        ],
      ),
    );
  }

  Widget _buildLabel(context) => Text(
    label,
    style: Theme.of(context).textTheme.subtitle1,
  );

  Widget _buildValue(context) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Row(
          children: [
            Visibility(
              visible: prefixValue != null,
              child: Text(
                prefixValue ?? "",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Visibility(
              visible: prefixValue != null,
              child: const DsGapHorizontal.small(),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Visibility(
              visible: suffixValue != null,
              child: const DsGapHorizontal.small(),
            ),
            Visibility(
              visible: suffixValue != null,
              child: Text(
                suffixValue ?? "",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      );
}
