import 'package:assignment1_instagram_ui/Constants/post_list.dart';
import 'package:assignment1_instagram_ui/Pages/story_detail_page.dart';
import 'package:flutter/material.dart';
class StoryWidget extends StatelessWidget {
  final kInnerDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  );
  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.pink, Colors.orange]
    ),
    shape: BoxShape.circle,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: postList.length,
        itemBuilder:(context,index){
            if(index==0){
              return _ownProfile();
            }else{
              return _otherProfile(index,context);
            }
         },
       ),
     );
   }

  Widget _ownProfile() => Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      children: [
        Stack(children:[
          Container(
              height: 65,
              width: 70,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image/bondeth_profile.jpeg'),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          Positioned(
            right: 3, bottom: 2,
            child: Container(
              height: 20, width: 20,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              child:Icon(Icons.add, size: 20, color: Colors.white),
            ),
          )
        ],),
        SizedBox(height: 5),
        Container(
          height: 20,
          width: 70,
          child: Row(
            children: [
              Expanded(
                child: Text('_bondeth_', maxLines: 1),
              )
            ],
          ),
        )
      ],
    ),
  );

  Widget _otherProfile(var _index, context) => Padding(
    padding: const EdgeInsets.all(5),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StoryDetailPage(item: postList[_index],)));
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
                child: Container(
                  child: CircleAvatar(backgroundImage: AssetImage('${postList[_index].profileImg}')),
                  decoration: kInnerDecoration,
                ),
              ),
            height: 65,
            width: 70,
            decoration: kGradientBoxDecoration,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 20,
          width: 70,
          alignment: Alignment.center,
          child: Text('${postList[_index].name}', style: TextStyle(fontSize: 12), maxLines: 1),
        )
      ],
    ),
  );
}
