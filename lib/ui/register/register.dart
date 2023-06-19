import 'package:another_flushbar/flushbar_helper.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/data/sharedpref/constants/preferences.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/language/language_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/widgets/app_icon_widget.dart';
import 'package:farmacare/widgets/progress_indicator_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  // focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  // stores:---------------------------------------------------------------------
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text("Register"),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      // _buildLanguageButton(),
      // _buildThemeButton(),
    ];
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
          // if (_store.canLogin) {
          //   DeviceUtils.hideKeyboard(context);
          //   _store.login();
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

  // Widget _buildBackground() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: AssetImage("assets/images/register_background.png"),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

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



  // Widget _buildRegisterForm() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 32),
  //     padding: EdgeInsets.symmetric(horizontal: 16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 16,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: Form(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           _buildEmailField(),
  //           _buildPasswordField(),
  //           _buildConfirmPasswordField(),
  //           _buildRegisterButton(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildEmailField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Email",
  //       hintText: "Enter your email",
  //       prefixIcon: Icon(Icons.email),
  //     ),
  //   );
  // }

  // Widget _buildPasswordField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Password",
  //       hintText: "Enter your password",
  //       prefixIcon: Icon(Icons.lock),
  //     ),
  //   );
  // }

  // Widget _buildConfirmPasswordField() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: "Confirm Password",
  //       hintText: "Confirm your password",
  //       prefixIcon: Icon(Icons.lock),
  //     ),
  //   );
  // }

  // Widget _buildRegisterButton() {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(top: 16),
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       child: Text("Register"),
  //     ),
  //   );
  // }

  // actions methods:------------------------------------------------------------
  // Widget _buildLanguageButton() {
  //   return IconButton(
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return LanguageDialog();
  //         },
  //       );
  //     },
  //     icon: Icon(Icons.language),
  //   );
  // }

  // Widget _buildThemeButton() {
  //   return IconButton(
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           return ThemeDialog();
  //         },
  //       );
  //     },
  //     icon: Icon(Icons.color_lens),
  //   );
  // }
}
