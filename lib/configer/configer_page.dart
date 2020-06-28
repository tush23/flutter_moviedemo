import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/ui/home.dart';

import 'index.dart';

class ConfigerPage extends StatefulWidget {
  @override
  _ConfigerPageState createState() => _ConfigerPageState();
}

class _ConfigerPageState extends State<ConfigerPage> {
  ConfigerBloc _configerBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _configerBloc,
      child: BlocBuilder(
          bloc: _configerBloc,
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: Constants.app_name,
                theme: ThemeData(
                  fontFamily: Constants.google_sans_family,
                  primarySwatch: Colors.red,
                  primaryColor:
                  _configerBloc.darkModeOn ? Colors.black : Colors.white,
                  disabledColor: Colors.grey,
                  cardColor:
                  _configerBloc.darkModeOn ? Colors.black : Colors.white,
                  canvasColor: _configerBloc.darkModeOn
                      ? Colors.black
                      : Colors.green[50],
                  brightness: _configerBloc.darkModeOn
                      ? Brightness.dark
                      : Brightness.light,
                  buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: _configerBloc.darkModeOn
                        ? ColorScheme.dark()
                        : ColorScheme.light(),
                  ),
                  appBarTheme: AppBarTheme(elevation: 0.0),
                ),
              home: Home(),
              routes: {
                Home.routeName: (context) => Home()
              },
            );
          }),
    );
  }

  void setupApp() {
    _configerBloc = ConfigerBloc();
    _configerBloc.darkModeOn =
        Constants.perfs.getBool(Constants.darkModeperf) ?? true;
  }
}
