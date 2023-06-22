import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/widgets/app_icon_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // stores:---------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  // body methods:---------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: [
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Material(
        child: Stack(
      children: <Widget>[
        // Background:--------------------------------------------------------------
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/icons/ic_appicon.png"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),

        // Gradient:----------------------------------------------------------------
        // Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Colors.transparent,
        //         // AppColors.blue100,
        //         // AppColors.bluePeriwinkle,
        //         // Colors.black.withOpacity(0.8),
        //       ],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  height: 350,
                  child: AppIconWidget(
                    image: 'assets/icons/ic_appicon.png',
                  ),
                ),
                Text(
                  "Welcome to FarmaCare",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 32),
                  child: Text(
                    "The ultimate companion in managing \nyour health and rmedication routines",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.greyLabel,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 64),
                _buildSignUpButton(),
                _buildSignInButton()
              ],
            ),
          ),
        ),
      ],
    ));
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
          // TODO: Redirect to login page
          Navigator.pushNamed(context, Routes.register);
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

  Widget _buildSignInButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 24),
      child: Center(
        child: Text.rich(TextSpan(
            text: "Already have an account? ",
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                  text: 'Log In',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.bluePeriwinkle,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, Routes.login);
                    })
            ])),
      ),
    );
  }
}
