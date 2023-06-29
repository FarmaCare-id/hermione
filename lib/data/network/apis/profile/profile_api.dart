import 'dart:async';

import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/network/dio_client.dart';
import 'package:farmacare/models/user/user.dart';

class ProfileApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  // final RestClient _restClient;

  // injecting dio instance
  ProfileApi(this._dioClient);

  /// Returns list of post in response
  Future<User> getProfile() async {
    try {
      final res = await _dioClient.get(Endpoints.profile);
      return User.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}
