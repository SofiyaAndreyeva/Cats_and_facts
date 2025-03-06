import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ImageRequests {
  final Dio _dio = Dio();
  Future<String?> getImage() async {
    try {
      final response = await _dio.get('https://cataas.com/cat/cute?json=true');
      debugPrint(response.data.toString());
      return response.data["url"];
    } catch (e) {
      print('Image loading error: $e');
      return null;
    }
  }
}
