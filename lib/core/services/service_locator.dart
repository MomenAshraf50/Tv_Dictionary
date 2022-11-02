import 'package:get_it/get_it.dart';
import 'package:tv_dictionary/movies/data/data_source/movie_remote_data_source.dart';
import 'package:tv_dictionary/movies/data/repository/movie_repository.dart';
import 'package:tv_dictionary/movies/domain/repository/base_movie_repository.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:tv_dictionary/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:tv_dictionary/movies/presentation/controller/movie_details_bloc.dart';
import 'package:tv_dictionary/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{
  void init(){

    ///Bloc
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory<MoviesDetailsBloc>(() =>MoviesDetailsBloc(sl(),sl()));

    ///UseCases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationUseCase>(() => GetRecommendationUseCase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///DataSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}