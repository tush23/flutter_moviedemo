import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_person_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/person/person_response.dart';
import 'package:flutter_moviedemo/model/person/person_results.dart';

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  void initState() {
    super.initState();
    personBloc..getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Person>(
      stream: personBloc.subject.stream,
      builder: (context, snapshot) {
        print("Snpashot==$snapshot");
        //print(snapshot.hasData);
        //print(snapshot.error);

        if (snapshot.hasData) {
          //print("Snpashot==$snapshot");

          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildPersonWidget(snapshot.data);
        } //else if (snapshot.error) {
        //return _buildErrorWidget(snapshot.error);}
        else
          return _buildLoadingWidget();
      },
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text(Constants.someErrorText)],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 40,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
                ConfigerBloc().darkModeOn ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonWidget(Person data) {
    List<PersonResults> person = data.results;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 16),
          alignment: Alignment.topLeft,
          child: Text(
            Constants.peopleOfTheWeekText,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    person[index].profilePath == null
                        ? Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Icon(EvaIcons.person),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        Constants.imgUrlWidth200 +
                                            person[index].profilePath),
                                    fit: BoxFit.cover)),
                          ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: Text(
                        person[index].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: person.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
