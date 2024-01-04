// Services
import 'package:dio/dio.dart';
import 'package:ott_app/data/network/typedefs.dart';

import 'dio_service.dart';
import 'api_interface.dart';

/// A service class implementing methods for basic API requests.
class DioApiClient implements ApiInterface {
  /// An instance of [DioService] for network requests
  ///
  late final DioService _dioService;

  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
  DioApiClient(DioService dioService) : _dioService = dioService;
  /// An implementation of the base method for cancelling
  /// requests pre-maturely using the [cancelToken].
  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
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
      final data = await _dioService.get<Object?>(
        endpoint: endpoint,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw Future.error(ex);
    }
    return getDeserializedObject(converter, body!);
  }

  @override
  Future<T> postDataFromApi<T>({
    required String endpoint,
    required Map<String, dynamic>? queryParam,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  }) async {
    Object? body;
    try {
      // Entire map of response
      // final data = await _dioService.post<Object?>(
      //   endpoint: endpoint,
      //   queryParams: queryParam,
      //   cancelToken: cancelToken,
      // );
      //
      // // Items of table as json
      // body = data.body;
    } on Exception catch (ex) {
      throw Future.error(ex);
    }
    return getDeserializedObject(converter, body!);
  }

  getDeserializedObject(Function(JSON responseBody) converter, Object body) {
    try {
      // Returning the deserialized objects
      return converter(body as JSON);
    } on Exception catch (ex) {
      throw Future.error(ex);
    }
  }
}
