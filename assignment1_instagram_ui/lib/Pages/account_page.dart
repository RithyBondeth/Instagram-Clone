import 'package:assignment1_instagram_ui/Constants/bottomsheet_list.dart';
import 'package:assignment1_instagram_ui/Constants/personal_post_list.dart';
import 'package:assignment1_instagram_ui/Constants/story_cover_list.dart';
import 'package:assignment1_instagram_ui/Constants/tag_post_list.dart';
import 'package:assignment1_instagram_ui/Pages/editprofile_page.dart';
import 'package:assignment1_instagram_ui/Pages/personal_post_detail_page.dart';
import 'package:assignment1_instagram_ui/Pages/story_detail_page.dart';
import 'package:assignment1_instagram_ui/Widgets/bottomsheet_widget.dart';
import 'package:assignment1_instagram_ui/Widgets/own_image_widget.dart';
import 'package:assignment1_instagram_ui/Widgets/tag_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {
  var _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text('_bondeth_', style: GoogleFonts.ubuntu(color: Colors.black, fontWeight: FontWeight.bold)),
    actions: [
      IconButton(
          onPressed: () => bottomSheet(context: context,ls: bottomSheetList1, isHaveTitle: true),
          icon: Icon(Icons.add_box_outlined,color: Colors.black),
      ),
      IconButton(
          onPressed: () => bottomSheet(context: context,ls: bottomSheetList2, isHaveTitle: false),
          icon: Icon(Icons.menu, color: Colors.black,),
      ),
    ],
  );

  Widget _buildBody() => SingleChildScrollView(
    child: Column(children: [
      _buildProfileBox,
      _buildBioBox,
      _buildProfileStory,
      _buildTabBar,
      _buildImageGrid,
    ],),
  );
  
  //-----------------------------------Profile Box-----------------------------------
  get _buildProfileBox => Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70, width: 70,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image/bondeth_profile.jpeg'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Row(children: [
              _buildText('${personalPost.length}', 'Posts'),
              SizedBox(width: 20),
              _buildText('1,2M', 'Followers'),
              SizedBox(width: 20),
              _buildText('100', 'Following'),
            ],),
          ),
        ],
      ),
    ),
  );
 
  Widget _buildText(String number, String title) => Column(
    children: [
      Text('$number', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Text('$title'),
    ],
  );
 //-----------------------------------Profile Box-----------------------------------

  //-------------------------------------Bio Box------------------------------------
  get _buildBioBox => Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hem RithyBondeth'),
          Text('Cambodian🇰🇭'),
          Text('19 years old'),
          Text('Mobile App Developer📱'),
          Text('Taurus♉️'),
          SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
                ),
                child: InkWell(
                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage())),
                    child: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 30,
              width: 40,
              child: Icon(Icons.expand_more),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey)
              ),
            ),
          ],)
        ],
      ),
    ),
  );
  //-------------------------------------Bio Box------------------------------------

  //----------------------------------Profile Story---------------------------------
  get _buildProfileStory => Container(
    height: 85,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: personalStoryList.length,
      itemBuilder: (context,index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryDetailPage(item: personalStoryList[index]))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                width: 55,
                child: CircleAvatar(
                  backgroundImage: AssetImage('${personalStoryList[index].profileImg}'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                ),
              ),
              Text('${personalStoryList[index].name}', style: TextStyle(fontSize: 12),),
            ],
          ),
        )
      ),
    ),
  );
  get _buildTabBar => Container(
    height: 40,
    child: Row(children: [
      Expanded(
        child: InkWell(
          onTap: () => setState((){
            _currentIndex = 0;
            _pageController.jumpToPage(0);
          }),
          child: Container(
            height: 40,
           child: Icon(Icons.grid_view),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: _currentIndex == 0 ? Colors.black : Colors.white,
                    width: 2,
                ),
              )
            ),
          ),
        ),
      ),
      Expanded(
        child: InkWell(
          onTap: () => setState((){
            _currentIndex = 1;
            _pageController.jumpToPage(1);
          }),
          child: Container(
            child: Icon(Icons.assignment_ind_outlined),
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _currentIndex == 1 ? Colors.black : Colors.white,
                    width: 2,
                  ),
                )
             ),
          ),
        ),
      ),
    ],)
  );
  //----------------------------------Profile Story---------------------------------

  //-------------------------------------Image Grid---------------------------------
  get _buildImageGrid => Container(
    height: 580,
    child: PageView(
      controller: _pageController,
      onPageChanged: (index) => setState(() => _currentIndex = index),
      children: [
        InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPostDetailPage(item: personalPost, isTags: false))),
            child: OwnImageWidget(item: personalPost),
        ),
        InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalPostDetailPage(item: tagPostList, isTags: true,))),
            child: TagImageWidget(),
        ),
      ],
    ),
  );
//-------------------------------------Image Grid------------------------------------
}
