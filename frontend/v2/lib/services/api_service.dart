import 'dart:developer';

import 'package:http/http.dart';

class ApiService {

  Future<String> getData() async{
    Response response = await get(Uri.parse('https://guiame-api.3far1ivu8btka.us-east-1.cs.amazonlightsail.com/'));

    if(response.statusCode == 200){
      return response.body;
    } else {
      log('Falha na requisição! Status Code: ${response.statusCode}; Body: ${response.body}');
      throw Exception('Code: ${response.statusCode}. Body: ${response.body}');
    }
  }
}