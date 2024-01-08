import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:ott_app/data/models/base_model.dart';

abstract class ApiInterface {
  const ApiInterface();

  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  void cancelRequests({CancelToken? cancelToken});

  Future<T> getDataFromApi<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  });

  Future<T> postDataFromApi<T>(
      {required String endpoint,
        required QueryParam? queryParam,
        CancelToken? cancelToken,
        Object? body,
        required T Function(JSON responseBody) converter});
}
