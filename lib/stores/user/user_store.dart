import 'package:farmacare/models/user/user.dart';
import 'package:farmacare/stores/error/error_store.dart';
import 'package:farmacare/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // auth token
  String authToken = 'kosong';

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
      repository.authToken.then((value) {
        this.authToken = value!;
      });

      getProfile();
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptyLoginResponse =
      ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  User? user;

  @observable
  ObservableFuture<bool> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    var future = _repository.login(email, password);

    await future.then((value) async {
      if (value != null) {
        _repository.saveIsLoggedIn(true);
        _repository.saveAuthToken(value);
        this.authToken = value;
        this.isLoggedIn = true;
        this.success = true;
      } else {
        print('failed to login');
      }
    }).catchError((e) {
      print(e);
      this.isLoggedIn = false;
      this.success = false;
      throw e;
    });
  }

  @action
  Future logout(String token) async {
    final future = _repository.logout(token);

    await future.then((value) async {
      if (value) {
        _repository.saveIsLoggedIn(false);
        _repository.saveAuthToken('');
        this.authToken = '';
        this.isLoggedIn = false;
        this.success = true;
      } else {
        print('failed to logout');
      }
    }).catchError((e) {
      print(e);
      this.isLoggedIn = true;
      this.success = false;
      throw e;
    });
  }

  @action
  Future getProfile() async {
    final future = _repository.getProfile(this.authToken);
    future.then((user) {
      this.user = user;
    }).catchError((e) {
      errorStore.errorMessage = DioErrorUtil.handleError(e);
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}