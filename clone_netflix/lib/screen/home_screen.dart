import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/widget/box_slider.dart';
import 'package:clone_netflix/widget/carousel_slider.dart';
import 'package:clone_netflix/widget/circle_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  // streamData로 data를 추출하여 Widget으로 만듦
  Widget _fetchData(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return LinearProgressIndicator(); // 실제 data를 가져오지 못하면 로딩화면
        return _buildBody(context, snapshot.data.docs); // data를 가져오면 Widget 생성
      }, // 기존 snapshot.data.documents -> snapshot.data.docs로 변경 (ref : QuerySnapshot)
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromsnapshot(d)).toList();
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            // Stack에서서 가장 위에가 맨 밑에 깔리게 된다.
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(
          movies: movies,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

// 상단바는 home 화면에서만 사용하기 때문에 따로 widget으로 빼지않고
// 여기서 만듦
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/nflix_log.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 컨텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
