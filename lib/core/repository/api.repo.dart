import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_review/app/exception.dart';
import 'package:movie_review/core/model/top10.dart';

final apiProvider = Provider<ApiService>((ref) {
  return ApiService(ref.read);
});

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  }));
});

abstract class BaseApi {
  Future<List<Result>> getMovie();
}

class ApiService implements BaseApi {
  final Reader reader;

  ApiService(this.reader);
  @override
  Future<List<Result>> getMovie() async {
    final response = await reader(dioProvider).post(
        'https://hoblist.com/movieList',
        data: jsonEncode({
          "category": "movies",
          "language": "kannada",
          "genre": "all",
          "sort": "voting"
        }));

    try {
      final collection = Movie.fromJson(response.data);
      final List<Result> result = collection.result;
      final String isReceived = collection.message;
      print(isReceived);
      return result;
    } on DioError catch (e) {
      throw DataException(message: e.toString());
    }
  }
}
