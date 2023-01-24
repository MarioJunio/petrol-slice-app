import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:petrol_slice/app/modules/home/domain/service/preferences_service.dart';
import 'package:petrol_slice/app/modules/home/home_router.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/welcome/welcome_controller.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future main() async {
  final ensureInitialized = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: ensureInitialized);

  await _hasUserLoggedIn();

  FlutterNativeSplash.remove();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

_hasUserLoggedIn() async {
  final WelcomeController controller = WelcomeController(PreferenceService());

  await controller.load();
  await Future.delayed(const Duration(seconds: 2));

  if (controller.isFormValid) {
    HomeRouters.goToHome();
  }
}
