import 'package:assignment1_instagram_ui/Constants/search_image_list.dart';
import 'package:assignment1_instagram_ui/Widgets/search_box_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: SearchBoxWidget(),
  );

  get _buildBody => GridView(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
    ),
    children: [
      for(int index=0; index<searchImageList.length; index++)
        Container(
          child: Image.asset('${searchImageList[index]}', fit: BoxFit.cover),
        ),
    ],
  );
}
