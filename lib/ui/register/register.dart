import 'package:farmacare/stores/language/language_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  @override
  void initState() {
    super.initState();
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
      _buildBackButton(),
    ];
  }

  Widget _buildBackButton() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  // body methods:---------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _buildContent(),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/register_background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildRegisterForm(),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildEmailField(),
            _buildPasswordField(),
            _buildConfirmPasswordField(),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Confirm your password",
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Register"),
      ),
    );
  }

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
