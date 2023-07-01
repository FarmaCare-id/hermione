import 'package:farmacare/data/repository.dart';
import 'package:farmacare/di/components/service_locator.dart';
import 'package:farmacare/stores/error/error_store.dart';
import 'package:farmacare/stores/user/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
      reaction((_) => role, validateRole),
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => profession, validateProfession),
      reaction((_) => licenseNumber, validateLicenseNumber),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  String role = '';

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String fullName = '';

  @observable
  String profession = '';

  @observable
  String licenseNumber = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @computed
  bool get canSubmitRole =>
      !formErrorStore.hasErrorsInRoleInput && role.isNotEmpty;

  @computed
  bool get canSubmitName =>
      !formErrorStore.hasErrorsInNameInput &&
      firstName.isNotEmpty &&
      lastName.isNotEmpty;

  @computed
  bool get canSubmitProfession =>
      !formErrorStore.hasErrorsInProfessionInput && profession.isNotEmpty;

  @computed
  bool get canSubmitLicenseNumber =>
      !formErrorStore.hasErrorsInLicenseNumberInput && licenseNumber.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserEmail(String value) {
    userEmail = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void setRole(String value) {
    role = value;
  }

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setFullName() {
    fullName = this.firstName + ' ' + this.lastName;
  }

  @action
  void setProfession(String value) {
    profession = value;
  }

  @action
  void setLicenseNumber(String value) {
    licenseNumber = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 8) {
      formErrorStore.password = "Password must be at-least 8 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doesn't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  void validateRole(String value) {
    if (value.isEmpty) {
      formErrorStore.role = "Role can't be empty";
    } else {
      formErrorStore.role = null;
    }
  }

  @action
  void validateFirstName(String value) {
    if (value.isEmpty) {
      formErrorStore.firstName = "First name can't be empty";
    } else {
      formErrorStore.firstName = null;
    }
  }

  @action
  void validateLastName(String value) {
    if (value.isEmpty) {
      formErrorStore.lastName = "Last name can't be empty";
    } else {
      formErrorStore.lastName = null;
    }
  }

  @action
  void validateProfession(String value) {
    if (value.isEmpty) {
      formErrorStore.profession = "Profession can't be empty";
    } else {
      formErrorStore.profession = null;
    }
  }

  // TODO: validate license number that it is unique
  @action
  void validateLicenseNumber(String value) {
    if (value.isEmpty) {
      formErrorStore.licenseNumber = "License number can't be empty";
    } else {
      formErrorStore.licenseNumber = null;
    }
  }

  @action
  Future registerUser() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;

      final future =
          getIt.get<Repository>().registerUser(userEmail, fullName, password);
      // fetchRegisterFuture = Observable(future);

      future.then((response) {
        success = response;
      }).catchError((error) {
        success = false;
      });
    });
  }

  @action
  Future login(UserStore userStore) async {
    loading = true;

    try {
      final response = await userStore.login(userEmail, password);
      loading = false;
      success = true;
      return response;
    } catch (error) {
      loading = false;
      success = false;
      errorStore.errorMessage = error
              .toString()
              .contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
    }
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  String? role;

  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? profession;

  @observable
  String? licenseNumber;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;

  @computed
  bool get hasErrorsInRoleInput => role != null;

  @computed
  bool get hasErrorsInNameInput => firstName != null || lastName != null;

  @computed
  bool get hasErrorsInProfessionInput => profession != null;

  @computed
  bool get hasErrorsInLicenseNumberInput => licenseNumber != null;
}
