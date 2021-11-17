import 'package:defov_flutter/src/config/app_config.dart';
import 'package:defov_flutter/src/core/utils/utils.dart';
import 'package:defov_flutter/src/injector.dart';
import 'package:defov_flutter/main.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  AppConfig(flavor: Flavor.dev);
  appLogging();
  runApp(const MyApp());
}
