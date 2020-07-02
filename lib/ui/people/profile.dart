import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/bloc/movie_person_details_bloc.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/constants/constants.dart';
import 'package:flutter_moviedemo/model/person/person_details.dart';
import 'package:flutter_moviedemo/ui/required/title_description.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  final int personId;

  const ProfilePage({Key key, this.personId}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState(personId);
}

class _ProfilePageState extends State<ProfilePage> {
  final int personId;

  _ProfilePageState(this.personId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personDetailsBloc..getPersonDetails(personId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<PersonDetails>(
      stream: personDetailsBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print("Snpashot==$snapshot");

          return _buildPersonDetailsWidget(snapshot.data);
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

  Widget _buildPersonDetailsWidget(PersonDetails person) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                ConfigerBloc().darkModeOn
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 15,
              ),
              onPressed: () {
                ConfigerBloc().add(DarkModeEvent(!ConfigerBloc().darkModeOn));
              }),
        ],
      ),

      //title: personResults.name,
      body: Container(
        color: ConfigerBloc().darkModeOn ? Colors.black : Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              Constants.imgUrl + person.profilePath),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(1.0)
                                : Colors.white.withOpacity(1.0),
                            ConfigerBloc().darkModeOn
                                ? Colors.black.withOpacity(0.0)
                                : Colors.white.withOpacity(0.0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          stops: [0.0, 0.9]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TitleDescWidget(
                  title: "About",
                  description: person.biography.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TitleDescWidget(
                  title: "Birthday",
                  description: person.birthday.toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TitleDescWidget(
                  title: "Birth Place",
                  description: person.placeOfBirth.toString(),
                ),
              )

              // Image(
              //   image: CachedNetworkImageProvider(
              //       Constants.imgUrl + personResults.profilePath),
              //   height: size.height / 2.5,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
