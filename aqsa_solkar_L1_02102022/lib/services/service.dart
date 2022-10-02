
import 'dart:convert';

import 'api_provider.dart';
import 'package:http/http.dart' as http;

class WebServices extends ApiProvider {
  @override
  Future<dynamic> httpGet(String path) async {
    try {
      var response = await http.get(Uri.parse(path));
      final responseData = _response(response);
      return responseData;
    } catch (e) {
      print('Error...$e');
    }
  }

  @override
  Future<dynamic> httpPost(String path) async {
    var response = await http.post(Uri.parse("uri"));
    final responseData = _response(response);
    return responseData;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        break;
      case 401:
        break;
      case 403:
        break;
      case 500:
        break;
    }
  }
}
