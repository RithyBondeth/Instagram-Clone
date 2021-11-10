import 'package:assignment1_instagram_ui/Constants/search_image_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar =>  AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(onPressed: (){}, icon: Icon(Icons.close, color: Colors.black)),
    title: Text('New Post', style: GoogleFonts.ubuntu(color: Colors.black)),
    actions: [
      TextButton(onPressed: (){}, child: Text('Next', style: TextStyle(fontSize: 16),))
    ],
  );

  get _buildBody => Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height*0.4,
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height*0.35,
            width: double.infinity,
            child: Image.asset('assets/post_image/messi.jpeg', fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recents'),
                  Row(children: [
                    InkWell(
                      onTap: (){},
                      child: Icon(Icons.queue_outlined),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: (){},
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ],)
                ],
              ),
            ),
          )
        ],)
      ),
      Expanded(
        flex: 1,
        child: Container(
          child: GridView(
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
          ),
        ),
      )
    ],
  );
}
