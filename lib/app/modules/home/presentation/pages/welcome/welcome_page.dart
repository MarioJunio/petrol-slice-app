import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/buttons/footer_button.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_horizontal.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/components/input/ds_input.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/home_router.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/welcome/welcome_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomeController controller = Modular.get<WelcomeController>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gasolineCityConsumptionController =
      TextEditingController();
  final TextEditingController _gasolineHighwayConsumptionController =
      TextEditingController();
  final TextEditingController _ethanolCityConsumptionController =
      TextEditingController();
  final TextEditingController _ethanolHighwayConsumptionController =
      TextEditingController();

  @override
  void initState() {
    controller.load().then((value) {
      if (controller.isFormValid) {
        HomeRouters.goToHome();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsAppBar(
        title: "Seja bem vindo",
        fontSize: 16,
      ),
      body: _body,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.all(16) + const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ..._title,
                    const DsGapVertical.large(),
                    ..._form,
                  ],
                ),
              ),
            ),
            _footer,
          ],
        ),
      );

  List<Widget> get _title => [
        Text(
          "Vamos começar",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline1,
        ),
        const DsGapVertical.small(),
        Text(
          "Primeiro informe seu nome e o consumo do seu veículo na cidade e na rodovia",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ];

  List<Widget> get _form => [
        DsInput(
          type: TextInputType.name,
          controller: _nameController,
          label: "Nome completo",
          hint: "Nome completo",
          onChanged: (value) => controller.setName(value),
        ),
        const DsGapVertical.large(),
        _section("Gasolina", FontAwesomeIcons.gasPump),
        const DsGapVertical.normal(),
        DsInput(
          controller: _gasolineCityConsumptionController,
          type: TextInputType.number,
          prefixText: "km/L",
          label: "Consumo médio na cidade",
          hint: "9",
          onChanged: (value) => controller
              .setGasolineCityConsumption(double.tryParse(value) ?? 0.0),
        ),
        const DsGapVertical.normal(),
        DsInput(
          controller: _gasolineHighwayConsumptionController,
          type: TextInputType.number,
          prefixText: "km/L",
          label: "Consumo médio na rodovia",
          hint: "14",
          onChanged: (value) => controller
              .setGasolineHighwayConsumption(double.tryParse(value) ?? 0.0),
        ),
        const DsGapVertical.large(),
        _section("Etanol", FontAwesomeIcons.gasPump),
        const DsGapVertical.normal(),
        DsInput(
          controller: _ethanolCityConsumptionController,
          type: TextInputType.number,
          prefixText: "km/L",
          label: "Consumo médio na cidade",
          hint: "7",
          onChanged: (value) => controller
              .setEthanolCityConsumption(double.tryParse(value) ?? 0.0),
        ),
        const DsGapVertical.normal(),
        DsInput(
          controller: _ethanolHighwayConsumptionController,
          type: TextInputType.number,
          prefixText: "km/L",
          label: "Consumo médio na rodovia",
          hint: "11",
          onChanged: (value) => controller
              .setEthanolHighwayConsumption(double.tryParse(value) ?? 0.0),
        ),
      ];

  Widget _section(String title, IconData icon) => Row(
        children: [
          FaIcon(
            icon,
            color: CCColors.neutralN2,
          ),
          const DsGapHorizontal.small(),
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      );

  Widget get _footer => Observer(
        builder: (context) {
          return DsFooterButton(
            onPress: controller.isFormValid ? _next : null,
            text: "Começar",
          );
        },
      );

  _next() async {
    await controller.save();
    HomeRouters.goToHome();
  }
}
