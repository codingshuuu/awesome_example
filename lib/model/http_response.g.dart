// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpResponse<T> _$HttpResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    HttpResponse<T>(
      const IntConverter().fromJson(json['code']),
      const StringConverter().fromJson(json['msg']),
      const StringConverter().fromJson(json['time']),
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$HttpResponseToJson<T>(
    HttpResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': const IntConverter().toJson(instance.code),
      'msg': const StringConverter().toJson(instance.message),
      'time': const StringConverter().toJson(instance.time),
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

Page<T> _$PageFromJson<T>(Map<String, dynamic> json) => Page<T>(
      const IntConverter().fromJson(json['total']),
      const IntConverter().fromJson(json['per_page']),
      const IntConverter().fromJson(json['current_page']),
      const IntConverter().fromJson(json['last_page']),
      (json['data'] as List<dynamic>)
          .map(GenericConverter<T>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$PageToJson<T>(Page<T> instance) => <String, dynamic>{
      'total': const IntConverter().toJson(instance.total),
      'per_page': const IntConverter().toJson(instance.perPage),
      'current_page': const IntConverter().toJson(instance.currentPage),
      'last_page': const IntConverter().toJson(instance.lastPage),
      'data': instance.data.map(GenericConverter<T>().toJson).toList(),
    };
