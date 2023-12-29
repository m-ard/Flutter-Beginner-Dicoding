import 'package:flutter/material.dart';
import 'package:submission_idcamp/model/movie_model.dart';
import 'package:submission_idcamp/activity/detail/view/detail_movie_view.dart';
import 'package:submission_idcamp/components/theme/color.dart';
import 'package:submission_idcamp/components/widget/null_attention.dart';

class ColoumnMovie extends StatelessWidget {
  const ColoumnMovie({super.key, required this.movie, required this.filter});

  final List<MovieRecomendation> movie;
  final String filter;

  void filterWithGen() {
    if(filter == "Rating"){
      movie.sort((a, b) => b.rating.compareTo(a.rating));
    }
    else{
      movie.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    filterWithGen();
    return movie.isEmpty
        ? const NullAttention()
        : Column(
        children: movie
            .map(
              (e) => Container(
              padding: const EdgeInsets.all(10),
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                  Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          e.moviePicture,
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Text(
                                e.title,
                                style: textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Container(
                              height: 30,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              decoration: BoxDecoration(
                                  color: CustomColor.secondaryColor,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "${e.rating}",
                                  style: textTheme.bodyMedium!.copyWith(
                                      color: CustomColor.primaryColor),
                                ),
                              )),
                        ],
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
                              backgroundColor: MaterialStatePropertyAll(
                                  CustomColor.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                "Lihat Detail ->",
                                style: textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CustomColor.secondaryColor,
                                ),
                              ),
                            )),
                      )
                    ],
                  )
                ],
              )),
        )
            .toList());
  }
}
