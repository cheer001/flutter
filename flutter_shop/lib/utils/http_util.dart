import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_shop/config/api_url.dart';
import 'package:flutter_shop/utils/token_util.dart';

class HttpUtil {
  static HttpUtil _instanse = HttpUtil._internal();
  factory HttpUtil() => _instanse;
  late Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      //基础路径
      baseUrl: ApiUrl.URL_HEAD,
      //连接服务器超时时间(毫秒)
      connectTimeout: 5000,
      //响应流前后两次接受到数据的间隔(毫秒)
      receiveTimeout: 5000,
      //Http请求头
      // headers: {},
      //请求类型
      contentType: 'application/json;charset=utf-8',
      // //期望接受相应数据的类型
      // responseType: ResponseType.json,
    );
    dio = new Dio(options);

    //Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    // String token = StorageUtil().getToken();

    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      // 请求之前do something...
      onRequest: (options, handler) async {
        String token = await TokenUtil.getToken();
        if (token != null || token != "")
          options.headers = {'Authorization': '$token'};
        handler.next(options);
      },
      // 响应之前do something...
      onResponse: (e, handler) => e,
      // 错误之前do something...
      onError: (e, handler) => e,
    ));
  }

  /// error统一处理
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return ErrorEntity(code: -1, message: '请求取消');
        }
      case DioErrorType.connectTimeout:
        {
          return ErrorEntity(code: -1, message: '连接超时');
        }
      case DioErrorType.sendTimeout:
        {
          return ErrorEntity(code: -1, message: '请求超时');
        }
      case DioErrorType.receiveTimeout:
        {
          return ErrorEntity(code: -1, message: '响应超时');
        }
      case DioErrorType.response:
        {
          try {
            int errCode = error.response!.statusCode!;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "请求语法错误");
                }
              case 401:
                {
                  return ErrorEntity(code: errCode, message: "没有权限");
                }
              case 403:
                {
                  return ErrorEntity(code: errCode, message: "服务器拒绝执行");
                }
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器");
                }
              case 405:
                {
                  return ErrorEntity(code: errCode, message: "请求方法被禁止");
                }
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误");
                }
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效的请求");
                }
              case 503:
                {
                  return ErrorEntity(code: errCode, message: "服务器挂了");
                }
              case 505:
                {
                  return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
                }
              default:
                {
                  return ErrorEntity(
                      code: errCode, message: error.response!.statusMessage!);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  /// 取消请求
  void cancelRequests(CancelToken token) {
    token.cancel('cancelled');
  }

  // /// 读取本地配置
  // Options getAuthorizationHeader() {
  //   late Options options;
  //   if (token != null) {
  //     options = Options(
  //       headers: {'Authorization': 'Bearer $token'},
  //     );
  //   }
  //   return options;
  // }

  /// restful get 操作
  Future get(String path, dynamic params) async {
    try {
      Response response = await dio.get(path, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post 操作
  Future post(String path, Map<String, dynamic> params) async {
    try {
      Response response = await dio.post(path, data: params);
      return response;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  // /// restful put 操作
  // Future put(String path,
  //     {dynamic params, Options? options, CancelToken? cancelToken}) async {
  //   try {
  //     var tokenOptions = options ?? getLocalOptions();
  //     var response = await dio.put(path,
  //         data: params, options: tokenOptions, cancelToken: cancelToken);
  //     return response.data;
  //   } on DioError catch (e) {
  //     throw createErrorEntity(e);
  //   }
  // }

  // /// restful delete 操作
  // Future delete(String path,
  //     {dynamic params, Options? options, CancelToken? cancelToken}) async {
  //   try {
  //     var tokenOptions = options ?? getLocalOptions();
  //     var response = await dio.delete(path,
  //         data: params, options: tokenOptions, cancelToken: cancelToken);
  //     return response.data;
  //   } on DioError catch (e) {
  //     throw createErrorEntity(e);
  //   }
  // }

  // /// restful post form 表单提交操作
  // Future postForm(String path,
  //     {dynamic params, Options? options, CancelToken? cancelToken}) async {
  //   try {
  //     var tokenOptions = options ?? getLocalOptions();
  //     var response = await dio.post(path,
  //         data: FormData.fromMap(params),
  //         options: tokenOptions,
  //         cancelToken: cancelToken);
  //     return response.data;
  //   } on DioError catch (e) {
  //     throw createErrorEntity(e);
  //   }
  // }
}

// 异常处理
class ErrorEntity implements Exception {
  int? code;
  String? message;
  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
