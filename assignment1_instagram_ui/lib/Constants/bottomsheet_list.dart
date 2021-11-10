import 'package:assignment1_instagram_ui/Widgets/bottomsheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BottomSheetListTile> bottomSheetList1 = [
  BottomSheetListTile(title: 'Post', icon: Icons.apps_outlined),
  BottomSheetListTile(title: 'Story', icon: Icons.motion_photos_on),
  BottomSheetListTile(title: 'Story Highlight', icon: CupertinoIcons.heart_circle),
  BottomSheetListTile(title: 'IGTV Video', icon: Icons.live_tv),
  BottomSheetListTile(title: 'Live', icon: CupertinoIcons.antenna_radiowaves_left_right),
  BottomSheetListTile(title: 'Guide', icon: CupertinoIcons.news),
];

List<BottomSheetListTile> bottomSheetList2 = [
  BottomSheetListTile(title: 'Settings', icon: Icons.settings_outlined),
  BottomSheetListTile(title: 'Archive', icon: Icons.history),
  BottomSheetListTile(title: 'Your Activity', icon: Icons.history_toggle_off),
  BottomSheetListTile(title: 'QR Code', icon: Icons.qr_code_scanner),
  BottomSheetListTile(title: 'Saved', icon: Icons.bookmark_border),
  BottomSheetListTile(title: 'Close Friends', icon: Icons.list),
  BottomSheetListTile(title: 'COVID-19 Information', icon: CupertinoIcons.heart_circle),
];