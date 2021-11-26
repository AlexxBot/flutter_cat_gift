import 'dart:typed_data';

import 'package:cat_gift/core/error/exception.dart';
import 'package:cat_gift/core/network/network_info.dart';
import 'package:cat_gift/injections.dart';
import 'package:http/http.dart' as http;

abstract class CatRemoteData {
  Future<Uint8List> getRandomGift();
}

class CatRemoteDataImple implements CatRemoteData {
  late final http.Client client;

  CatRemoteDataImple({required this.client});

  @override
  Future<Uint8List> getRandomGift() async {
    final uri = Uri.parse('${sl<NetworkInfo>().url}/cat/gif');
    final response = await client.get(uri).timeout(const Duration(seconds: 10),
        onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }
}
