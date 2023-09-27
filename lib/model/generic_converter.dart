import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

/// 范型类型转换，需在 [models] 中添加映射关系
class GenericConverter<T> implements JsonConverter<T, Object?> {
  const GenericConverter();
  @override
  T fromJson(Object? json) {
    T data;
    final fromJson = models[T];
    if (fromJson != null) {
      data = fromJson(json) as T;
    } else {
      //!!! https://stackoverflow.com/questions/51208022/detect-dynamic-type-in-dart
      assert(T == dynamic || json is T, '无法创建范型类型${T.toString()}, 请在 lib/model/models.dart 中添加索引');
      data = json as T;
    }

    return data;
  }

  @override
  Object? toJson(T object) {
    try {
      return (object as dynamic).toJson();
    } catch (_) {
      return object;
    }
  }
}