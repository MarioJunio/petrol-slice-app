import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/design_system/components/app_bar/ds_app_bar.dart';
import 'package:petrol_slice/app/design_system/components/gap/ds_gap_vertical.dart';
import 'package:petrol_slice/app/design_system/theme/cc_colors.dart';
import 'package:petrol_slice/app/modules/home/home_router.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/maps_controller.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

import 'views/preparation_tile.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final MapsController controller = Modular.get<MapsController>();

  @override
  void initState() {
    controller.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DsAppBar(
        title: "Meus mapas",
      ),
      body: _body(context),
      floatingActionButton: _addBtn,
    );
  }

  Widget _body(context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Observer(
          builder: (_) {
            if (controller.loading) {
              return _buildProgressIndicator();
            }

            if (controller.maps.isEmpty) {
              return _buildEmpty(context);
            }

            return _buildList();
          },
        ),
      );

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmpty(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Nenhum mapa encontrado",
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

  Widget _buildList() => ListView.separated(
        itemCount: controller.maps.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPreparationTile(controller.maps[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );

  Widget _buildPreparationTile(MapModel mapModel) => Dismissible(
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
            final bool? refresh =
                await HomeRouters.goToAddMap(mapModel: mapModel);

            if (refresh ?? false) {
              await controller.load();
            }

            return false;
          }

          return await _confirmDelete(mapModel.id!);
        },
        onDismissed: (_) async {
          await controller.delete(mapModel.id!);
        },
        child: InkWell(
          onTap: () => Modular.to.pop(mapModel),
          child: PreparationTile(
            name: mapModel.name ?? "",
            description: mapModel.description ?? "",
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
        content: const Text('Mapa excluído com sucesso'),
        action:
            SnackBarAction(label: 'Desfazer', onPressed: () => delete = false),
      ),
    );

    await snackbarController.closed;

    return delete;
  }

  Widget get _addBtn => FloatingActionButton(
        onPressed: () async {
          final bool? refresh = await HomeRouters.goToAddMap();

          if (refresh ?? false) {
            await controller.load();
          }
        },
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      );
}
