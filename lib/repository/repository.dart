import 'dart:async';
import 'package:dio/dio.dart';
import 'package:newsapp/model/article_response.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "0f8e77503bad46e9a13a22e7001409a4";

  final Dio _dio = Dio();

  var everythingUrl = "$mainUrl/everything";

  Future<ArticleResponse> getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
}
