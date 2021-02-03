import 'package:cloud_firestore/cloud_firestore.dart';

// 영화 모델? -> 이후 영화 모델 데이터를 쉽게 관리하기 위함.
class Movie {
  final String title;
  final String keyword;
  final String poster;
  final String info;
  final bool like;
  final DocumentReference
      reference; // Firebase firestore에 있는 data column을 참조할 수 잇는 Link

  Movie.fromMap(Map<String, dynamic> map,
      {this.reference}) // reference를 이용해 해당 데이터에 대한 CRUD 기능을 아주 간단하게 처리
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        info = map['info'],
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Movie<$title:$keyword>";
  // String toString() => "$info";
}
