import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FactsRequests {
  final Dio _dio = Dio();
  Future<String?> getFact() async {
    try{
     final response = await _dio.get('https://catfact.ninja/fact?max_length=80');
     debugPrint(response.data.toString());
     return response.data["fact"];
    
    } catch(e) {
      print('Facts loading error: $e');
      return ' ';
    }
  }
}
