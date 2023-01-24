import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/buttons/footer_button.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/components/labeled_value/labeled_value.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/shared/models/result_model.dto.dart';

class ResultPage extends StatelessWidget {
  final ResultDto result;

  const ResultPage({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsAppBar(
        title: "",
        backgroundColor: Colors.transparent,
        backButtonColor: CCColors.black,
      ),
      body: _body(context),
    );
  }

  Widget _body(context) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(context),
                  const DsGapVertical.large(),
                  DsLabeledValue(
                      label: "Mapa selecionado", value: result.mapName),
                  const DsGapVertical.normal(),
                  DsLabeledValue(
                      label: "Posto selecionado", value: result.gasStationName),
                  const DsGapVertical.normal(),
                  DsLabeledValue(
                    label: "Gasolina",
                    prefixValue: "R\$",
                    value: result.gasolineTotalValue.toStringAsFixed(2),
                  ),
                  const DsGapVertical.normal(),
                  DsLabeledValue(
                    label: "Etanol",
                    prefixValue: "R\$",
                    value: result.ethanolTotalValue.toStringAsFixed(2),
                  ),
                  const DsGapVertical.normal(),
                  DsLabeledValue(
                    label: "Autonomia",
                    suffixValue: "KM",
                    value: result.autonomyTotalValue.toStringAsFixed(0),
                  ),
                ],
              ),
            ),
          ),
          _footer,
        ],
      );

  Widget _title(context) => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          "Resultado",
          style: Theme.of(context).textTheme.headline1,
        ),
      );

  Widget get _footer => Padding(
    padding: const EdgeInsets.all(16.0),
    child: DsFooterButton(
          onPress: () => Modular.to.pop(),
          text: "Voltar",
        ),
  );
}
