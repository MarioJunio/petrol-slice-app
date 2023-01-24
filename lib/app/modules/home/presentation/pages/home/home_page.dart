import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/components/input/ds_input.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/home_router.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/home/home_controller.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';
import 'package:petrol_slice/app/shared/models/result_model.dto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  final TextEditingController mapSelectedController = TextEditingController();
  final TextEditingController gasStationSelectedController =
      TextEditingController();

  @override
  void initState() {
    controller.loadCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DsAppBar(
        customTitle: Observer(
          builder: (_) {
            return Text(
              "Bem vindo ${controller.currentUsername}",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: CCColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
            );
          },
        ),
        icons: [
          Container(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              child: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
              onTap: () async {
                final bool signOut = await controller.signOut();

                if (signOut) {
                  HomeRouters.goToWelcome();
                }
              },
            ),
          ),
        ],
      ),
      body: _body,
      floatingActionButton: _mapsBtn,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Visibility(
                visible: controller.mapSelected == null,
                child: Text(
                  "Abastecimento",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const DsGapVertical.small(),
              Visibility(
                visible: controller.mapSelected == null,
                child: Text(
                  "Selecione o mapa e o posto, após isso informe o valor total do abastecimento para calcular valor a pagar de etanol e gasolina.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Visibility(
                visible: controller.mapSelected == null,
                child: const DsGapVertical.large(),
              ),
              Visibility(
                visible: controller.mapSelected != null,
                child: _mapInput,
              ),
              Visibility(
                visible: controller.mapSelected != null,
                child: const DsGapVertical.normal(),
              ),
              _gasStationInput,
              const DsGapVertical.large(),
              _fuelInput,
            ],
          );
        }),
      );

  Widget get _mapInput => DsInput(
      onTap: _onSelecteMap,
      label: "Mapa selecionado",
      hint: "Selecionar mapa",
      controller: mapSelectedController,
      suffixIcon: Icons.chevron_right);

  Widget get _gasStationInput => DsInput(
        onTap: () async {
          final GasStationModel? gasStationSelected =
              await HomeRouters.goToGasStations();

          if (gasStationSelected != null) {
            controller.setGasStationSelected(gasStationSelected);

            gasStationSelectedController.text =
                controller.gasStationSelected!.name!;
          }
        },
        label: "Posto selecionado",
        hint: "Selecionar posto",
        controller: gasStationSelectedController,
        suffixIcon: Icons.chevron_right,
      );

  Widget get _fuelInput => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: DsInput(
              label: "Valor abastecimento",
              prefixText: "R\$",
              hint: "0.00",
              suffixIcon: Icons.send,
              type: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              onChanged: (value) =>
                  controller.setFuelValue(double.tryParse(value) ?? 0),
              onTapSuffix: (controller.fuelValue ?? 0) > 0
                  ? () async {
                      if (controller.mapSelected == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Selecione o mapa para continuar'),
                            action: SnackBarAction(
                              label: 'Fechar',
                              onPressed: () {},
                            ),
                          ),
                        );

                        return;
                      }

                      if (controller.gasStationSelected == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                                'Selecione o posto de gasolina para continuar'),
                            action: SnackBarAction(
                              label: 'Fechar',
                              onPressed: () {},
                            ),
                          ),
                        );
                        return;
                      }

                      final ResultDto result = await controller.calculate();

                      HomeRouters.goToResult(result: result);
                    }
                  : null,
            ),
          ),
        ],
      );

  Widget get _mapsBtn => FloatingActionButton(
        onPressed: _onSelecteMap,
        child: const Icon(
          Icons.sports_motorsports_rounded,
          size: 34,
        ),
      );

  _onSelecteMap() async {
    final MapModel? mapSelected = await HomeRouters.goToPreparationMaps();

    if (mapSelected != null) {
      controller.setMapSelected(mapSelected);

      mapSelectedController.text = controller.mapSelected!.name!;
    }
  }
}
