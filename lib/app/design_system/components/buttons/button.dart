import 'package:flutter/material.dart';

class DsButton extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Function() onPress;

  const DsButton({
    super.key,
    this.text,
    this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: _buildTextOrIcon(context),
    );
  }

  Widget _buildTextOrIcon(context) => text != null
      ? Text(
          text ?? "",
          style: Theme.of(context).textTheme.button,
        )
      : icon ?? const Icon(Icons.send);
}
