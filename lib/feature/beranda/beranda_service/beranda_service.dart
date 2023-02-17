import 'package:dio/dio.dart';
import 'package:flutter_application_dummy_api/helper/url_helper.dart';

class BerandaService {
  final _dio = Dio();
  static const String _appID = '6215a2c774c10db1083d0a5b';
  Future<Response<dynamic>?> getListPost({int? page}) async {
    try {
      final response = await _dio.get(
        '${UrlHelper.urlDevelopment}/post?page=$page',
        options: Options(
          headers: {
            "app-id": _appID,
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response<dynamic>?> getDetailPost({
    String? idPost,
  }) async {
    try {
      final response = await _dio.get(
        '${UrlHelper.urlDevelopment}/post/$idPost',
        options: Options(
          headers: {
            "app-id": _appID,
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response<dynamic>?> getListCommenyByPost({
    int? page,
    String? idPost,
  }) async {
    try {
      final response = await _dio.get(
        '${UrlHelper.urlDevelopment}/post/$idPost/comment?page=$page',
        options: Options(
          headers: {
            "app-id": _appID,
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response<dynamic>?> postComment({
    String? message,
    String? idPost,
    String? idOwner,
  }) async {
    try {
      final response = await _dio.post(
        '${UrlHelper.urlDevelopment}/comment/create',
        data: {
          "message": message,
          "post": idPost,
          "owner": idOwner,
        },
        options: Options(
          headers: {
            "app-id": _appID,
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response<dynamic>?> createNewPost({
    String? text,
    String? image,
    List<String> listTag = const [],
    String? idOwner,
  }) async {
    try {
      final response = await _dio.post(
        '${UrlHelper.urlDevelopment}/post/create',
        data: {
          "text": text,
          "image": image,
          "tags": listTag,
          "owner": idOwner,
        },
        options: Options(
          headers: {
            "app-id": _appID,
          },
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }
}
