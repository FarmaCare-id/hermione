// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_FormStore.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_FormStore.canRegister'))
          .value;
  Computed<bool>? _$canSubmitRoleComputed;

  @override
  bool get canSubmitRole =>
      (_$canSubmitRoleComputed ??= Computed<bool>(() => super.canSubmitRole,
              name: '_FormStore.canSubmitRole'))
          .value;
  Computed<bool>? _$canSubmitNameComputed;

  @override
  bool get canSubmitName =>
      (_$canSubmitNameComputed ??= Computed<bool>(() => super.canSubmitName,
              name: '_FormStore.canSubmitName'))
          .value;
  Computed<bool>? _$canSubmitProfessionComputed;

  @override
  bool get canSubmitProfession => (_$canSubmitProfessionComputed ??=
          Computed<bool>(() => super.canSubmitProfession,
              name: '_FormStore.canSubmitProfession'))
      .value;
  Computed<bool>? _$canSubmitLicenseNumberComputed;

  @override
  bool get canSubmitLicenseNumber => (_$canSubmitLicenseNumberComputed ??=
          Computed<bool>(() => super.canSubmitLicenseNumber,
              name: '_FormStore.canSubmitLicenseNumber'))
      .value;
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_FormStore.canForgetPassword'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_FormStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$roleAtom = Atom(name: '_FormStore.role', context: context);

  @override
  String get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(String value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_FormStore.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_FormStore.lastName', context: context);

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_FormStore.fullName', context: context);

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$professionAtom =
      Atom(name: '_FormStore.profession', context: context);

  @override
  String get profession {
    _$professionAtom.reportRead();
    return super.profession;
  }

  @override
  set profession(String value) {
    _$professionAtom.reportWrite(value, super.profession, () {
      super.profession = value;
    });
  }

  late final _$licenseNumberAtom =
      Atom(name: '_FormStore.licenseNumber', context: context);

  @override
  String get licenseNumber {
    _$licenseNumberAtom.reportRead();
    return super.licenseNumber;
  }

  @override
  set licenseNumber(String value) {
    _$licenseNumberAtom.reportWrite(value, super.licenseNumber, () {
      super.licenseNumber = value;
    });
  }

  late final _$successAtom = Atom(name: '_FormStore.success', context: context);

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

  late final _$loadingAtom = Atom(name: '_FormStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_FormStore.register', context: context);

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$loginAsyncAction =
      AsyncAction('_FormStore.login', context: context);

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('_FormStore.forgotPassword', context: context);

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_FormStore.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setUserId(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRole(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setRole');
    try {
      return super.setRole(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFullName() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setFullName');
    try {
      return super.setFullName();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfession(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setProfession');
    try {
      return super.setProfession(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLicenseNumber(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setLicenseNumber');
    try {
      return super.setLicenseNumber(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRole(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateRole');
    try {
      return super.validateRole(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFirstName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateFirstName');
    try {
      return super.validateFirstName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLastName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateLastName');
    try {
      return super.validateLastName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateProfession(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateProfession');
    try {
      return super.validateProfession(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLicenseNumber(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateLicenseNumber');
    try {
      return super.validateLicenseNumber(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
role: ${role},
firstName: ${firstName},
lastName: ${lastName},
fullName: ${fullName},
profession: ${profession},
licenseNumber: ${licenseNumber},
success: ${success},
loading: ${loading},
canLogin: ${canLogin},
canRegister: ${canRegister},
canSubmitRole: ${canSubmitRole},
canSubmitName: ${canSubmitName},
canSubmitProfession: ${canSubmitProfession},
canSubmitLicenseNumber: ${canSubmitLicenseNumber},
canForgetPassword: ${canForgetPassword}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;
  Computed<bool>? _$hasErrorsInRoleInputComputed;

  @override
  bool get hasErrorsInRoleInput => (_$hasErrorsInRoleInputComputed ??=
          Computed<bool>(() => super.hasErrorsInRoleInput,
              name: '_FormErrorStore.hasErrorsInRoleInput'))
      .value;
  Computed<bool>? _$hasErrorsInNameInputComputed;

  @override
  bool get hasErrorsInNameInput => (_$hasErrorsInNameInputComputed ??=
          Computed<bool>(() => super.hasErrorsInNameInput,
              name: '_FormErrorStore.hasErrorsInNameInput'))
      .value;
  Computed<bool>? _$hasErrorsInProfessionInputComputed;

  @override
  bool get hasErrorsInProfessionInput =>
      (_$hasErrorsInProfessionInputComputed ??= Computed<bool>(
              () => super.hasErrorsInProfessionInput,
              name: '_FormErrorStore.hasErrorsInProfessionInput'))
          .value;
  Computed<bool>? _$hasErrorsInLicenseNumberInputComputed;

  @override
  bool get hasErrorsInLicenseNumberInput =>
      (_$hasErrorsInLicenseNumberInputComputed ??= Computed<bool>(
              () => super.hasErrorsInLicenseNumberInput,
              name: '_FormErrorStore.hasErrorsInLicenseNumberInput'))
          .value;

  late final _$userEmailAtom =
      Atom(name: '_FormErrorStore.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormErrorStore.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$roleAtom = Atom(name: '_FormErrorStore.role', context: context);

  @override
  String? get role {
    _$roleAtom.reportRead();
    return super.role;
  }

  @override
  set role(String? value) {
    _$roleAtom.reportWrite(value, super.role, () {
      super.role = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: '_FormErrorStore.firstName', context: context);

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_FormErrorStore.lastName', context: context);

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$professionAtom =
      Atom(name: '_FormErrorStore.profession', context: context);

  @override
  String? get profession {
    _$professionAtom.reportRead();
    return super.profession;
  }

  @override
  set profession(String? value) {
    _$professionAtom.reportWrite(value, super.profession, () {
      super.profession = value;
    });
  }

  late final _$licenseNumberAtom =
      Atom(name: '_FormErrorStore.licenseNumber', context: context);

  @override
  String? get licenseNumber {
    _$licenseNumberAtom.reportRead();
    return super.licenseNumber;
  }

  @override
  set licenseNumber(String? value) {
    _$licenseNumberAtom.reportWrite(value, super.licenseNumber, () {
      super.licenseNumber = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
role: ${role},
firstName: ${firstName},
lastName: ${lastName},
profession: ${profession},
licenseNumber: ${licenseNumber},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword},
hasErrorsInRoleInput: ${hasErrorsInRoleInput},
hasErrorsInNameInput: ${hasErrorsInNameInput},
hasErrorsInProfessionInput: ${hasErrorsInProfessionInput},
hasErrorsInLicenseNumberInput: ${hasErrorsInLicenseNumberInput}
    ''';
  }
}
