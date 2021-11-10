import 'package:assignment1_instagram_ui/Models/post_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PostBoxWidget extends StatefulWidget {
  final Post item;
  PostBoxWidget({required this.item});
  @override
  _PostBoxWidgetState createState() => _PostBoxWidgetState();
}

class _PostBoxWidgetState extends State<PostBoxWidget> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;
  bool _isClick = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 565,
        child: Column(children: [
          _buildHeaderBox,
          _buildImageBox,
          _buildFooterBox,
        ],),
      ),
    );
  }

  //--------------------HeaderBox-------------------
  get _buildHeaderBox => Container(
    height: 60,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Row(children: [
                Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  width: 55,
                  child: CircleAvatar(backgroundImage: AssetImage('${widget.item.profileImg}')),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text('${widget.item.name}'),
            ],),
          IconButton(onPressed:(){}, icon: Icon(Icons.more_horiz))
        ],
      ),
    )
  );
 //--------------------HeaderBox-------------------

 get _buildImageBox => InkWell(
   onDoubleTap: () => setState(() => _isClick = !_isClick),
   child: Container(
     height: 370,
     width: double.infinity,
     child: Image.asset('${widget.item.postImage}', fit: BoxFit.cover),
   ),
 );

 get _buildFooterBox=> Expanded(
   flex: 1,
   child: Container(
     child: Column(
       children: [
         Container(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(children: [
                 IconButton(
                     onPressed: () => setState(() => _isClick = !_isClick),
                     icon: Icon(
                         _isClick ? Icons.favorite : Icons.favorite_border,
                         color: _isClick ? Colors.red : null,
                     )
                 ),
                 IconButton(
                     onPressed: (){},
                     icon: Icon(CupertinoIcons.chat_bubble),
                 ),
                 IconButton(
                     onPressed: (){},
                     icon: Icon(CupertinoIcons.paperplane),
                 ),
               ],),
               IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark)),
             ],
           ),
         ),
         Expanded(
           flex: 1,
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 10),
             width: double.infinity,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text('${ _isClick ? widget.item.like +1 : widget.item.like} Likes',style: TextStyle(fontWeight: FontWeight.bold)),
                 Row(children: [
                   Text('${widget.item.name}', style: TextStyle(fontWeight: FontWeight.bold)),
                   SizedBox(width: 5),
                   Expanded(child: Text('${widget.item.caption}', maxLines: 1)),
                 ],),
                 Text('View all ${widget.item.viewComment} comments', style: TextStyle(color: Colors.grey)),
                 Text('${widget.item.timePost}', style: TextStyle(fontSize: 13, color: Colors.grey)),
               ],
             ),
           ),
         )
       ],
     )
   ),
 );
}
