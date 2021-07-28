import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_shop/config/api_url.dart';
import 'package:flutter_shop/utils/token_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Http请求工具类
class HttpUtil {
  static HttpUtil _instanse = HttpUtil._internal();
  factory HttpUtil() => _instanse;
  late Dio dio;
  CancelToken cancelToken = new CancelToken();

  // 初始化HttpUtil
  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      //基础路径
      baseUrl: ApiUrl.URL_HEAD,
      //连接服务器超时时间(毫秒)
      connectTimeout: 5000,
      //响应流前后两次接受到数据的间隔(毫秒)
      receiveTimeout: 10000,
      //请求类型
      contentType: 'application/json;charset=utf-8',
      //期望接受相应数据的类型
      responseType: ResponseType.json,
    );
    dio = new Dio(options);
    //Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    //添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      // 请求之前do something...
      onRequest: (options, handler) async {
        String token = await TokenUtil.getToken();
        if (token.isNotEmpty) options.headers = {'Authorization': '$token'};
        handler.next(options);
      },
      // 响应之前do something...
      onResponse: (e, handler) {
        return handler.next(e);
      },
      // 错误之前do something...
      onError: (e, handler) {
        EasyLoading.showError(e.message,
            duration: Duration(milliseconds: 2000));
        return handler.next(e);
      },
    ));
  }

  /// 错误码
  static final codeMessage = {
    400: "发出的请求有错误，服务器没有进行新建或修改数据的操作",
    401: "登录已失效或者在其他设备登录，请重新登录！",
    403: "没有权限访问.",
    404: "发出的请求针对的是不存在的记录，服务器没有进行操作",
    405: "请求方法被禁止",
    406: "请求的格式不可得。",
    410: "请求的资源被永久删除，且不会再得到的",
    422: "发生一个验证错误，请检查输入参数",
    429: "请求过于频繁，稍后再试",
    500: "服务器出了点小问题,我们将尽快恢复",
    502: "网关错误。",
    503: "服务不可用，服务器暂时过载或维护",
    504: "请求超时,请稍后再试",
    505: "不支持HTTP协议请求",
  };

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
                  return ErrorEntity(code: errCode, message: codeMessage[400]);
                }
              case 401:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[401]);
                }
              case 403:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[403]);
                }
              case 404:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[404]);
                }
              case 405:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[405]);
                }
              case 406:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[406]);
                }
              case 410:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[410]);
                }
              case 422:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[422]);
                }
              case 429:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[429]);
                }
              case 500:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[500]);
                }
              case 502:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[502]);
                }
              case 503:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[503]);
                }
              case 504:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[504]);
                }
              case 505:
                {
                  return ErrorEntity(code: errCode, message: codeMessage[505]);
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

  /// restful get 操作
  Future get(String path,
      {Map<String, dynamic>? params, bool? isShowLoad}) async {
    if (isShowLoad == true) EasyLoading.show();
    try {
      Response response = await dio.get(path, queryParameters: params);
      if (isShowLoad == true) EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post 操作
  Future post(String path,
      {required Map<String, dynamic> params, bool? isShowLoad}) async {
    if (isShowLoad == true) EasyLoading.show();
    try {
      Response response = await dio.post(path, data: params);
      EasyLoading.dismiss();
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful put 操作
  Future put(String path,
      {dynamic params, Options? options, CancelToken? cancelToken}) async {
    try {
      var response =
          await dio.put(path, data: params, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful delete 操作
  Future delete(String path,
      {dynamic params, Options? options, CancelToken? cancelToken}) async {
    try {
      var response =
          await dio.delete(path, data: params, cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post form 表单提交操作
  Future postForm(String path,
      {dynamic params, Options? options, CancelToken? cancelToken}) async {
    try {
      var response = await dio.post(path,
          data: FormData.fromMap(params), cancelToken: cancelToken);
      return response.data;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    }
  }
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
