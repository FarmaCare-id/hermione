import 'dart:async';

import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/network/dio_client.dart';

class LoginApi {
  final DioClient _dioClient;

  LoginApi(this._dioClient);

  Future<dynamic> login(String email, String password) async {
    try {
      String url = Endpoints.login;
      final res = await _dioClient.post(url, data: {
        'email': email,
        'password': password,
      });

      if (res['status'] == 'SUCCESS') {
        return {
          'status': 'SUCCESS',
          'token': res['data']['token'],
        };
      }
      return {
        'status': 'ERROR',
        'message': res['error'],
      };
    } catch (e) {
      print(e.toString());
      throw {
        'status': 'ERROR',
        'message': e.toString(),
      };
    }
  }

  Future<dynamic> logout(String token) async {
    try {
      String url = Endpoints.logout;
      final res = await _dioClient.post(url, data: {
        'token': token,
      });

      if (res['status'] == 'SUCCESS') {
        return {
          'status': 'SUCCESS',
          'message': res['message'],
        };
      }
      return {
        'status': 'ERROR',
        'message': res['error'],
      };
    } catch (e) {
      print(e.toString());
      throw {
        'status': 'ERROR',
        'message': e.toString(),
      };
    }
  }
}
