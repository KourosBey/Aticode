import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _mainScreenView(),
    );
  }

  Widget _mainScreenView() {
    return Column(
      children: [
        _teacherBar(),
        Expanded(
          child: _flowingMainScreen(),
        ),
      ],
    );
  }

  Widget _flowingMainScreen() {
    return GridView.count(
      crossAxisCount: 1,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _teacherBar() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15, top: 30),
                  child: Column(
                    children: [_callTeacherCircle(buildList())],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _callTeacherCircle(List<String> imageList) {
    return Container(
        width: 700,
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              final item = imageList[index];
              return _teacherCircle(imageList[index]);
            }));
  }

  Widget _teacherCircle(String list) {
    return GestureDetector(
      onTap: () {
        Text("sa");
      },
      child: Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(5),
        height: 80,
        width: 80,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(list))),
      ),
    );
  }

  List<String> buildList() {
    List<String> imageList = [];
    imageList.add(
        "https://listelist.com/wp-content/uploads/2019/02/her-tiklamada.jpg");
    imageList.add(
        "https://www.falbakma.com/wp-content/uploads/2014/01/kahve-falinda-insan-yuzu-gormek.jpg");
    imageList.add(
        "https://media.istockphoto.com/vectors/cartoon-face-vector-id1162536069");

    return imageList;
  }
}

/*    users.add(TeacherDataModel("Hüseyin",
        "https://listelist.com/wp-content/uploads/2019/02/her-tiklamada.jpg"));
    users.add(TeacherDataModel("K1",
        "https://www.falbakma.com/wp-content/uploads/2014/01/kahve-falinda-insan-yuzu-gormek.jpg"));

    users.add(TeacherDataModel("k2",
        "https://media.istockphoto.com/vectors/cartoon-face-vector-id1162536069"));*/