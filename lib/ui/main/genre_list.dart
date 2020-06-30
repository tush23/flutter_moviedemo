import 'package:flutter/material.dart';
import 'package:flutter_moviedemo/configer/index.dart';
import 'package:flutter_moviedemo/model/genre/genre_result.dart';
import 'package:flutter_moviedemo/ui/main/genre_movies.dart';

class GenresList extends StatefulWidget {
  final List<GenresResults> genre;

  const GenresList({Key key, this.genre}) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState(genre);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<GenresResults> genres;

  _GenresListState(this.genres);

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: genres.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
              body: TabBarView(
                children:
                    genres.map((e) => GenreMovies(genreId: e.id)).toList(),
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBar(
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.deepOrangeAccent,
                    indicatorWeight: 3,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.red,
                    unselectedLabelColor: ConfigerBloc().darkModeOn
                        ? Colors.white38
                        : Colors.black54,
                    isScrollable: true,
                    tabs: genres
                        .map(
                          (e) => Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                e.name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        )
                        .toList(),
                  ),
                ),
              )),
        ));
  }
}
