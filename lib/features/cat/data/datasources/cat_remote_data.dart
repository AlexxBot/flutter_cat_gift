import 'dart:typed_data';

import 'package:http/http.dart' as http;

class CatRemoteData {
  late final http.Client client;

  Future<Uint8List?> getRandomGift() async {
    final uri = Uri.parse('https://cataas.com/cat/gif');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }
}
