import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{
  const MoviesEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent{}
class GetTopRatedMoviesEvent extends MoviesEvent{}
class GetPopularMoviesEvent extends MoviesEvent{}
class GetMoviesDetailsEvent extends MoviesEvent{}