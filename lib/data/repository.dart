import 'dart:async';

import 'package:farmacare/data/local/datasources/post/post_datasource.dart';
import 'package:farmacare/data/network/apis/profile/profile_api.dart';
import 'package:farmacare/data/network/apis/register/register_api.dart';
import 'package:farmacare/data/sharedpref/shared_preference_helper.dart';
import 'package:farmacare/models/post/post.dart';
import 'package:farmacare/models/post/post_list.dart';
import 'package:farmacare/models/user/user.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';
import 'network/apis/login/login_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;
  final LoginApi _loginApi;
  final RegisterApi _registerApi;
  final ProfileApi _profileApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._postApi, this._loginApi, this._registerApi, this._profileApi,
      this._sharedPrefsHelper, this._postDataSource);

  // Post: ---------------------------------------------------------------------
  Future<PostList> getPosts() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getPosts().then((postsList) {
      postsList.posts?.forEach((post) {
        _postDataSource.insert(post);
      });

      return postsList;
    }).catchError((error) => throw error);
  }

  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  // Profile: ------------------------------------------------------------------
  Future<User> getProfile(String authToken) async {
    return await _profileApi.getProfile(authToken).then((user) {
      return user;
    }).catchError((error) => throw error);
  }

  // Auth:---------------------------------------------------------------------
  Future<dynamic> login(String email, String password) async {
    return await _sharedPrefsHelper.isLoggedIn.then((isLoggedIn) {
      if (!isLoggedIn) {
        return _loginApi.login(email, password).then((data) {
          if (data['status'] == 'FAILED') {
            throw data['error'];
            // return false;
          } else {
            _sharedPrefsHelper.saveAuthToken(data['token']);
            // _sharedPrefsHelper.saveIsLoggedIn(true);
            return data['token'];
          }
        }).catchError((error) => throw error);
      } else {
        // TODO: throw custom exception
        return Future.value(false);
      }
    });
    // return await Future.delayed(Duration(seconds: 2), ()=> true);
  }

  Future<dynamic> logout(String token) async {
    return await _sharedPrefsHelper.isLoggedIn.then((isLoggedIn) {
      if (isLoggedIn) {
        return _loginApi.logout(token).then((data) {
          if (data['status'] == 'FAILED') {
            throw data['error'];
            // return false;
          } else {
            _sharedPrefsHelper.saveAuthToken('');
            _sharedPrefsHelper.saveIsLoggedIn(false);
            return true;
          }
        }).catchError((error) => throw error);
      } else {
        return Future.value(false);
      }
    });
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveAuthToken(String token) =>
      _sharedPrefsHelper.saveAuthToken(token);

  Future<String?> get authToken => _sharedPrefsHelper.authToken;

  // Register:------------------------------------------------------------------
  Future<bool> registerUser(
      String email, String fullName, String password) async {
    return await _registerApi
        .registerUser(email, fullName, password)
        .then((data) {
      if (data['status'] == 'FAILED') {
        throw data['error'];
        // return false;
      } else {
        // return Future.value(true);
        return true;
      }
    }).catchError((error) => throw error);
  }

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
