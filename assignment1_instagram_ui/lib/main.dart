import 'package:assignment1_instagram_ui/Pages/account_page.dart';
import 'package:assignment1_instagram_ui/Pages/add_page.dart';
import 'package:assignment1_instagram_ui/Pages/favorite_page.dart';
import 'package:assignment1_instagram_ui/Pages/home_page.dart';
import 'package:assignment1_instagram_ui/Pages/search_page.dart';
import 'package:assignment1_instagram_ui/Widgets/bottom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int  _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _myPages = [
    HomePage(),
    SearchPage(),
    AddPage(),
    FavoritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: _buildBottomBar,
    );
  }

  get _buildBody => PageView(
    physics: NeverScrollableScrollPhysics(),
    controller: _pageController,
    children: _myPages,
  );

  get _buildBottomBar => BottomAppBarWidget(
      iconTextList: [
        IconText(text: '', icon: _currentIndex == 0 ? Icons.home : Icons.home_outlined),
        IconText(text: '', icon: Icons.search),
        IconText(text: '', icon: _currentIndex == 2 ? Icons.add_box : Icons.add_box_outlined),
        IconText(text: '', icon: _currentIndex == 3 ? Icons.favorite : Icons.favorite_border),
        IconText(text: '', icon: _currentIndex == 4 ? Icons.account_circle : Icons.account_circle_outlined),
      ],
      onTap: (index) => setState((){
        _currentIndex = index;
        _pageController.jumpToPage(index);
      }),
      currentIndex: _currentIndex,
  );
}


