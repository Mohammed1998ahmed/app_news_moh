// import 'package:dio/dio.dart';

// class DioHelperNews {
//   static Dio? dio;
//   static initnews() {
//     dio = Dio(BaseOptions(
//       baseUrl: 'http://newsapi.org/',
//       receiveDataWhenStatusError: true,
//     ));
//   }

//   static Future<Response>? getData({
//     required String url,
//     required Map<String, dynamic> query,
//   }) async {
//     return await dio!.get(
//       url,
//       queryParameters: query,
//     );
//   }
// }
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=b5a4adc270c04fbf9d36fa86157a015e
import 'package:dio/dio.dart';

class NetWorkNewsApp {
  static Dio? dio;
  static InitialState() {
    dio = Dio(
      BaseOptions(
          baseUrl: "https://newsapi.org/", receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String Uri,
    required Map<String, dynamic> quere,
  }) async {
    return await dio!.get(Uri, queryParameters: quere);
  }
}
