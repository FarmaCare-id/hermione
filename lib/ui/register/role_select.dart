import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoleScreen extends StatefulWidget {
  @override
  _RoleScreenState createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  // stores: ----------------------------------------------------------
  late ThemeStore _themeStore;
  final _store = FormStore();

  bool _isUser = false;
  bool _isHealthcare = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('signup_role_select'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Text(
              AppLocalizations.of(context).translate('signup_role_select_desc'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.greyLabel,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 64),
          Center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildUserButton(),
              _buildHealthcareButton(),
            ],
          ),
          SizedBox(height: 32),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildUserButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isUser = !_isUser;
          if (_isUser) {
            _isHealthcare = false;
          }
        });
      },
      child: Card(
        elevation: _isUser ? 10.0 : 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(
            color: AppColors.bluePeriwinkle,
            width: _isUser ? 6.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Image(image: AssetImage('assets/icons/ic_user.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
              child: Text(
                'Regular User',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  Widget _buildHealthcareButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isHealthcare = !_isHealthcare;
          if (_isHealthcare) {
            _isUser = false;
          }
        });
      },
      child: Card(
        elevation: _isHealthcare ? 10.0 : 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(
            color: AppColors.bluePeriwinkle,
            width: _isHealthcare ? 6.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Image(image: AssetImage('assets/icons/ic_healthcare.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Text(
                'Healthcare Worker',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.nameInput);
        },
        child: Text(
          AppLocalizations.of(context).translate('common_next'),
          style: TextStyle(
            color: AppColors.white50,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bluePeriwinkle,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}