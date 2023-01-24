import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/buttons/footer_button.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/components/input/ds_input.dart';
import 'package:petrol_slice/app/design_system/theme/provider/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/add_map/add_map_controller.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

class AddMapPage extends StatefulWidget {
  final MapModel? mapModel;

  const AddMapPage({
    super.key,
    this.mapModel,
  });

  @override
  State<AddMapPage> createState() => _AddMapPageState();
}

class _AddMapPageState extends State<AddMapPage> {
  final AddMapController controller = Modular.get<AddMapController>();

  final NumberFormat numberFormat = NumberFormat("##0.##", "en_US");

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ethanolPercentController =
      TextEditingController();
  final TextEditingController _gasolinePercentController =
      TextEditingController();

  @override
  void initState() {
    if (widget.mapModel != null) {
      _nameController.text = widget.mapModel!.name ?? "";
      _descriptionController.text = widget.mapModel!.description ?? "";

      _ethanolPercentController.text =
          numberFormat.format(widget.mapModel!.ethanol ?? 0);

      _gasolinePercentController.text =
          numberFormat.format(widget.mapModel!.gasoline ?? 0);

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
                      "Novo mapa",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const DsGapVertical.small(),
                    Text(
                      "Preencha o nome e descrição para se orientar posteriormente e também a porcentagem de mistura entre Etanol e Gasolina que será utilizado",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const DsGapVertical.large(),
                    DsInput(
                      label: "Nome",
                      hint: "Nome do mapa",
                      controller: _nameController,
                      onChanged: (value) {
                        controller.setFormValidate(0, value.isNotEmpty);
                      },
                    ),
                    const DsGapVertical.normal(),
                    DsInput(
                      label: "Descrição",
                      hint: "Breve descrição",
                      controller: _descriptionController,
                      onChanged: (value) {
                        controller.setFormValidate(1, value.isNotEmpty);
                      },
                    ),
                    const DsGapVertical.normal(),
                    Observer(builder: (_) {
                      return DsInput(
                        label: "Etanol",
                        hint: "0",
                        prefixText: "%",
                        controller: _ethanolPercentController,
                        errorText: controller.ethanolPercentError,
                        onChanged: (value) {
                          final double ethanolPercent =
                              double.tryParse(value) ?? 0;

                          if (ethanolPercent > 100) {
                            controller.setEthanolPercentError(
                                "Porcentagem deve ser menor ou igual a 100");
                            controller.setFormValidate(2, false);
                            controller.setFormValidate(3, false);
                            return;
                          }

                          controller.setFormValidate(2, true);
                          controller.setFormValidate(3, true);
                          controller.setEthanolPercentError(null);

                          _gasolinePercentController.text =
                              numberFormat.format(100 - ethanolPercent);
                        },
                      );
                    }),
                    const DsGapVertical.normal(),
                    Observer(builder: (_) {
                      return DsInput(
                        label: "Gasolina",
                        hint: "0",
                        prefixText: "%",
                        errorText: controller.gasolinePercentError,
                        controller: _gasolinePercentController,
                        onChanged: (value) {
                          final double gasolinePercent =
                              double.tryParse(value) ?? 0;

                          if (gasolinePercent > 100) {
                            controller.setGasolinePercentError(
                                "Porcentagem deve ser menor ou igual a 100");
                            controller.setFormValidate(2, false);
                            controller.setFormValidate(3, false);
                            return;
                          }

                          controller.setFormValidate(2, true);
                          controller.setFormValidate(3, true);
                          controller.setGasolinePercentError(null);

                          _ethanolPercentController.text =
                              numberFormat.format(100 - gasolinePercent);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
            _footer(),
          ],
        ),
      );

  Widget _footer() => Observer(
        builder: (context) {
          return DsFooterButton(
            text: "Concluir",
            onPress: controller.isFormValid ? _save : null,
          );
        },
      );

  _save() async {
    var mapModel = MapModel(
      id: widget.mapModel?.id,
      name: _nameController.text,
      description: _descriptionController.text,
      ethanol: double.tryParse(_ethanolPercentController.text) ?? 0,
      gasoline: double.tryParse(_gasolinePercentController.text) ?? 0,
    );

    await controller.save(mapModel);
    Modular.to.pop(true);
  }
}
