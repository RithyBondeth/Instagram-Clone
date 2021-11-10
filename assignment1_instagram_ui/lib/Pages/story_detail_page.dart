import 'package:assignment1_instagram_ui/Models/post_class.dart';
import 'package:flutter/material.dart';

class StoryDetailPage extends StatelessWidget {
  final Post item;
  StoryDetailPage({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(context),
        bottomNavigationBar: BottomAppBar(
          child:Container(
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
           child: TextField(
             decoration: InputDecoration(
               border: InputBorder.none,
               prefixIcon: Icon(Icons.home,size: 0),
               hintText: 'Send Message',
             ),
           ),
        )
        ),
    );
  }

  Widget _buildBody(context) => SafeArea(
    child: Stack(
      children: [
         Container(
           height: MediaQuery.of(context).size.height,
           width: double.infinity,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             image: DecorationImage(
               image: AssetImage('${item.storyImg}'),
               fit: BoxFit.cover,
             )
           ),
         ),
        _buildHeader(context),
      ],
    ),
  );

  Widget _buildHeader(context) => Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
              ),
            ),
            ListTile(
              leading: Container(
                height: 40, width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('${item.profileImg}'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              title: Text('${item.name}', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
              trailing: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, color: Colors.white,)),
            )
          ],
        ),
      ),
    );
}
