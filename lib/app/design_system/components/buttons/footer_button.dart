import 'package:flutter/material.dart';

class DsFooterButton extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Function()? onPress;

  const DsFooterButton({
    super.key,
    required this.onPress,
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPress,
          child: _buildTextOrIcon(context),
        ),
      ],
    );
  }

  Widget _buildTextOrIcon(context) => text != null
      ? Text(
          text ?? "",
          style: Theme.of(context).textTheme.button,
        )
      : icon ?? const Icon(Icons.send);
}
