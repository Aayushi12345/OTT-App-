import 'package:ott_app/data/models/movie_model.dart';
import 'package:ott_app/data/network/api_client.dart';
import 'package:ott_app/di/service_locator.dart';
import 'package:ott_app/utils/constant.dart';

class Repository {
  late ApiClient _apiService;

  Repository() {
    _apiService = TTNSL.get<ApiClient>();
  }

  Future<MovieModel> getMoviesData(int pageNo) async {
    final response = await _apiService.getDataFromApi(
        endpoint: Constant.GET_MOVIES, converter: MovieModel.fromJson,
        queryParams: {"api_key": Constant.API_KEY, "page": pageNo});
    return response;
  }
}
