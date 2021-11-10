import 'package:assignment1_instagram_ui/Constants/favorite_list.dart';
import 'package:assignment1_instagram_ui/Constants/post_list.dart';
import 'package:assignment1_instagram_ui/Models/post_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }
  //------------------------------------------------AppBar---------------------------------------------------
  get _buildAppBar => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text('Activity', style: GoogleFonts.ubuntu(color: Colors.black, fontWeight: FontWeight.bold)),
  );
  //------------------------------------------------AppBar----------------------------------------------------

  //--------------------------------------------------Body----------------------------------------------------
  get _buildBody => SingleChildScrollView(
    child: Column(
      children: [
          _buildHeader(title: 'Today'),
        for(int index=0; index<favoriteTodayList.length; index++)
          _buildListTile(isFollow: true, item: favoriteTodayList, index: index),
        Divider(color: Colors.grey),
          _buildHeader(title: 'This Week'),
        for(int index=0; index<favoriteThisWeekList.length; index++)
          index%2 == 0 ?  _buildListTile(isFollow: true, item: favoriteThisWeekList, index: index) : _buildListTile(isFollow: false, item: favoriteThisWeekList, index: index),
        Divider(color: Colors.grey),
        _buildHeader(title: 'Suggested for You'),
        for(int index=1; index<postList.length; index++)
          _buildListTile(isFollow: true, item: postList, index: index)
      ],
    ),
  );
  //---------------------------------------------------Body-----------------------------------------------------

  //--------------------------------------------------ListTile--------------------------------------------------
  Widget _buildListTile({bool isFollow = true, required List<Post> item,var index}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: ListTile(
      leading: Container(
        height: 50, width: 50,
        child: CircleAvatar(
          backgroundImage: AssetImage('${item[index].profileImg}'),
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
      title: RichText(
        text: TextSpan(
          children:[
            TextSpan(
              text: '${item[index].name},', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextSpan(
                text: isFollow ? 'who you might know, is on instagram.' : 'start following you',
                style: TextStyle(color: Colors.grey[800]),
            ),
          ]
        )
      ),
      trailing: Container(
        height: 30, width: 75,
        alignment: Alignment.center,
        child: isFollow ? Text('Follow', style: TextStyle(color: Colors.white)) : Text('Following'),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isFollow ? Colors.blue : Colors.white,
            border: Border.all(color: isFollow ? Colors.blue : Colors.grey),
        ),
      ),
    ),
  );
  //--------------------------------------------------ListTile------------------------------------------------


  //--------------------------------------------------Header--------------------------------------------------
  Widget _buildHeader({required String title}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 30,
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      ),
    );
  }
  //--------------------------------------------------Header--------------------------------------------------
}
