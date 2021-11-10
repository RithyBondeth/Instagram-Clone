import 'package:flutter/material.dart';

import 'bottom_item_widget.dart';

class BottomAppBarWidget extends StatelessWidget {
  final List<IconText> iconTextList;
  final Color unselectedColor;
  final Color selectedColor;
  final Color unselectedBackgroundColor;
  final Color selectedBackgroundColor;
  final void Function(int) onTap;
   final int currentIndex;

   BottomAppBarWidget({
     required this.iconTextList,
     required this.onTap,
     required this.currentIndex,
     this.selectedColor = Colors.black,
     this.unselectedColor = Colors.black,
     this.selectedBackgroundColor = Colors.white,
     this.unselectedBackgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for(int index=0; index<iconTextList.length; index++)
                Expanded(
                  child: InkWell(
                    onTap: () => onTap(index),
                    child: BottomItemWideget(
                      text: iconTextList[index].text,
                      icon: iconTextList[index].icon,
                      color: currentIndex == index ? selectedColor : unselectedColor,
                      backgroundColor:  currentIndex == index ? selectedBackgroundColor : unselectedBackgroundColor,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class IconText{
  String text;
  IconData icon;

  IconText({required this.text, required this.icon});
}