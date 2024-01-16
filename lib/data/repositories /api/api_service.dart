import 'package:dio/dio.dart';
import 'package:ott_app/data/models/base_model.dart';
import 'package:ott_app/utils/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  ApiService() {
    configureDio();
  }

  late final CancelToken _cancelToken;

  final dio = Dio();

  void configureDio() {
    // Set default configs
    _cancelToken = CancelToken();

    dio.options.baseUrl = Constant.BASE_URL;
    dio.interceptors.add(PrettyDioLogger());
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  Future<BaseResponse<T>> getRequest<T>(
    String url,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  ) async {
    Response response = await dio.get<JSON>(url,
        queryParameters: queryParameters, cancelToken: cancelToken);

    return BaseResponse<T>(
        body: response.data,
        code: response.statusCode ?? 500,
        message: response.statusMessage);
  }

  Future<BaseResponse<T>> postRequest<T>(
    String url,
    QueryParams? queryParameters,
    Object? body,
    CancelToken? cancelToken,
  ) async {
    Response response = await dio.post(url,
        queryParameters: queryParameters, data: body, cancelToken: cancelToken);
    return BaseResponse<T>(
        body: response.data,
        code: response.statusCode ?? 500,
        message: response.statusMessage);
  }
}
