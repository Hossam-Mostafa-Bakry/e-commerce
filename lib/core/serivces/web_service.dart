// ignore_for_file: deprecated_member_use, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../config/constants.dart';

class WebServices {


  static WebServices? _this;

  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  WebServices._() {

    freeDio.options.connectTimeout = 30000;
    freeDio.options.baseUrl = Constants.baseUrl;

    tokenDio.options.connectTimeout = 30000;
    tokenDio.options.baseUrl = Constants.baseUrl;

    initializeInterceptors();
  }


  factory WebServices() {

    // if _this = null, return WebServices else return _this;
    _this ??= WebServices._();
    return _this!;


  }





  initializeInterceptors() {


    // Clearing Interceptors
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();


    // freeDio Interceptors
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {

          // options.headers["device_id"] = deviceInformation.deviceId;
          // options.headers['app_version'] = deviceInformation.appVersion;
          // options.headers['platform'] = deviceInformation.platform;
          // options.headers['device_token'] = deviceInformation.fcmToken;
          // options.headers['thirdParty'] = deviceInformation.thirdParty;
          // options.headers['lang'] = lang;
          // options.headers['accId'] = Constants.accountID;

          debugPrint('send request：path:${options.path}，baseURL:${options.baseUrl}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {

          debugPrint("status code: ${response.statusCode}");
          debugPrint("data: ${response.data}");

          // Do something with response data
          log(response.data.toString());
          return handler.next(response); // continue
        },

        onError: (DioError e, handler) {

          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          /// Todo Handeling EasyLoading
          EasyLoading.dismiss();

          if (e.response != null) {
            if (e.response!.statusCode == 401 || e.response!.statusCode == 403) {

              return handler.next(e);

            } else {

              // 500 error internal
              // Sn.showUnExpectedErrorToast();
            }
          } else {

            debugPrint(e.requestOptions.path);
            debugPrint(e.toString());

            // ToastService.showErrorToast("No Internet Connection");
          }
        },
      ),
    );
    // tokenDio Interceptors
    /*tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
         *//* if (options.path != "digitalapi/profile/digitalBE/token/resetData")
            // EasyLoading.show();
            // Do something before request is sent
            options.headers['device_id'] = deviceInformation.deviceId;
          options.headers['app_version'] = deviceInformation.appVersion;
          options.headers['platform'] = deviceInformation.platform;
          options.headers['device_token'] = deviceInformation.fcmToken;
          options.headers['thirdParty'] = deviceInformation.thirdParty;
          options.headers['accId'] = Constants.accountID;
          options.headers[storageKeyMobileToken] = "Bearer $mytoken";
*//*
          debugPrint(
              'send request path:${options.path}，baseURL:${options.baseUrl}');
          debugPrint("method: ${options.method}");
          debugPrint('headers: ${options.headers}');
          debugPrint('data: ${options.data}');

          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can return a `Response` object or return `dio.resolve(data)`.
          // If you want to reject the request with a error message,
          // you can return a `DioError` object or return `dio.reject(errMsg)`
        },
        onResponse: (response, handler) {
          debugPrint('status code: ${response.statusCode}');
          debugPrint('data: ${response.data}');
          // Do something with response data

          log(response.data.toString());

          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          EasyLoading.dismiss();

          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");

          if (e.response != null) {
            if (e.response!.statusCode == 401) {
              return handler.next(e);
            } else if (e.response!.statusCode == 403) {
              debugPrint("unAutherized");
              RequestOptions options = e.response!.requestOptions;
              if ("Bearer" + mytoken! !=
                  options.headers[storageKeyMobileToken]) {
                options.headers[storageKeyMobileToken] = "Bearer" + mytoken!;

                //repate
                debugPrint("repeat");
                debugPrint(options.headers[storageKeyMobileToken]);
                debugPrint("token from interseptos: $mytoken");

                // handler.resolve(
                //   await tokenDio.request(
                //     options.path,
                //     data: options.data,
                //     options: Options(
                //       method: options.method,
                //       headers: options.headers,
                //     ),
                //   ),
                // );
              }

              tokenDio.lock();
              tokenDio.interceptors.responseLock.lock();
              tokenDio.interceptors.errorLock.lock();

              debugPrint("Refresh");
              freeDio
                  .post(
                "digitalapi/profile/digitalBE/token/refreshtoken",
                options: Options(headers: {
                  "deadToken": mytoken,
                }),
              )
                  .then((res) async {
                if (res.statusCode == 200) {
                  mytoken = res.data;
                  await setMobileToken(res.data);
                  // handler.
                }
              }).catchError((error) async {
                debugPrint("error while refresh");
                debugPrint(error);
                debugPrint(error.response);
                mytoken = null;
                await setMobileToken(null);
              }).whenComplete(() {
                tokenDio.unlock();
                tokenDio.interceptors.responseLock.unlock();
                tokenDio.interceptors.errorLock.unlock();
              }).then((value) async {
                //repeat'
                debugPrint("repeat after refresh");
                handler.resolve(
                  await tokenDio.request(
                    options.path,
                    data: options.data,
                    options: Options(
                      method: options.method,
                      headers: options.headers,
                    ),
                  ),
                );
              });
            } else {
              debugPrint("unExpected");
              ToastService.showUnExpectedErrorToast();
              handler.next(e);
            }
          } else {
            debugPrint("No Connection");
            debugPrint(e.requestOptions.path);
            debugPrint(e.toString());
            if (mytoken != null)
              ToastService.showErrorToast("global.connection_error".tr());
          }
        },
      ),
    );*/
  }
}
