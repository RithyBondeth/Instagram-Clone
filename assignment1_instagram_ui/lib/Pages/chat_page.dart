import 'package:assignment1_instagram_ui/Constants/post_list.dart';
import 'package:assignment1_instagram_ui/Widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
    leading: IconButton(onPressed: (){
      Navigator.pop(context);
    },icon: Icon(Icons.arrow_back_ios, color: Colors.black),),
    title: Text('_bondeth_',style: GoogleFonts.ubuntu(color: Colors.black,fontWeight: FontWeight.bold)),
    centerTitle: false,
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined, color: Colors.black, size: 30)),
      IconButton(onPressed: (){}, icon: Icon(Icons.create_outlined, color: Colors.black, size: 30)),
    ],
  );

  get _buildBody => SingleChildScrollView(
    child: Column(
      children: [
        SearchBoxWidget(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: postList.length-1, //Don't Show Own Profile
          itemBuilder: (context,index){
            return ListTile(
              leading: Container(
                height: 60, width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('${postList[index+1].postImage}'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              title: Text('${postList[index+1].name}'),
              subtitle: Text('Active ${postList[index+1].timePost}'),
              trailing: IconButton(onPressed: (){},icon: Icon(Icons.camera_alt_outlined, color: Colors.black)),
            );
          },
        )
      ],
    ),
  );
}
