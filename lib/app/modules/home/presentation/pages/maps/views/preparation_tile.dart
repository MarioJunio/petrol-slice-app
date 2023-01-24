import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class PreparationTile extends StatelessWidget {
  final String name;
  final String description;

  const PreparationTile({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: CCColors.neutralN1),
      ),
      subtitle: Text(
        description,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: CCColors.neutralN1),
      ),
    );
  }
}
