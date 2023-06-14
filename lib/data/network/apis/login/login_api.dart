import 'dart:async';

import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/network/dio_client.dart';

class LoginApi {
  final DioClient _dioClient;


  LoginApi(this._dioClient);

  Future<dynamic> login(String email, String password) async {
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
    // try {
    //   String url = Endpoints.login;
    //   final res = await _dioClient.post(url, data: {
    //     'email': email,
    //     'password': password,
    //   });

    //   if (res['status'] == 'SUCCESS') {
    //     return {
    //       'status': 'SUCCESS',
    //       'token': res['data']['token'],
    //     };
    //   }
    //   return {
    //     'status': 'ERROR',
    //     'message': res['error'],
    //   };
    // } catch (e) {
    //   print(e.toString());
    //   throw e;
    // }
  }
}
