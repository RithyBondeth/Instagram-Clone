import 'package:assignment1_instagram_ui/Models/post_class.dart';
import 'package:flutter/material.dart';
class OwnImageWidget extends StatelessWidget {
  final List<Post> item;
  OwnImageWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      children: [
        for(int index = 0; index<item.length; index++)
          Container(
            child: Image.asset('${item[index].postImage}', fit: BoxFit.cover),
          )
      ],
    );
  }
}
