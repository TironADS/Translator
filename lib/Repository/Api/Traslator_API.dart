import 'dart:convert';

import 'package:http/http.dart';

import '../Model_Class/TranslatorModel.dart';
import 'api_client.dart';

class TranslatorApi {
  ApiClient apiClient = ApiClient();

  Future<TranslatorModel> getTranslator({ required String text}) async {
    String path =
        'https://google-translate113.p.rapidapi.com/api/v1/translator/text';
    var body = {
      'from':'auto',
      'to':'ml',
    'text': text
    };

    Response response = await apiClient.invokeAPI(path, 'POST', body);
    return TranslatorModel.fromJson(jsonDecode(response.body));
  }
}