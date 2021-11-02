import 'dart:convert';

import 'package:flutter_bili_app/http/request/base_request.dart';

class HiNetResponse<T> {
  HiNetResponse({this.data,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra});

  T data;
  BaseRequest request;
  int statusCode;
  String statusMessage;
  dynamic extra;

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    } else {
      return data.toString();
    }
  }
}

abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>(BaseRequest request);
}
