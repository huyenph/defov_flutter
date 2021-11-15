import 'package:defov_flutter/test/shared_preferences_service.dart';

class StartupViewModel {
  final _sharedPreferences = SharedPreferencesService();
  initialise() {
    var hasUser = _sharedPreferences.hasUser;

  }

}