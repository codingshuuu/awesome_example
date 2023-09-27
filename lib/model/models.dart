import 'http_response.dart';

typedef _ModalInstance = Object Function(dynamic);

// 网络请求返回值最外层封装
// ** 泛型类型一定要在 models 中添加映射关系才能解析，因为 Dart 禁止了反射，不能动态创建对象 **
final models = <Type, _ModalInstance>{
  Page: (json) => Page.fromJson(json),
  typeOf<List<String>>(): (j) => j is List
      ? j.cast<String>()
      : j is String
          ? j.split(',')
          : []
};

// 获取泛型类型
Type typeOf<T>() => T;
