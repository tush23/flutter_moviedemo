import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/configer/index.dart';

class TitleDescWidget extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescWidget({
    Key key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          description,
          style: TextStyle(
              color: ConfigerBloc().darkModeOn ? Colors.grey : Colors.black87),
        )
      ],
    );
  }
}
