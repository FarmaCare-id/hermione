import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/stores/user/user_store.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:farmacare/stores/language/language_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:farmacare/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;
  late UserStore _userStore;

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
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // body: _buildBody(),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // title: Text("Home"),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildProfileButton(),
      _buildLanguageButton(),
      _buildThemeButton(),
      _buildLogoutButton(),
    ];
  }

  Widget _buildProfileButton() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.profile);
      },
      icon: Icon(
        Icons.person,
      ),
    );
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        _userStore.logout(_userStore.authToken);
        Navigator.of(context).pushReplacementNamed(Routes.login);
      
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }

  Widget _buildLanguageButton() {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog();
      },
      icon: Icon(
        Icons.language,
      ),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return SingleChildScrollView(
        child: SafeArea(child: _buildMainContent(context)),
    );
  }

  Widget _buildMainContent(context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: DeviceUtils.getScaledWidth(context, 0.1)),
              child: Row(
                children: [
                  Text(
                    'Hello,\n${_userStore.user?.fullName}!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://shutterstock.com/image-photo/portrait-smiling-red-haired-millennial-260nw-1194497251.jpg',
                    ),
                  ),
                ],
              ),
            ),
            // create a separator line
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Divider(
                thickness: 1,
                color: AppColors.greyLabel
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 4,
                ),
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bluePeriwinkle,
                        ),
                        child: Image.asset(
                          'assets/icons/ic_drugs.png',
                          // fit: BoxFit.contain,
                        ),
                      ),
                      Text('Drugs')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bluePeriwinkle,
                        ),
                        child: Image.asset(
                          'assets/icons/ic_drugs.png',
                          // fit: BoxFit.contain,
                        ),
                      ),
                      Text('Drugs')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.bluePeriwinkle,
                        ),
                        child: Image.asset(
                          'assets/icons/ic_drugs.png',
                          // fit: BoxFit.contain,
                        ),
                      ),
                      Text('Drugs')
                    ],
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Item 4'),
                      subtitle: Text('Subtitle 4'),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AnimatedList(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              initialItemCount: 2,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    child: ListTile(
                      title: Text('Item $index'),
                      subtitle: Text('Subtitle $index'),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ),
                );
              },
            ),
            ExpandIcon(
              onPressed: (value) {
                print(value);
              },
              isExpanded: true,
            ),
            Text(
              'Welcome to FarmaCare!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.post);
              },
              child: Text('Post Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(Routes.replyHome);
              },
              child: Text('Mail App'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLanguageDialog() {
    _showDialog<String>(
      context: context,
      child: MaterialDialog(
        borderRadius: 5.0,
        enableFullWidth: true,
        title: Text(
          AppLocalizations.of(context).translate('home_tv_choose_language'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        headerColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        closeButtonColor: Colors.white,
        enableCloseButton: true,
        enableBackButton: false,
        onCloseButtonClicked: () {
          Navigator.of(context).pop();
        },
        children: _languageStore.supportedLanguages
            .map(
              (object) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0.0),
                title: Text(
                  object.language!,
                  style: TextStyle(
                    color: _languageStore.locale == object.locale
                        ? Theme.of(context).primaryColor
                        : _themeStore.darkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // change user language based on selected locale
                  _languageStore.changeLanguage(object.locale!);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }
}
