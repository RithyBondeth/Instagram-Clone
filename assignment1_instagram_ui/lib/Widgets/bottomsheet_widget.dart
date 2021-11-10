import 'package:flutter/material.dart';
bottomSheet({
  required context,
  required List<BottomSheetListTile> ls,
  required bool isHaveTitle
}){
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (BuildContext context){
        return Container(
          height: MediaQuery.of(context).size.height*0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              isHaveTitle ? Container(
                height: 40,
                  alignment: Alignment.center,
                  child: Text('Create', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ) : SizedBox(height: 20),
              for(int index=0;index<ls.length;index++)
                Container(
                  height: 60,
                  child: ListTile(
                    leading: Icon(ls[index].icon, color: Colors.black),
                    title: Text(ls[index].title),
                  ),
                ),
             ],
          ),
        );
      },
  );
}
class BottomSheetListTile{
  IconData icon;
  String title;
  BottomSheetListTile({required this.title, required this.icon});
}