import 'package:flutter/material.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_ui/beranda_page.dart';
import 'package:flutter_application_dummy_api/feature/beranda/beranda_ui/create_post_page.dart';
import 'package:flutter_application_dummy_api/feature/category/category_ui/category_page.dart';
import 'package:flutter_application_dummy_api/feature/notification/notification_ui/notification_page.dart';
import 'package:flutter_application_dummy_api/feature/profile/profile_ui/profile_page.dart';
import 'package:flutter_application_dummy_api/helper/color_helper.dart';

class BottomNavigation extends StatefulWidget {
  int? selected;
  BottomNavigation({
    Key? key,
    this.selected = 0,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _pageList = [
    const BerandaPage(),
    const CategoryPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePostPage(),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: ColorHelper.colorLinearGradient(),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/icons/Plus.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ],
          ), //icon inside button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: _pageList[widget.selected!],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        //bottom navigation bar on scaffold
        color: Colors.white,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: SizedBox(
          height: 75,
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.selected = 0;
                      });
                    },
                    child: Image.asset(
                      widget.selected == 0
                          ? 'assets/icons/Home_fill.png'
                          : 'assets/icons/Home.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.selected = 1;
                      });
                    },
                    child: Image.asset(
                      widget.selected == 1
                          ? 'assets/icons/Category_fill.png'
                          : 'assets/icons/Category.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.selected = 2;
                      });
                    },
                    child: Image.asset(
                      widget.selected == 2
                          ? 'assets/icons/Notification_fill.png'
                          : 'assets/icons/Notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        widget.selected = 3;
                      });
                    },
                    child: Image.asset(
                      widget.selected == 3
                          ? 'assets/icons/Profile_fill.png'
                          : 'assets/icons/Profile.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         widget.selected == 0
      //             ? 'assets/icons/Home_fill.png'
      //             : 'assets/icons/Home.png',
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         widget.selected == 1
      //             ? 'assets/icons/Category_fill.png'
      //             : 'assets/icons/Category.png',
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         widget.selected == 2
      //             ? 'assets/icons/Notification_fill.png'
      //             : 'assets/icons/Notification.png',
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         widget.selected == 3
      //             ? 'assets/icons/Profile_fill.png'
      //             : 'assets/icons/Profile.png',
      //         width: 24,
      //         height: 24,
      //       ),
      //       label: '',
      //     ),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      //   currentIndex: widget.selected!.toInt(),
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   onTap: (int? v) {
      //     setState(() {
      //       widget.selected = v!;
      //     });
      //   },
      // ),
    );
  }
}
