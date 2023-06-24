import 'package:another_flushbar/flushbar_helper.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionInputRegisterScreen extends StatefulWidget {
  @override
  _ProfessionInputRegisterScreenState createState() => _ProfessionInputRegisterScreenState();
}

class _ProfessionInputRegisterScreenState extends State<ProfessionInputRegisterScreen> {
  // stores: ----------------------------------------------------------
  late ThemeStore _themeStore;
  late FormStore _formStore;

  bool _isDoctor = false;
  bool _isApothecary = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _formStore = Provider.of<FormStore>(context);
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
            'What is your profession?',
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
              'Before we get started, could you please tell us if you are a doctor or an apothecary?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 128),
          Center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDoctorButton(),
              _buildApothecaryButton(),
            ],
          ),
          SizedBox(height: 64),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildDoctorButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDoctor = !_isDoctor;
          if (_isDoctor) {
            _isApothecary = false;
          }
        });
      },
      child: Card(
        elevation: _isDoctor ? 10.0 : 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(
            color: AppColors.bluePeriwinkle,
            width: _isDoctor ? 6.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 32),
            Image(image: AssetImage('assets/icons/user-doctor.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
              child: Text(
                'Doctor',
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

  Widget _buildApothecaryButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isApothecary = !_isApothecary;
          if (_isApothecary) {
            _isDoctor = false;
          }
        });
      },
      child: Card(
        elevation: _isApothecary ? 10.0 : 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(
            color: AppColors.bluePeriwinkle,
            width: _isApothecary ? 6.0 : 1.0,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 32),
            Image(image: AssetImage('assets/icons/user_apothecary.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44.0, vertical: 8.0),
              child: Text(
                'Apothecary',
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
          if (_isDoctor) {
            _formStore.setProfession('doctor');
          } else if (_isApothecary) {
            _formStore.setProfession('apothecary');
          } else {
            _formStore.setProfession('');
          }

          if (_formStore.canSubmitProfession) {
            Navigator.pushNamed(context, Routes.professionVerif);
          } else {
            _showErrorMessage("Please select a profession");
          }
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
