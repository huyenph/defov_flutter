import 'dart:ui';

import 'package:flutter/widgets.dart';

abstract class BaseStateListener {
  void onShowLoading(String text);

  void onDismissLoading();

  void onDisplayError(exception);

  void onDisplayErrorWithTryAgain(exception, VoidCallback onTryAgain);

  BuildContext get viewContext;

  bool get isMounted;
}
