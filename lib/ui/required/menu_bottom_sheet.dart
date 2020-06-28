import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/configer/index.dart';

class MenuBottomSheet{
    void onMenuPressed(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: ConfigerBloc().darkModeOn ? Colors.black : Color(0xFF737373),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 5,
                        color: ConfigerBloc().darkModeOn ? Colors.white : Colors
                            .black,
                        offset: Offset(1, 3))
                  ], // make rounded corner of border,
                  color: Theme
                      .of(context)
                      .canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                /*decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white,style: BorderStyle.solid))),
               */
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.category),
                      title: Text("Source"),
                      onTap: () {
                        Navigator.pop(context);
                        
                      },
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Popularity"),
                      onTap: () {
                        Navigator.pop(context);
                        print("Popularity");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Relevence"),
                      onTap: () {
                        Navigator.pop(context);
                        print("Relevancy");
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.sort),
                      title: Text("Published At"),
                      onTap: () {
                        print("PublishedAT");
                        Navigator.pop(context);
                      },
                    ),
                    //Divider(),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}