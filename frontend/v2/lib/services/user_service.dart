import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart';

Future<bool> getAuth(String email, String password) async {
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$email:$password'))}';

  Response response = await get(
      Uri.parse(
          'https://guiame-api.3far1ivu8btka.us-east-1.cs.amazonlightsail.com/usuario'),
      headers: {'authorization': basicAuth});

  if (response.statusCode == 200) {
    // final userResult = jsonDecode(response.body);

    var sessionUser = SessionManager();

    await sessionUser.set('isLoggedIn', true);
    // await sessionUser.set('user', userResult[0]);

    var logged = await sessionUser.get('isLoggedIn');

    return logged;
  } else {
    log("Falha na requisição! Status Code: ${response.statusCode}; Body: ${response.body}");
    throw Exception('Code: ${response.statusCode}. Body: ${response.body}');
  }
}

Future<bool> createUser(String name, String email, String password) async {
  Response response = await post(
    Uri.parse('https://guiame-api.3far1ivu8btka.us-east-1.cs.amazonlightsail.com/usuario'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: json.encode({
      'nome': name,
      'email': email,
      'senha': password
    }),
  );

  if(response.statusCode == 200){
    return true;
  } else {
    log("Falha na requisição! Status Code: ${response.statusCode}; Body: ${response.body}");
    throw Exception('Code: ${response.statusCode}. Body: ${response.body}');
  }
}