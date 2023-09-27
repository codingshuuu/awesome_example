import 'dart:developer';

import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';

import '../model/http_response.dart';

class Http {
  static Http get instance => _getInstance();

  static Http? _http;

  static Http _getInstance() => _http ??= Http._();

  late Dio dio;

  Http._() {
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<T> uploadFile<T>(
    String url,
    List<int> bytes,
    String filename,
    Map<bool, bool> map, {
    bool isImage = true, //如果是视频就要传false
    String? originalFileName,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var postData = FormData.fromMap(
        {'dir': isImage ? 'image' : 'video', 'file': MultipartFile.fromBytes(bytes, filename: filename)});
    var option = Options(method: 'POST', contentType: 'multipart/form-data'); //上传文件的content-type 表单
    try {
      Response response = await dio.post(
        url,
        data: postData,
        options: option,
        onSendProgress: (int sent, int total) {
          LogUtil.d('上传进度：' +
              (NumUtil.getNumByValueDouble(sent / total * 100, 2)?.toStringAsFixed(2) ?? '--') +
              '%'); //取精度，如：56.45%
        },
      );
      final statusCode = response.statusCode;
      if (statusCode != null && statusCode < 400) {
        final entity = HttpResponse<T>.fromJson(response.data);
        final data = entity.data;
        if (entity.code == 1 && data != null) {
          return data;
        } else {
          throw APIError(entity.code, response.data['msg']);
        }
      } else {
        throw APIError(-1, '服务异常，请重试');
      }
    } on DioError catch (e) {
      throw APIError(0, e.message);
    } on APIError catch (_) {
      rethrow;
    }
  }

  Future<T> get<T>(String url, {Map<String, dynamic>? parameters, Options? options}) async {
    options = _checkOptions('GET', options);
    return await request(url, parameters: parameters, options: options);
  }

  Future<T> post<T>(String url, {Map<String, dynamic>? parameters, Options? options}) async {
    options = _checkOptions('POST', options);
    return await request(url, parameters: parameters, options: options);
  }

  Future<T> put<T>(String url, {Map<String, dynamic>? parameters, Options? options}) async {
    options = _checkOptions('PUT', options);
    return await request(url, parameters: parameters, options: options);
  }

  Future<T> delete<T>(String url, {Map<String, dynamic>? parameters, Options? options}) async {
    options = _checkOptions('DELETE', options);
    return await request(url, parameters: parameters, options: options);
  }

  Future<T> request<T>(String url, {Map<String, dynamic>? parameters, required Options options}) async {
    parameters?.removeWhere((key, value) => value == null);
    try {
      options.extra = (options.extra ?? {})..['stackTrace'] = StackTrace.current;
      Response response = await dio.request(
        url,
        data: options.method != 'GET' ? parameters : null,
        queryParameters: options.method == 'GET' ? parameters : null,
        options: options,
      );
      final statusCode = response.statusCode;
      if (statusCode != null && statusCode < 400) {
        if (response.data is! Map) {
          throw '服务异常，请重试';
        }
        HttpResponse<T> entity;
        if (response.data['code'] != 1) {
          print('999999999999999999999999999999999999999999999');

          print(response.data);
          print(response.data['infocode']);

          if (response.data['infocode'].toString() == '10000') {
            return response.data;
          } else {
            throw APIError(response.data['code'], response.data['msg'], extraData: response.data['data']);
          }
        } else {
          try {
            entity = HttpResponse<T>.fromJson(response.data);
          } catch (e) {
            debugger(message: 'JSON 解析错误');
            throw APIError(0, e.toString());
          }
          final data = entity.data;
          if (entity.code == 1 && data != null) {
            return data;
          } else {
            throw APIError(entity.code, response.data['msg']);
          }
        }
      } else {
        throw APIError(-1, '服务异常，请重试');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw APIError(401, e.response?.statusMessage ?? '请先登录！');
      }
      throw APIError(0, '网络错误，请重试');
    } on APIError catch (_) {
      rethrow;
    } catch (e) {
      throw APIError(0, e.toString());
    }
  }

  Options _checkOptions(method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}

class APIError implements Exception {
  int? code;
  String? message;
  Map? extraData;

  APIError(this.code, this.message, {this.extraData});

  @override
  toString() => message ?? '网络错误，请重试';
}
