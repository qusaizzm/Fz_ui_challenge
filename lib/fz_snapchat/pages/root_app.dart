import 'package:flutter/material.dart'; 
import 'package:fz_ui_challenge/fz_snapchat/pages/discover_page.dart';
import 'package:fz_ui_challenge/fz_snapchat/pages/camera_page.dart';
import 'package:fz_ui_challenge/fz_snapchat/pages/chat_page.dart';
import 'package:fz_ui_challenge/fz_snapchat/pages/map_page.dart';
import 'package:fz_ui_challenge/fz_snapchat/pages/stories_page.dart';
import 'package:fz_ui_challenge/fz_snapchat/theme/colors.dart';

class SnapChatApp extends StatefulWidget {
  @override
  _SnapChatAppState createState() => _SnapChatAppState();
}

class _SnapChatAppState extends State<SnapChatApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    MapPage(),
    ChatPage(),
    CameraPage(),
    // ChatPage(),
    StoriesPage(),
    DiscoverPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    // return pages.elementAt(pageIndex);
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List iconItems = [
      Icons.location_pin,
      Icons.chat_bubble_outline,
      Icons.camera,
      Icons.person,
      Icons.menu
    ];
    List textItems = ["Map", "Chat", "Camera", "Stories", "Discover"];
    List colorItems = [
      green,
      blue,
      primary,
      purple,
      primary,
    ];
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
              top:
                  BorderSide(width: 2, color: Colors.black.withOpacity(0.06)))),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: Column(
                  children: [
                    Icon(iconItems[index],
                        color: pageIndex == index
                            ? colorItems[index]
                            : Colors.white.withOpacity(0.5)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: pageIndex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)),
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
