import 'package:boilerplate/api/logging_interceptors.dart';
import 'package:boilerplate/api/network_interceptor.dart';
import 'package:boilerplate/local/data_cache.dart';
import 'package:debug_mode/debug_mode.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';

class RestApi {
  final injector = Injector.appInstance;
  DataCache dataCache;

  BaseOptions _options;

  RestApi() {
    dataCache = injector.get<DataCache>();

    _options = new BaseOptions(
        baseUrl: env['BASE_URL'],
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        },
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        });
  }

  Dio dio() {
    Dio dio = Dio(_options);
    dio.interceptors.add(NetworkInterceptor(dataCache));
    if (DebugMode.isInDebugMode) {
      dio.interceptors.add(LoggingInterceptors());
    }
    return dio;
  }
}