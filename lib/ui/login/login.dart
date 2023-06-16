import 'package:another_flushbar/flushbar_helper.dart';
import 'package:farmacare/constants/assets.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/data/sharedpref/constants/preferences.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/widgets/app_icon_widget.dart';
import 'package:farmacare/widgets/empty_app_bar_widget.dart';
import 'package:farmacare/widgets/progress_indicator_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Center(child: _buildRightSide()),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
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
                  'Welcome Back!',
                  style: TextStyle(
                    // fontFamily: 'Roboto',
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          // SizedBox(
          //   width: 300,
          //   height: 300,
          //   child: AppIconWidget(image: 'assets/icons/ic_appicon.png'),
          // ),
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
            _buildAuthenticationForm(),
            SizedBox(height: 24),
            _buildSignInButton(),
            _buildForgotPasswordButton(),
            _buildSignUpButton()
          ],
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



  Widget _buildAuthenticationForm() {
  return Column(
    children: [
      _buildUserIdField(),
      SizedBox(height: 16), // Add desired vertical spacing here
      _buildPasswordField(),
    ],
  );
}

  Widget _buildUserIdField() {
  return Observer(
    builder: (context) {
      return TextField(
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).translate('login_et_user_email'),
          prefixIcon: Icon(Icons.person, color: _themeStore.darkMode ? Colors.white70 : Colors.black54),
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorText: _store.formErrorStore.userEmail,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        controller: _userEmailController,
        autofocus: false,
        onChanged: (value) {
          _store.setUserId(_userEmailController.text);
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
          hintText: AppLocalizations.of(context).translate('login_et_user_password'),
          prefixIcon: Icon(Icons.lock, color: _themeStore.darkMode ? Colors.white70 : Colors.black54),
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorText: _store.formErrorStore.password,
        ),
        obscureText: true,
        controller: _passwordController,
        focusNode: _passwordFocusNode,
        onChanged: (value) {
          _store.setPassword(_passwordController.text);
        },
      );
    },
  );
}

  Widget _buildForgotPasswordButton() {
  return Align(
    alignment: FractionalOffset.center,
    child: TextButton(
      onPressed: () {
        // TODO: Implement Forgot Password
         Navigator.of(context).pushReplacementNamed(Routes.home);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(32),
        minimumSize: Size(0, 0),
      ),
      child: Text(
        AppLocalizations.of(context).translate('login_btn_forgot_password'),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.greyLabel),
      ),
    ),
  );
}

  Widget _buildSignInButton() {
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
          if (_store.canLogin) {
            DeviceUtils.hideKeyboard(context);
            _store.login();
          } else {
            _showErrorMessage('Please fill in all fields');
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Text(
            AppLocalizations.of(context).translate('login_btn_sign_in'),
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

  Widget _buildSignUpButton() {
  return Padding(
    padding: EdgeInsetsDirectional.only(top: 24),
    child: Center(
      child: Text.rich(
        TextSpan(
          text: "Doesn't have an account? ",
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: 'Sign up',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: Handle sign up route
                },
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

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
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
