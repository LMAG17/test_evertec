import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServiceFactory {
  //-_-_-_-_-_-_-_-_-_-_-_-_-_-_Constantes-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
  static final serverUrl = "";
  final String login = "";
  final String tranKey = "";
  static final String routeGateway = "/gateway";
  //-_-_-_-_-_-_-_-_-_-_-_-_-_-Rutas-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
  final String routeOtp = "/otp";
  final String routeInformation = "/information";
  final String routeInterest = "/interests";
  final String routeGenerate = "/generate";
  final String routeValidate = "/validate";
  final String routeProcess = "/process";
  final String routeSafeProcess = "/safe-process";
  final String routeQuery = "/query";
  final String routeReverseTransaction = "/transaction";
  final String routeTokenize = "/tokenize";
  final String routeSearch = "/search";
  //-_-_-_-_-_-_-_-_-_-_-_-_-_-Cabeceras-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  //-_-_-_-_-_-_-_-_-_-_-_-_-_-Peticiones-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
  Future<String> handleMethod(
    String method,
    String url, {
    String send,
  }) async {
    try {
      method = method.toUpperCase();
      url = "$serverUrl$routeGateway$url";
      print('$method: $url');
      if (method == 'POST' || method == 'PUT') print('Request Body: $send');
      Response response;
      switch (method) {
        case 'DELETE':
          response = await http.delete(url, headers: headers);
          break;
        case 'PUT':
          response = await http.put(url, headers: headers, body: send);
          break;
        case 'POST':
          response = await http
              .post(url, headers: headers, body: send)
              .catchError((onError) {
            print(onError);
          });
          break;
        default:
          response = await http.get(url, headers: headers);
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Response: ${response.body}');
        return response.body;
      } else {
        throw Exception(
            'Failed to load ${response.request.method} code: ${response.statusCode}');
      }
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
