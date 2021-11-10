library provider_setup;

import 'package:defov_flutter/data/local/shared_preferences_manager.dart';
import 'package:defov_flutter/data/remote/auth/auth_api_service.dart';
import 'package:defov_flutter/data/remote/http_handler.dart';
import 'package:defov_flutter/data/remote/rest_api_factory.dart';
import 'package:defov_flutter/data/remote/token_expired_handler.dart';
import 'package:defov_flutter/data/repositories/auth_repository_impl.dart';
import 'package:defov_flutter/domains/usecases/auth_usecase.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'independent_provider.dart';
part 'dependent_provider.dart';

List<SingleChildWidget> providers = [
  ...independentProviders,
  ...dependentProviders,
];