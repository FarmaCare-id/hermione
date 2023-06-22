import 'package:another_flushbar/flushbar_helper.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NameInputRegisterScreen extends StatefulWidget {
  @override
  _NameInputRegisterScreenState createState() =>
      _NameInputRegisterScreenState();
}

class _NameInputRegisterScreenState extends State<NameInputRegisterScreen> {
  // text controllers:-----------------------------------------------------------
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  // stores: ----------------------------------------------------------
  late ThemeStore _themeStore;
  final _store = FormStore();

  // Focus nodes:--------------------------------------------------------------
  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;

  @override
  void initState() {
    super.initState();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
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

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Tell us about yourself',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 64),
                Center(),
                _buildFirstNameField(),
                SizedBox(height: 8),
                _buildLastNameField(),
                SizedBox(height: 360),
                _buildNextButton(),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : _showErrorMessage(_store.errorStore.errorMessage);
            },
          ),
          Observer(builder: (context) {
            return Visibility(
              visible: _store.loading,
              child: CustomProgressIndicatorWidget(),
            );
          })
        ],
      ),
    );
  }

  Widget _buildFirstNameField() {
    return Observer(
      builder: (context) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'First Name',
            hintText: 'First Name',
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: _store.formErrorStore.firstName,
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          controller: _firstNameController,
          autofocus: false,
          onChanged: (value) {
            _store.setFirstName(_firstNameController.text);
          },
          onSubmitted: (value) {
            FocusScope.of(context).nextFocus();
          },
        );
      },
    );
  }

  Widget _buildLastNameField() {
    return Observer(
      builder: (context) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Last Name',
            hintText: 'Last Name',
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorText: _store.formErrorStore.lastName,
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          controller: _lastNameController,
          autofocus: false,
          onChanged: (value) {
            _store.setLastName(_lastNameController.text);
          },
          onSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
        );
      },
    );
  }

  Widget _buildNextButton() {
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.professionInput);
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

  @override
  void dispose() {
    super.dispose();
  }
}