/// This file is modified from
/// chopper-4.0.0-nullsafety.1/lib/src/interceptor.dart.
/// All rights belong to its owners if there are.

import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:getx_project_demo/app/data/models/user_model.dart';

class ModelConverter implements Converter, ErrorConverter {
  ModelConverter();

  @override
  Request convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

  Request encodeJson(Request request) {
    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }

  /// BodyType is the expected type of the response body
  /// (e.g., String or CustomObject).
  /// If BodyType is a List or a BuiltList,
  /// InnerType is the type of the generic parameter
  /// (e.g., convertResponse<List<CustomObject>, CustomObject>(response)).

  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }

    body = _tryDecodeJson(body);
    if (isTypeOf<BodyType, Iterable<InnerType>>()) {
      body = body.cast<InnerType>();
    } else if (isTypeOf<BodyType, Map<String, InnerType>>()) {
      body = body.cast<String, InnerType>();
    }

    // print(BodyType);
    // print(InnerType.toString());

    return response.copyWith<BodyType>(body: _generateModel(InnerType, body));
  }

  /// A factory method that generates Model according to given runtimeType
  dynamic _generateModel(Type type, dynamic body) {
    // TODO: Add your own model convertion logic here.
    switch (type.toString()) {
      case 'User':
        return User.fromJson(body);
      default:
        return body;
    }
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }

  dynamic _tryDecodeJson(String data) {
    try {
      return json.decode(data);
    } catch (e) {
      chopperLogger.warning(e);
      return data;
    }
  }

  @override
  Response convertError<BodyType, InnerType>(Response response) =>
      decodeJson(response);

  static Response<BodyType> responseFactory<BodyType, InnerType>(
    Response response,
  ) {
    return const JsonConverter().convertResponse<BodyType, InnerType>(response);
  }

  static Request requestFactory(Request request) {
    return const JsonConverter().convertRequest(request);
  }
}
