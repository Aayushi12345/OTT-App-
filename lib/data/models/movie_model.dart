import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'movie_model.g.dart';

@JsonSerializable(createToJson: false)
class MovieModel extends Equatable{
  List<Results>? results;
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) =>
      _$MovieModelFromJson(map);

  @override
  List<Object?> get props =>[results];
}

@JsonSerializable(createToJson: false)
class Results extends Equatable{
  String? title;
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  int? id;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  @JsonKey(name: "media_type")
  String? mediaType;

  double? popularity;
  @JsonKey(name: "release_date")
  String? releaseDate;
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  bool? isFavourite;

  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.isFavourite});

  factory Results.fromJson(Map<String, dynamic> map) => _$ResultsFromJson(map);
  // Map<String, dynamic> toJson() => _$ResultsToJson(this);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);

  @override
  String toString() {
    return 'Results{'
        'id: $id, '
        'title: $title, '
        'overview: $overview, '
        'backdrop_path: $posterPath, '
        'adult: $adult, '
        'originalLanguage: $originalLanguage, '
        'backdropPath: $backdropPath, '
        'releaseDate: $releaseDate, '
        'voteCount: $voteCount, '
        'isFavourite: $isFavourite '
        '}';
  }
  String getContentRating() {
    return adult! ? "A" : "U/A";
  }

  @override
  List<Object?> get props => [adult,backdropPath,id,title,originalLanguage,originalTitle,overview,
    posterPath,mediaType,popularity,releaseDate,video,voteAverage,voteCount];
}
