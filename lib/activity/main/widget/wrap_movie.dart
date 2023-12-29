import 'package:flutter/material.dart';
import 'package:submission_idcamp/model/movie_model.dart';
import 'package:submission_idcamp/activity/detail/view/detail_movie_view.dart';
import 'package:submission_idcamp/components/theme/color.dart';
import 'package:submission_idcamp/components/widget/null_attention.dart';

class WrapMovie extends StatelessWidget {
  const WrapMovie({super.key, required this.movies, required this.filter});

  final List<MovieRecomendation> movies;
  final String filter;

  void _filterWithGen() {
    if(filter == "Rating") {
      movies.sort((a, b) => b.rating.compareTo(a.rating));
    } else{
      movies.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    _filterWithGen();
    return movies.isEmpty
        ? const NullAttention()
        : SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            spacing: 10,
            alignment: WrapAlignment.center,
            children: movies
                .map((e) => Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 360,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.grey.shade200, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                          height: 180,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300),
                            borderRadius:
                            BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(5),
                            child: Image.asset(
                              e.moviePicture,
                              fit: BoxFit.cover,
                            ),
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          decoration: BoxDecoration(
                              color: CustomColor.secondaryColor,
                              borderRadius:
                              BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              e.title,
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium!
                                  .copyWith(
                                  color: CustomColor
                                      .primaryColor),
                            ),
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailMovieView(
                                            movieRecomendation: e),
                                  ));
                            },
                            style: const ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(
                                  CustomColor.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                "Lihat Profile ->",
                                style:
                                textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                  CustomColor.secondaryColor,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 10,
                  child: Container(
                      padding: e.title == "Flora Shafiqa Riyadi"
                          ? const EdgeInsets.symmetric(
                          horizontal: 10)
                          : const EdgeInsets.symmetric(
                          horizontal: 15),
                      decoration: BoxDecoration(
                          color: CustomColor.secondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            "${e.rating}",
                            style: textTheme.bodyMedium!.copyWith(
                                color: CustomColor.primaryColor,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                        ],
                      )),
                )
              ],
            ))
                .toList()),
      ),
    );
  }
}
