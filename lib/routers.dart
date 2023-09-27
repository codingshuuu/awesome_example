import 'package:get/get.dart';
import 'login_middleware.dart';
import 'pages/debug_page.dart';
import 'pages/main_page.dart';

class Routes {
  static const initial = mainPage;
  static const mainPage = '/';
  static const debugPage = '/DebugPage';

  ///填写页面路由
  static final pages = [
    _getPage(name: Routes.mainPage, page: () => const MainPage()),
    _getPage(name: Routes.debugPage, page: () => const DebugPage()),
  ];

  /// @param needLogin,
  /// [needLogin] 是否需要登录
  /// [popGesture] 是否需要侧滑返回
  /// [transition] 转场动画
  static GetPage _getPage({
    required String name,
    required GetPageBuilder page,
    needLogin = false,
    popGesture = true,
    Transition? transition,
  }) {
    return GetPage(
      name: name,
      transition: transition,
      popGesture: popGesture,
      //留一点点侧滑
      gestureWidth: (c) => popGesture ? Get.width * 0.5 : 20,
      page: page,
      middlewares: needLogin ? [LoginMiddleware()] : null,
    );
  }
}
