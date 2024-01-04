import 'package:dio/dio.dart';
import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/repositories%20/api/api.dart';
import 'package:ott_app/utils/constant.dart';

class Repository {
  API api = API();
  Future<MovieModel> fetchMoviesData() async {
    try {
      Response response =
          await api.sendRequest.get(Constant.GET_MOVIES);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return Future.error(error);
    }
  }
}
