import 'dart:async';

import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/network/dio_client.dart';
import 'package:farmacare/data/network/rest_client.dart';

class LoginApi {
  final DioClient _dioClient;

  final RestClient _restClient;

  LoginApi(this._dioClient, this._restClient);

  // process login
  Future<bool> login(String email, String password) async {
    try {
      String url = Endpoints.login;
      final res = await _dioClient.post(url, data: {
        'email': email,
        'password': password,
      });
      
      if (res['status'] == 'success') {
        return true;
      }

      return false;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
