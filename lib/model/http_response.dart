import 'package:awesome_base/model/index.dart';
import 'package:json_annotation/json_annotation.dart';

import 'generic_converter.dart';

part 'http_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@IntConverter()
@StringConverter()
class HttpResponse<T> extends Object {
  int code;
  @JsonKey(name: 'msg')
  String message;
  String time;
  T? data;

  HttpResponse(this.code, this.message, this.time, this.data);

  factory HttpResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$HttpResponseFromJson<T>(srcJson, GenericConverter<T>().fromJson);

  Map<String, dynamic> toJson() => _$HttpResponseToJson<T>(this, GenericConverter<T>().toJson);
}

@JsonSerializable(converters: defaultConverters)
class Page<T> extends Object {
  int total;
  int perPage;
  int currentPage;
  int lastPage;
  List<T> data;

  Page(
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.data,
  );

  factory Page.fromJson(Map<String, dynamic> srcJson) => _$PageFromJson<T>(srcJson);

  Map<String, dynamic> toJson() => _$PageToJson<T>(this);
}
