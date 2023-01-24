import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/home_router.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/gas_stations_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/views/gas_station_tile.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

class GasStationsPage extends StatefulWidget {
  const GasStationsPage({super.key});

  @override
  State<GasStationsPage> createState() => _GasStationsPageState();
}

class _GasStationsPageState extends State<GasStationsPage> {
  final GasStationsController controller = Modular.get<GasStationsController>();

  @override
  void initState() {
    controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsAppBar(title: "Meus postos"),
      body: _body,
      floatingActionButton: _addBtn,
    );
  }

  Widget get _body => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Observer(builder: (_) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.gasStations.isEmpty) {
            return _buildEmpty(context);
          }

          return ListView.separated(
            itemBuilder: (context, index) =>
                _buildGasStationTile(controller.gasStations[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.gasStations.length,
          );
        }),
      );

  Widget _buildEmpty(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Nenhum posto encontrado",
                style: Theme.of(context).textTheme.headline2),
          ),
          const DsGapVertical.normal(),
          Image(
            image: const AssetImage("empty.png"),
            color: CCColors.neutralN2,
            height: MediaQuery.of(context).size.width * 0.18,
          ),
        ],
      );

  Widget _buildGasStationTile(GasStationModel gasStation) => Dismissible(
        key: UniqueKey(),
        background: _buildSwipeBlock(
          Alignment.centerLeft,
          CCColors.blueB1,
          const Icon(
            Icons.edit,
            color: Colors.white,
            size: 35,
          ),
        ),
        secondaryBackground: _buildSwipeBlock(
          Alignment.centerRight,
          CCColors.basicRed,
          const Icon(
            Icons.delete,
            color: Colors.white,
            size: 35,
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            final bool? refresh = await HomeRouters.goToAddGasStation(
              gasStationModel: gasStation,
            );

            if (refresh ?? false) {
              await controller.load();
            }

            return false;
          }

          return await _confirmDelete(gasStation.id!);
        },
        onDismissed: (_) async {
          await controller.delete(gasStation.id!);
        },
        child: InkWell(
          onTap: () => Modular.to.pop(gasStation),
          child: GasStationTile(
            name: gasStation.name ?? "",
            gasolinePrice: gasStation.ethanol ?? 0,
            ethanolPrice: gasStation.gasoline ?? 0,
          ),
        ),
      );

  Container _buildSwipeBlock(
      AlignmentGeometry alignment, Color bgColor, Icon icon) {
    return Container(
      color: bgColor,
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: icon,
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(int id) async {
    bool delete = true;

    final snackbarController = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Posto excluído com sucesso'),
        action:
            SnackBarAction(label: 'Desfazer', onPressed: () => delete = false),
      ),
    );

    await snackbarController.closed;

    return delete;
  }

  Widget get _addBtn => FloatingActionButton(
        onPressed: () async {
          final bool? refresh = await HomeRouters.goToAddGasStation();

          if (refresh ?? false) {
            await controller.load();
            print("Refresh list of gas stations");
          }
        },
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      );
}
