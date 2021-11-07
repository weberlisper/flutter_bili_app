import 'package:flutter_bili_app/http/dao/login_dao.dart';

enum HttpMethod { GET, POST, DELETE }

/// 基础请求

abstract class BaseRequest {
  var useHttps = true;
  dynamic body;

  String authority() => "api.devio.org";

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    // http和https的切换
    if (useHttps) {
      uri = Uri.https(authority(), path(), params);
    } else {
      uri = Uri.http(authority(), path(), params);
    }
    if (needLogin()) {
      addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }
    print("url:${uri.toString()}");
    return uri.toString();
  }

  bool needLogin();

  Map<String, String> params = Map();

  /// 添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, String> headers = {
    'course-flag': 'fa',
    'auth-token': 'ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa'
  };

  BaseRequest addHeader(String k, Object v) {
    headers[k] = v.toString();
    return this;
  }
}
