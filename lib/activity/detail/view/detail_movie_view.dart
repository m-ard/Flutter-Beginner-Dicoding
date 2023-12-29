import 'package:flutter/material.dart';
import 'package:submission_idcamp/model/movie_model.dart';
import 'package:submission_idcamp/components/theme/color.dart';
import 'package:submission_idcamp/components/utils/responsive.dart';

class DetailMovieView extends StatelessWidget {
  const DetailMovieView({Key? key, required this.movieRecomendation})
      : super(key: key);

  final MovieRecomendation movieRecomendation;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Map<String, dynamic> data = {
      "Judul": movieRecomendation.title,
      "Tahun": movieRecomendation.year,
      "Rating": movieRecomendation.rating,
      "Popularitas": movieRecomendation.popularity,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Movie", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(movieRecomendation.moviePicture)),
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: List.generate(data.length, (index) {
                final key = data.keys.elementAt(index);
                final value = data.values.elementAt(index);
                return Padding(
                  padding: Responsive.isMobile(context)
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(key,
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontSize: 16)),
                              key == "Rating"
                                  ? SizedBox(
                                width: 130,
                                child: Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: CustomColor.primaryColor),
                                  child: Center(
                                    child: Text(
                                      "$value",
                                      style: textTheme.bodyMedium!
                                          .copyWith(
                                          color: CustomColor
                                              .secondaryColor),
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(
                                width: 130,
                                child: Text(
                                  "$value",
                                  textAlign: TextAlign.start,
                                  style: textTheme.bodySmall!
                                      .copyWith(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey.shade300,
                      )
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sinopsis',
                    style: textTheme.bodyMedium!.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${movieRecomendation.synopsis}',
                    textAlign: TextAlign.justify,
                    style: textTheme.bodySmall!.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
