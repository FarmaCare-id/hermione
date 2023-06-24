import 'dart:async';

import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/network/dio_client.dart';

class RegisterApi {
  final DioClient _dioClient;

  RegisterApi(this._dioClient);

  Future<dynamic> registerUser(
    String email,
    String fullName,
    String password,
  ) async {
    try {
      String url = Endpoints.register;
      final res = await _dioClient.post(url, data: {
        'email': email,
        'fullName': fullName,
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

  Future<dynamic> registerDoctor (
    String email,
    String password,
    String fullname,
    String no_sip,
  ) async {
    try {
      String url = Endpoints.registerDoctor;
      final res = await _dioClient.post(url, data: {
        'email': email,
        'password': password,
        'name': fullname,
        'no_sip': no_sip,
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
  
  Future<dynamic> registerPharmacist (
    String email,
    String password,
    String fullname,
    String no_sipa,
  ) async {
    try {
      String url = Endpoints.register;
      final res = await _dioClient.post(url, data: {
        'email': email,
        'password': password,
        'fullname': fullname,
        'no_sipa': no_sipa,
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
}
