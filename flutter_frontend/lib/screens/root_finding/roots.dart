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

abstract class RootFindingResult {
  final List<List<dynamic>> data;
  final String imageUrl;

  RootFindingResult({required this.data, required this.imageUrl});

  factory RootFindingResult.fromJson(Map<String, dynamic> json) {
    return RegulaFalsiResult.fromJson(json);
  }
}

class BisectionResult extends RootFindingResult {
  BisectionResult({required List<List<dynamic>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory BisectionResult.fromJson(Map<String, dynamic> json) {
    return BisectionResult(
      data: List<List<dynamic>>.from(
          json['bisection_data'].map((x) => List<dynamic>.from(x))),
      imageUrl: json['plot_image_url'],
    );
  }
}

class NewtonResult extends RootFindingResult {
  NewtonResult({required List<List<dynamic>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory NewtonResult.fromJson(Map<String, dynamic> json) {
    return NewtonResult(
      data: List<List<dynamic>>.from(
          json['newton_data'].map((x) => List<dynamic>.from(x))),
      imageUrl: json['plot_image_url'],
    );
  }
}

class SecantResult extends RootFindingResult {
  SecantResult({required List<List<dynamic>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory SecantResult.fromJson(Map<String, dynamic> json) {
    return SecantResult(
      data: List<List<dynamic>>.from(
          json['secant_data'].map((x) => List<dynamic>.from(x))),
      imageUrl: json['plot_image_url'],
    );
  }
}

class RegulaFalsiResult extends RootFindingResult {
  RegulaFalsiResult(
      {required List<List<dynamic>> data, required String imageUrl})
      : super(data: data, imageUrl: imageUrl);

  factory RegulaFalsiResult.fromJson(Map<String, dynamic> json) {
    return RegulaFalsiResult(
      data: List<List<dynamic>>.from(
          json['regulafalsi_data'].map((x) => List<dynamic>.from(x))),
      imageUrl: json['plot_image_url'],
    );
  }
}

Future<RootFindingResult?> postMethod(
    String function, int a, int b, int n, String method) async {
  HttpOverrides.global = MyHttpOverrides();
  String apiUrl = "";
  if (method == 'bisection') {
    apiUrl = 'http://192.168.1.8:8000/api/bisection/';
  } else if (method == 'newton') {
    print(apiUrl);
    apiUrl = 'http://192.168.1.8:8000/api/newtons/';
  } else if (method == 'secant') {
    apiUrl = 'http://192.168.1.8:8000/api/secant/';
  } else if (method == 'regula_falsi') {
    apiUrl = 'http://192.168.1.8:8000/api/regula_falsi/';
  }

  // Create the request body
  Map<String, dynamic> requestBody = {
    'function': function,
    'a': a,
    'b': b,
    'n': n,
  };
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

      if (method == 'bisection') {
        return BisectionResult.fromJson(responseData);
      } else if (method == 'newton') {
        print(apiUrl);
        return NewtonResult.fromJson(responseData);
      } else if (method == 'secant') {
        return SecantResult.fromJson(responseData);
      } else if (method == 'regula_falsi') {
        return RegulaFalsiResult.fromJson(responseData);
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
