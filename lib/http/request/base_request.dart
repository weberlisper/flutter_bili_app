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

  Map<String, String> headers = Map();

  BaseRequest addHeader(String k, Object v) {
    headers[k] = v.toString();
    return this;
  }
}
