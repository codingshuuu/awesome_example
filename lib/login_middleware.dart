import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (Application.getAccount() == null) {
    //   Ids.loginHint.str().toast();
    //   return const RouteSettings(
    //       name: LoginPage.routeName, arguments: {'type': PageType.login});
    // }
    return super.redirect(route);
  }
}
