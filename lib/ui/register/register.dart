import 'package:another_flushbar/flushbar_helper.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/language/language_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/widgets/app_icon_widget.dart';
import 'package:farmacare/widgets/progress_indicator_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  // focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;

  // stores:---------------------------------------------------------------------
  late FormStore _formStore;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _formStore = Provider.of<FormStore>(context);
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  // body methods:---------------------------------------------------------------
  Widget _buildBody() {
    return Material(
        child: Stack(
      children: <Widget>[
        Center(
          child: _buildContent(),
        ),
        Observer(
          builder: (context) {
            return _formStore.success
                ? navigate(context)
                : _showErrorMessage(_formStore.errorStore.errorMessage);
          },
        ),
        Observer(
          builder: (context) {
            return Visibility(
              visible: _formStore.loading,
              child: CustomProgressIndicatorWidget(),
            );
          },
        )
      ],
    ));
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            _buildSignInGoogle(),
            SizedBox(height: 24),
            Text(
              'OR LOGIN WITH EMAIL',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 24),
            _buildRegisterForm(),
            SizedBox(height: 24),
            _buildSignUpButton(),
            _buildSignInButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 24),
      child: Center(
        child: Text.rich(
          TextSpan(
            text: "Already have an account? ",
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                text: 'Sign In',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, Routes.login);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInGoogle() {
    return Container(
      width: 300,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Handle sign in with Google logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue50,
          foregroundColor: AppColors.black800,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: AppColors.bluePeriwinkleDark, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppIconWidget(image: 'assets/icons/icons8-google-48.png'),
            SizedBox(width: 18),
            Text(
              'Continue with Google',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [AppColors.bluePeriwinkle, AppColors.blue300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () async {
          Navigator.pushNamed(context, Routes.roleSelect);
          // if (_formStore.canLogin) {
          //   DeviceUtils.hideKeyboard(context);
          //   _formStore.login();
          // } else {
          //   _showErrorMessage('Please fill in all fields');
          // }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Text(
            AppLocalizations.of(context).translate('login_btn_sign_up'),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Column(
      children: [
        _buildEmailField(),
        SizedBox(height: 16),
        _buildPasswordField(),
        SizedBox(height: 16),
        _buildConfirmPasswordField(),
      ],
    );
  }

  Widget _buildEmailField() {
    return Observer(
      builder: (context) {
        return TextField(
          decoration: InputDecoration(
            hintText:
                AppLocalizations.of(context).translate('login_et_user_email'),
            prefixIcon: Icon(Icons.person,
                color: _themeStore.darkMode ? Colors.white70 : Colors.black54),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: _formStore.formErrorStore.userEmail,
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          controller: _userEmailController,
          autofocus: false,
          onChanged: (value) {
            _formStore.setUserEmail(_userEmailController.text);
          },
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextField(
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)
                .translate('login_et_user_password'),
            prefixIcon: Icon(Icons.lock,
                color: _themeStore.darkMode ? Colors.white70 : Colors.black54),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: _formStore.formErrorStore.password,
          ),
          obscureText: true,
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          onChanged: (value) {
            _formStore.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return Observer(
      builder: (context) {
        return TextField(
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)
                .translate('login_et_user_repeat_password'),
            prefixIcon: Icon(Icons.lock,
                color: _themeStore.darkMode ? Colors.white70 : Colors.black54),
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: _formStore.formErrorStore.confirmPassword,
          ),
          obscureText: true,
          controller: _confirmPasswordController,
          focusNode: _confirmPasswordFocusNode,
          onChanged: (value) {
            _formStore.setConfirmPassword(_confirmPasswordController.text);
          },
        );
      },
    );
  }

  Widget navigate(BuildContext context) {
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool(Preferences.is_logged_in, true);
    // });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
