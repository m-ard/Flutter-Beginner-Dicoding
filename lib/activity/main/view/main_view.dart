import 'package:flutter/material.dart';
import 'package:submission_idcamp/activity/main/widget/search_filter.dart';
import 'package:submission_idcamp/activity/main/widget/coloumn_movie.dart';
import 'package:submission_idcamp/components/utils/responsive.dart';
import 'package:submission_idcamp/activity/main/widget/wrap_movie.dart';
import 'package:submission_idcamp/data/data_movies.dart';
import 'package:submission_idcamp/model/movie_model.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<MovieRecomendation> listSearchResult = List.from(listMovie);
  String filter = "Judul";


  void _onSearch(String text) {
    setState(() {
      listSearchResult = listMovie
          .where((element) =>
          element.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });
  }

  void _showFilterOptions(BuildContext context) {
    final List<String> options = [
      'Judul',
      'Rating'
    ];

    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(150, 150, 0, 0),
      items: options.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(
            option,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () {
            setState(() {
              filter = option;
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Image.asset( "assets/logo_flutter.png"
            ),
          ),
        ),
        title: Text(
          "Movie Recomendation",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white, fontSize: 20),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 20),
            child: SearchFilter(
              onSearch: _onSearch,
              showFilterOptions: () => _showFilterOptions(context),
            )),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Responsive.isMobile(context)
              ? ColoumnMovie(movie: listSearchResult, filter: filter)
              : WrapMovie(
            movies: listSearchResult,
            filter: filter,
          )
      ),
    );
  }
}
