enum HttpMethod { GET, POST, DELETE }

/// 基础请求

abstract class BaseRequest {
  var pathParams;
  var useHttps = true;

  String authority() => "api.devio.org";

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    // 拼接path参数
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    // http和https的切换
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
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

  Map<String, String> header = Map();

  BaseRequest addHeader(String k, Object v) {
    params[k] = v.toString();
    return this;
  }
}
