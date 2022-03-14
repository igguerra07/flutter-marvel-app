import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_app/src/entities/exceptions.dart';
import 'package:marvel_app/src/models/characters_response_model.dart';

const apiKey = "23bd2768bfa67545ef764372523ea20a";
const privateKey = "1d30c1b6b061a8b100be8c9638aaa734e74ad4e2";
const baseUrl = "https://gateway.marvel.com/v1/public";
const getCharcters = "characters";

class MarvelService {
  late final http.Client _client;

  MarvelService({
    required http.Client client,
  }) {
    _client = client;
  }

  Future<CharactersResponse> getCharacters() async {
    final hash = md5.convert(utf8.encode("1$privateKey$apiKey"));
  
    final path =
        "$baseUrl/$getCharcters?apikey=$apiKey&hash=$hash&ts=1";

    final response = await _client.get(
      Uri.parse(path),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CharactersResponse.fromJson(json);
    } else {
      throw ServerException();
    }
  }
}
