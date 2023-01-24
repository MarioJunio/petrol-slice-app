import 'package:flutter/material.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';

class GasStationTile extends StatelessWidget {
  final String name;
  final double gasolinePrice;
  final double ethanolPrice;

  const GasStationTile({
    super.key,
    required this.name,
    required this.gasolinePrice,
    required this.ethanolPrice,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: CCColors.neutralN1, fontSize: 24, fontWeight: FontWeight.w500),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Litro (G) - R\$ ${gasolinePrice.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: CCColors.neutralN1,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const DsGapVertical.small(),
            Text(
              "Litro (E) - R\$ ${ethanolPrice.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: CCColors.neutralN1,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
