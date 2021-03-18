import 'dart:async';

import 'package:boilerplate/api/NetworkInterceptorHelper.dart';
import 'package:boilerplate/extras/AppConstants.dart';
import 'package:boilerplate/local/DataCache.dart';
import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  DataCache dataCache;
  NetworkInterceptor(this.dataCache);
  @override
  Future<FutureOr> onRequest(RequestOptions options) async {
    // if (dataCache.getAccessToken() != null) {
    //   options.headers.addAll({
    //     "Authorization": "Bearer ${dataCache.getAccessToken().accessToken}"
    //   });
    // }
    return options;
  }

  @override
  Future<FutureOr> onError(DioError dioError) async {}

  @override
  Future<FutureOr> onResponse(Response response) async {
    if (response.statusCode == AppConstants.HTTP_UNAUTHORIZED) {
      NetworkInterceptorHelper.goToLogout();
    }
    return response;
  }
}