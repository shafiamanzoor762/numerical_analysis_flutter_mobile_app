import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

abstract class LinearEqsResult {
  final List<Map<int, List<dynamic>>> data;
  final String imageUrl;

  LinearEqsResult({required this.data, required this.imageUrl});

  factory LinearEqsResult.fromJson(Map<String, dynamic> json, String method) {
    switch (method) {
      case 'jacobi':
        return JacobiResult.fromJson(json);
      case 'seidal':
        return SeidalResult.fromJson(json);
      case 'relaxation':
        return RelaxationResult.fromJson(json);
      default:
        throw Exception('Unknown method: $method');
    }
  }
}

class JacobiResult extends LinearEqsResult {
  JacobiResult(
      {required List<Map<int, List<dynamic>>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory JacobiResult.fromJson(Map<String, dynamic> json) {
    return JacobiResult(
      data: (json['jacobi_data'] as List)
          .map((item) => {item[0] as int: List<dynamic>.from(item[1])})
          .toList(),
      imageUrl: json['plot_image_url'],
    );
  }
}

class SeidalResult extends LinearEqsResult {
  SeidalResult(
      {required List<Map<int, List<dynamic>>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory SeidalResult.fromJson(Map<String, dynamic> json) {
    return SeidalResult(
      data: (json['seidal_data'] as List)
          .map((item) => {item[0] as int: List<dynamic>.from(item[1])})
          .toList(),
      imageUrl: json['plot_image_url'],
    );
  }
}

class RelaxationResult extends LinearEqsResult {
  RelaxationResult(
      {required List<Map<int, List<dynamic>>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory RelaxationResult.fromJson(Map<String, dynamic> json) {
    return RelaxationResult(
      data: (json['relaxation_data'] as List)
          .map((item) => {item[0] as int: List<dynamic>.from(item[1])})
          .toList(),
      imageUrl: json['plot_image_url'],
    );
  }
}

Future<LinearEqsResult?> postMethod(
    String a, String b, String x0, int n, int? w, String method) async {
  HttpOverrides.global = MyHttpOverrides();
  String apiUrl = "";
  // Create the request body
  Map<String, dynamic> requestBody = {
    'a': a,
    'b': b,
    'x0': x0,
    'n': n,
  };
  if (method == 'jacobi') {
    apiUrl = 'http://192.168.1.8:8000/api/jacobi/';
  } else if (method == 'seidal') {
    print(apiUrl);
    apiUrl = 'http://192.168.1.8:8000/api/seidal/';
  } else if (method == 'relaxation') {
    apiUrl = 'http://192.168.1.8:8000/api/relaxation/';
    requestBody.addAll({'w': w});
  }

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);

      if (method == 'jacobi') {
        return JacobiResult.fromJson(responseData);
      } else if (method == 'seidal') {
        print(apiUrl);
        return SeidalResult.fromJson(responseData);
      } else if (method == 'relaxation') {
        return RelaxationResult.fromJson(responseData);
      }
    } else {
      print('Error: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
  return null;
}
