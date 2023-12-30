import 'package:dio/dio.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/repositories%20/api/api.dart';

class Repository {
  API api = API();

  Future<MovieModel> fetchMoviesData() async {
    try {
      Response response =
          await api.sendRequest.get("api_key=060e7c76aff06a20ca4a875981216f3f");
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Future.error(error);
    }
  }
}
