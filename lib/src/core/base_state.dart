import 'dart:io';

import 'package:defov_flutter/src/core/base_state_listener.dart';
import 'package:defov_flutter/src/data/datasources/remote/token_expired_handler.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseStateListener, TokenExpiredListener {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode focusNode = FocusNode();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  bool _isLoading = false;
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return Platform.isIOS;
        }
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: buildAppBar(),
          drawer: buildDrawer(),
          bottomNavigationBar: buildBottomNavigation(),
          floatingActionButton: buildFloatingButton(),
          body: buildBody(),
        ),
      ),
    );
  }

  @override
  BuildContext get viewContext => context;

  @override
  bool get isMounted => mounted;

  @override
  void onShowLoading(String text) {
    // TODO: implement onShowLoading
  }

  @override
  void onDismissLoading() {
    if (_isLoading) {
      _isLoading = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void onDisplayError(exception) {
    // TODO: implement onDisplayError
  }

  @override
  void onDisplayErrorWithTryAgain(exception, VoidCallback onTryAgain) {
    // TODO: implement onDisplayErrorWithTryAgain
  }

  @override
  void onTokenExpired(TokenType type) {
    _tokenExpired(type);
  }

  PreferredSizeWidget buildAppBar() => AppBar(
    title: const Text('AppBar'),
  );

  Widget? buildDrawer() => null;

  Widget? buildBottomNavigation() => null;

  Widget? buildFloatingButton() => null;

  Widget buildBody();

  void _tokenExpired(TokenType type) async {
//    _authApiService.signOut().then((_) async {
//      showInformDialog(
//          null,
//          type == ExpiredType.TOKEN_EXPIRED
//              ? appStrings.MSG_TOKEN_EXPIRED
//              : appStrings.MSG_ACCOUNT_SIGNED_IN_ANOTHER_DEVICE,
//          appStrings.OK,
//              () => Navigator.pushNamedAndRemoveUntil(
//              context, appStrings.SIGN_IN_ROUTE, (_) => false));
//    });
    clearMemory();
  }

  void clearMemory() {}
}
