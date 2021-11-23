import 'package:defov_flutter/src/config/app_config.dart';
import 'package:defov_flutter/src/core/bloc/app_bloc_observer.dart';
import 'package:defov_flutter/src/core/utils/utils.dart';
import 'package:defov_flutter/src/injector.dart';
import 'package:defov_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  Bloc.observer = AppBlocObserver();
  AppConfig(flavor: Flavor.stag);
  appLogging();
  runApp(const MyApp());
}
