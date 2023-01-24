import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_horizontal.dart';
import 'package:petrol_slice/app/design_system/theme/provider/cc_colors.dart';

class DsInput extends StatelessWidget {
  final String label;
  final String hint;
  final String? prefixText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? type;
  final String? errorText;
  final Function()? onTap;
  final Function()? onTapSuffix;
  final Function(String)? onChanged;

  const DsInput({
    super.key,
    required this.label,
    required this.hint,
    this.prefixText,
    this.suffixIcon,
    this.onTap,
    this.onTapSuffix,
    this.controller,
    this.type,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap != null
          ? () {
              if (onTap != null) {
                FocusManager.instance.primaryFocus?.unfocus();
                onTap!();
              }
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: errorText != null ? CCColors.basicRed : CCColors.neutralN4,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel,
                  _buildTextInput,
                  _buildErrorLabel(context),
                ],
              ),
            ),
            _buildSuffixIcon(context),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorLabel(context) => Visibility(
        visible: errorText != null,
        child: Text(
          errorText ?? "",
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: CCColors.basicRed,
              ),
        ),
      );

  Widget get _buildLabel => Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: CCColors.neutralN2,
          fontSize: 14,
        ),
      );

  Widget get _buildTextInput => Row(
        children: [
          Visibility(
            visible: prefixText != null,
            child: Text(
              prefixText ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: CCColors.neutralN4,
              ),
            ),
          ),
          Visibility(
            visible: prefixText != null,
            child: const DsGapHorizontal.small(),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: onTap == null,
              keyboardType: type,
              onChanged: onChanged,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: hint,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: CCColors.neutralN6,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildSuffixIcon(context) => Visibility(
        visible: suffixIcon != null,
        child: GestureDetector(
          onTap: onTapSuffix,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              suffixIcon,
              size: 35,
              color: onTapSuffix != null
                  ? Theme.of(context).primaryColor
                  : CCColors.neutralN3,
            ),
          ),
        ),
      );
}
