import 'dart:convert';
import 'dart:io';

import 'package:flutter_shop/utils/token_util.dart';

class HttpService {
  static Future<Map<String, dynamic>?> get(String url,
      {Map<String, dynamic>? param}) async {
    if (url.indexOf("?") < 0) {
      url += "?";
    }

    param?.forEach((key, value) {
      url += (key + "=" + value.toString() + "&");
    });

    url = url.substring(0, url.length - 1);

    HttpClient httpClient;
    HttpClientRequest request;
    HttpClientResponse response;

    try {
      httpClient = HttpClient();
      request = await httpClient.getUrl(Uri.parse(url));
      setHeader(request);
      response = await request.close();
      String body = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      } else {
        print("请求失败...");
      }
    } finally {
      // if (request != null) request.close();
      // if (httpClient != null) httpClient.close();
    }
    return null;
  }

  static Future<Map<String, dynamic>?> post(String url,
      {required Map<String, dynamic> param}) async {
    HttpClient httpClient;
    HttpClientRequest request;
    HttpClientResponse response;

    try {
      httpClient = HttpClient();
      request = await httpClient.postUrl(Uri.parse(url));

      setHeader(request);
      request.add(utf8.encode(json.encode(param)));

      response = await request.close();
      String body = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        Map<String, dynamic> resBody = json.decode(body);
        return resBody;
      } else {
        print("请求失败...");
      }
    } finally {
      // if (request != null) request.close();
      // if (httpClient != null) httpClient.close();
    }
    return null;
  }

  static void setHeader(HttpClientRequest request) async {
    String token = await TokenUtil.getToken();
    print(token);
    if (token != null && token != "") {
      request.headers
          .add(HttpHeaders.contentTypeHeader, "application/json;charset=UTF-8");
      request.headers.add('Authorization', 'Bearer $token');
    }
  }
}
