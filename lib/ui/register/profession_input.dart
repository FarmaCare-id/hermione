import 'package:farmacare/stores/form/form_store.dart';
import 'package:farmacare/stores/theme/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessionInputRegisterScreen extends StatefulWidget {
  @override
  _ProfessionInputRegisterScreenState createState() => _ProfessionInputRegisterScreenState();
}

class _ProfessionInputRegisterScreenState extends State<ProfessionInputRegisterScreen> {
  // stores: ----------------------------------------------------------
  late ThemeStore _themeStore;
  final _store = FormStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDepencencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("404 error"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
