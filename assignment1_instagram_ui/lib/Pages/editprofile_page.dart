import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar,
          _buildProfileBox,
        ],
      ),
    );
  }

  get _buildSliverAppBar => SliverAppBar(
    backgroundColor: Colors.white,
    pinned: true,
    leading: TextButton(
      child: Text('Cancel', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text('Edit Profile', style: GoogleFonts.ubuntu(color: Colors.black, fontWeight: FontWeight.bold)),
    actions: [
      TextButton(
        child: Text('Done', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );

  get _buildProfileBox => SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 130, width: 130,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/profile_image/bondeth_profile.jpeg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text('Change Profile Photo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          ),
          SizedBox(height: 20),
          Divider(),
          _buildList(label: 'Name',text: 'Bondeth'),
          _buildList(label: 'Username', text: '_bondeth_'),
          _buildList(label: 'Website',text: 'rithybondeth999@gmail.com'),
          _buildList(
              label: 'Bio',
              oneLine: false,
              textLine1: 'Hem RithyBondeth',
              textLine2: 'Cambodian🇰🇭',
              textLine3: '19 years old',
              textLine4: 'Mobile App Developer📱',
              textLine5: 'Taurus♉️',
          ),
          Divider(),
          Text('Personal Information Settings', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    )
  );

  Widget _buildList({
    required String label,
    String text = '',
    bool oneLine = true,
    String textLine1 = '',
    String textLine2 = '',
    String textLine3 = '',
    String textLine4 = '',
    String textLine5 = '',
  }) => Row(children: [
    Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('$label',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ),
    Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           oneLine ? Text('$text') :
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text('$textLine1'),
             Text('$textLine2'),
             Text('$textLine3'),
             Text('$textLine4'),
             Text('$textLine5')
           ],),
            oneLine ? Divider() : SizedBox(height: 5),
          ],
        ),
      )
    )
  ],);
}
