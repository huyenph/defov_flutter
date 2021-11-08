import 'package:defov_flutter/core/app_config.dart';
import 'package:defov_flutter/core/utils.dart';
import 'package:defov_flutter/di/provider_setup.dart';
import 'package:defov_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  AppConfig(flavor: Flavor.stag);
  appLogging();
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}