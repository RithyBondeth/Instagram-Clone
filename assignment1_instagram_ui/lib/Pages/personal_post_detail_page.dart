import 'package:assignment1_instagram_ui/Models/post_class.dart';
import 'package:assignment1_instagram_ui/Widgets/post_box_widget.dart';
import 'package:flutter/material.dart';
class PersonalPostDetailPage extends StatefulWidget {
  final List<Post> item;
  final bool isTags;
  PersonalPostDetailPage({required this.item, required this.isTags});
  @override
  _PersonalPostDetailPageState createState() => _PersonalPostDetailPageState();
}

class _PersonalPostDetailPageState extends State<PersonalPostDetailPage> {
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
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
    ),
    title: Column(
      children: [
        Text('_BONDETH_',style: TextStyle(fontSize: 11,color: Colors.grey,fontWeight: FontWeight.bold)),
        Text( widget.isTags ? 'Tagged' :'Posts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
      ],
    )
  );

  get _buildBody => ListView.builder(
      itemCount: widget.item.length,
      itemBuilder: (context,index){
        return PostBoxWidget(item: widget.item[index]);
      },
  );
}
