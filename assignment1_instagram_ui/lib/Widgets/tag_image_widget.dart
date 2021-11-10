import 'package:assignment1_instagram_ui/Constants/tag_post_list.dart';
import 'package:flutter/material.dart';
class TagImageWidget extends StatelessWidget {
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
        for(int index = 0; index<tagPostList.length; index++)
          Container(
            child: Image.asset('${tagPostList[index].postImage}', fit: BoxFit.cover),
          )
      ],
    );
  }
}
