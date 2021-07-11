import 'dart:async';
import 'dart:io';

import 'package:challenge_app/core/data/api_base.dart';
import 'package:challenge_app/core/data/api_exceptions.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<String> fetchData(String url, {Map<String, String>? params}) async {
    var responseJson;

    var uri = APIBase.baseURL +
        url +
        ((params != null) ? this.queryParameters(params) : "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final endPoint = Uri.parse(uri);
      final response = await http.get(endPoint, headers: header);
      //print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String>? params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final endpoint = Uri.parse(APIBase.baseURL + url);
      final response = await http.post(
        endpoint,
        body: body,
        headers: header,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
