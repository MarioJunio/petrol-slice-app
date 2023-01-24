import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/buttons/footer_button.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/components/input/ds_input.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/add_gas_station/add_gas_station_controller.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

class AddGasStationPage extends StatefulWidget {
  final GasStationModel? gasStationModel;

  const AddGasStationPage({
    super.key,
    this.gasStationModel,
  });

  @override
  State<AddGasStationPage> createState() => _AddGasStationPageState();
}

class _AddGasStationPageState extends State<AddGasStationPage> {
  final AddGasStationController controller =
      Modular.get<AddGasStationController>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gasolineLiterController =
      TextEditingController();
  final TextEditingController _ethanolLiterController = TextEditingController();

  @override
  void initState() {
    if (widget.gasStationModel != null) {
      _nameController.text = widget.gasStationModel!.name!;
      _gasolineLiterController.text =
          widget.gasStationModel!.gasoline.toString();
      _ethanolLiterController.text = widget.gasStationModel!.ethanol.toString();

      for (int i = 0; i < controller.formValidate.length; i++) {
        controller.setFormValidate(i, true);
      }
    } else {
      controller.resetFormValidate();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsAppBar(
        title: "",
        backgroundColor: Colors.transparent,
        backButtonColor: CCColors.black,
      ),
      body: _body,
    );
  }

  Widget get _body => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Novo posto",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const DsGapVertical.small(),
                    Text(
                      "Preencha o nome do posto e o preço do litro da gasolina e etanol.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const DsGapVertical.large(),
                    DsInput(
                      controller: _nameController,
                      label: "Nome",
                      hint: "Nome do posto",
                      onChanged: (value) =>
                          controller.setFormValidate(0, value.isNotEmpty),
                    ),
                    const DsGapVertical.normal(),
                    DsInput(
                      controller: _gasolineLiterController,
                      label: "Litro (G)",
                      hint: "0",
                      prefixText: "R\$",
                      onChanged: (value) => controller.setFormValidate(
                          1, (double.tryParse(value) ?? 0) > 0),
                    ),
                    const DsGapVertical.normal(),
                    DsInput(
                      controller: _ethanolLiterController,
                      label: "Litro (E)",
                      hint: "0",
                      prefixText: "R\$",
                      onChanged: (value) => controller.setFormValidate(
                          2, (double.tryParse(value) ?? 0) > 0),
                    ),
                  ],
                ),
              ),
            ),
            _footer,
          ],
        ),
      );

  _save() {
    controller.save(GasStationModel(
      id: widget.gasStationModel?.id,
      name: _nameController.text,
      gasoline: double.tryParse(_gasolineLiterController.text),
      ethanol: double.tryParse(_ethanolLiterController.text),
    ));

    Modular.to.pop(true);
  }

  Widget get _footer => Observer(
        builder: (_) {
          return DsFooterButton(
            text: "Concluir",
            onPress:
                controller.isFormValidate && !controller.loading ? _save : null,
          );
        },
      );
}
