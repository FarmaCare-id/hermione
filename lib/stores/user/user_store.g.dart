// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_UserStore.isLoading'))
      .value;

  late final _$successAtom = Atom(name: '_UserStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$userAtom = Atom(name: '_UserStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_UserStore.loginFuture', context: context);

  @override
  ObservableFuture<bool> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<bool> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<dynamic> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_UserStore.logout', context: context);

  @override
  Future<dynamic> logout(String token) {
    return _$logoutAsyncAction.run(() => super.logout(token));
  }

  late final _$getProfileAsyncAction =
      AsyncAction('_UserStore.getProfile', context: context);

  @override
  Future<dynamic> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  @override
  String toString() {
    return '''
success: ${success},
user: ${user},
loginFuture: ${loginFuture},
isLoading: ${isLoading}
    ''';
  }
}
