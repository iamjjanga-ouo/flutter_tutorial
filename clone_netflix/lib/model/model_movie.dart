// 영화 모델? -> 이후 영화 모델 데이터를 쉽게 관리하기 위함.
class Movie {
  final String title;
  final String keyword;
  final String poster;
  final String info;
  final bool like;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        info = map['info'],
        like = map['like'];

  @override
  // String toString() => "Movie<$title:$keyword>";
  String toString() => "$info";
}
