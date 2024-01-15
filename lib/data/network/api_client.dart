import 'package:auto_route/src/common/auto_route_annotations.dart';
import 'package:dio/dio.dart';
import 'package:ott_app/data/models/base_model.dart';
import 'package:ott_app/data/network/api_interface.dart';
import 'package:ott_app/data/network/dio_custom_exception.dart';
import 'package:ott_app/data/repositories%20/api/api_service.dart';
import 'package:ott_app/di/service_locator.dart';

class ApiClient implements ApiInterface {
  final ApiService _apiService;

  ApiClient() : _apiService = TTNSL.get<ApiService>();

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _apiService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<T> getDataFromApi<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  }) async {
    Object? body;
    try {
      // Entire map of response
      final data = await _apiService.getRequest<JSON>(
        endpoint,
        queryParams,
        cancelToken,
      );

      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    return mapObjectIntoModel(converter, body);
  }

  mapObjectIntoModel(Function(JSON responseBody) converter, Object body) {
    try {
      return converter(body as JSON);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> postDataFromApi<T>(
      {required String endpoint,
      required QueryParam? queryParam,
      CancelToken? cancelToken,
      Object? body,
      required T Function(JSON responseBody) converter}) {
    // TODO: implement postDataFromApi
    throw UnimplementedError();
  }
}
