import 'package:flutter/foundation.dart';
import 'package:untitled6/core/apis.dart';
import 'package:http/http.dart' as http;

abstract class Network {
  Future<String?> methodGet({required String api, Map<String, Object?> headers = Api.headers, String baseUrl = Api.baseUrlValyuta});
  Future<String?> methodGetFlag({required String api, Map<String, Object?> headers = Api.headers, String baseUrl = Api.baseUrlFlag});
}

class HttpNetwork implements Network {
  @override
  Future<String?> methodGet({required String api, Map<String, Object?> headers = Api.headers, String baseUrl = Api.baseUrlValyuta}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.get(url);
      if(response.statusCode == 200){
        return response.body;
      }
    }catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<String?> methodGetFlag({required String api, Map<String, Object?> headers = Api.headers, String baseUrl = Api.baseUrlFlag}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.get(url);
      if(response.statusCode == 200){
        return response.body;
      }
    }catch (e) {
      debugPrint(e.toString());
    }
  }
}