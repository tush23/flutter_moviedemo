import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/configer/configer_bloc.dart';
import 'package:flutter_moviedemo/configer/configer_event.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget bottomTabs;

  const CustomScaffold(
      {Key key, @required this.title, @required this.body, this.bottomTabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigerBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: true,
        child: Scaffold(
          backgroundColor:
              ConfigerBloc().darkModeOn ? Colors.black : Colors.white,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.menu2Outline,
                color: ConfigerBloc().darkModeOn ? Colors.white : Colors.black,
              ),
            ),

            //bottom: bottomTabs != null ? bottomTabs : null,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    ConfigerBloc().darkModeOn
                        ? FontAwesomeIcons.lightbulb
                        : FontAwesomeIcons.solidLightbulb,
                    size: 15,
                  ),
                  onPressed: () {
                    ConfigerBloc()
                        .add(DarkModeEvent(!ConfigerBloc().darkModeOn));
                  }),
            ],
            elevation: 1.2,
          ),
          bottomNavigationBar: bottomTabs != null ? bottomTabs : null,
          body: body,
          /*bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),*/
        ),
      ),
    );
  }
}
