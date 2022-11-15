import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tv_dictionary/core/utils/app_constants.dart';
import 'package:tv_dictionary/movies/domain/entities/movie.dart';
import 'package:tv_dictionary/movies/presentation/screens/movie_details_screen.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({Key? key, required this.title, required this.moviesList})
      : super(key: key);

  final String title;
  final List<Movie> moviesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index) => movieItemBuilder(context,moviesList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: moviesList.length,
        ),
      ),
    );
  }

  Widget movieItemBuilder(BuildContext context,Movie movie) => InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MovieDetailScreen(id: movie.id)));
    },
    child: Container(
      width: 500,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 150,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Image(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.imageUrl(movie.backdropPath)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            movie.releaseDate.split('-')[0],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (movie.voteAverage / 2).toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '(${movie.voteAverage})',
                              style: const TextStyle(
                                fontSize: 1.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
