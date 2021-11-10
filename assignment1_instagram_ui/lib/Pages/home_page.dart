import 'package:assignment1_instagram_ui/Constants/post_list.dart';
import 'package:assignment1_instagram_ui/Pages/chat_page.dart';
import 'package:assignment1_instagram_ui/Widgets/bottomsheet_widget.dart';
import 'package:assignment1_instagram_ui/Widgets/post_box_widget.dart';
import 'package:assignment1_instagram_ui/Widgets/story_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }


  //-----------------AppBar-------------------
  get _buildAppBar => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined, color: Colors.black,)),
    centerTitle: true,
    title: Text(
      'Instagram',
      style: GoogleFonts.pattaya(color: Colors.black, fontSize: 28),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.live_tv, color: Colors.black)),
      IconButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatPage()));
      }, icon: Icon(CupertinoIcons.paperplane, color: Colors.black))
    ],
  );
  //-----------------AppBar-------------------

  //-------------------Body-------------------
  get _buildBody => SingleChildScrollView(
      child: Column(
        children: [
          StoryWidget(),
          for(int index = 0; index<postList.length; index++)
          PostBoxWidget(item: postList[index]),
        ],
      ),
  );
  //-------------------Body--------------------
}
