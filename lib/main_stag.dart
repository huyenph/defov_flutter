import 'package:defov_flutter/core/app_config.dart';
import 'package:defov_flutter/core/utils.dart';
import 'package:defov_flutter/main.dart';
import 'package:flutter/material.dart';

void main() {
  AppConfig(flavor: Flavor.stag);
  appLogging();
  runApp(const MyApp());
}