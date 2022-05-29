import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:splitq/domain/constants.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/utils/index.dart';
import 'interceptor.dart';

class AppNetworkClient {
  final Dio _dio = Get.find<Dio>();
  final NetworkInterceptor _interceptor = Get.find<NetworkInterceptor>();
  final List<CancelToken> _cancelTokenList = [];

  AppNetworkClient() {
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
    _dio.options.sendTimeout = 10000;

    _dio.interceptors.add(_interceptor);
    // _dio.interceptors.add(PrettyDioLogger());
  }

  _removeCancelToken(CancelToken cancelTokenToBeRemoved) {
    _cancelTokenList
        .removeWhere((cancelToken) => cancelToken == cancelTokenToBeRemoved);
  }

  cancelAllRequests() {
    if (_cancelTokenList.isNotEmpty) {
      for (CancelToken cancelToken in _cancelTokenList) {
        if (!cancelToken.isCancelled) {
          cancelToken.cancel();
        }
      }
    }
    _cancelTokenList.clear();
  }

  String getBaseUrl() {
    return Constants.baseUrl;
  }

  Future<Map> post<T>(
    String api, {
    body,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final requestCancelToken = cancelToken ?? CancelToken();
    _cancelTokenList.add(requestCancelToken);
    Logger.log(body);

    try {
      String baseUrl = getBaseUrl();
      String url = baseUrl + api;

      Response result = await _dio.post(
        url,
        data: body,
        queryParameters: params,
        options: options,
        cancelToken: requestCancelToken,
      );

      _removeCancelToken(requestCancelToken);

      final parsedResponse = ApiResponse.fromJson(result.data);
      if (parsedResponse.status != null && parsedResponse.status == 200) {
        return parsedResponse.payload;
      } else {
        throw Exception('Invalid request');
      }
    } catch (error) {
      Logger.log(error, tag: 'NetworkClient-post');
      _removeCancelToken(requestCancelToken);
      rethrow;
    }
  }

  Future<Map> get<T>(
    String api, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final requestCancelToken = cancelToken ?? CancelToken();
    _cancelTokenList.add(requestCancelToken);

    try {
      String baseUrl = getBaseUrl();
      String url = baseUrl + api;

      Response result = await _dio.get(
        url,
        queryParameters: params,
        options: options,
        cancelToken: requestCancelToken,
      );

      final parsedResponse = ApiResponse.fromJson(result.data);
      if (parsedResponse.status != null && parsedResponse.status == 200) {
        return parsedResponse.payload;
      } else {
        throw Exception('Invalid request');
      }
    } catch (error) {
      Logger.log(error, tag: 'NetworkClient-post');
      rethrow;
    } finally {
      _removeCancelToken(requestCancelToken);
    }
  }
}
