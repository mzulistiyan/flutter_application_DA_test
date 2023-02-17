import 'package:dio/dio.dart';
import 'package:flutter_application_dummy_api/helper/url_helper.dart';

class CategoryService {
  final _dio = Dio();
  static const String _appID = '6215a2c774c10db1083d0a5b';
  static const String _ownerID = '60d0fe4f5311236168a109cb';
  Future<Response<dynamic>?> getListPost({int? page}) async {
    try {
      final response = await _dio.get(
        '${UrlHelper.urlDevelopment}/user/$_ownerID/post?page=$page',
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
