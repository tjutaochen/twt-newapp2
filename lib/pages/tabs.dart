import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterr/main.dart';
import 'package:flutterr/pages/tabs/geren.dart';
import 'package:flutterr/pages/tabs/upload.dart';
import 'package:flutterr/pages/tabs/xinzeng.dart';
import './tabs/home.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    Homepage(),
    PersonPage(),
    XinZeng(), 
    RegisterDemo(),
    XinxiDemo(),   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue[600],
          iconSize: 25.h,
          type: BottomNavigationBarType.fixed,

          ///多个菜单，>3
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "摆摊",backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded), label: "广场",backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: ""),
            BottomNavigationBarItem(
               icon:Icon(Icons.person_rounded,),
               label: "消息",
               backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
               icon:Icon(Icons.person_rounded),
               label: "我的",
               backgroundColor: Colors.black
            ),
          ]),
          floatingActionButton: Container(
            width: 80.w,
            height: 80.h,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(top:20),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(1000000),
              color: const Color.fromRGBO(229, 239, 244, 1).withOpacity(0.3),
            ),
            child: FloatingActionButton(
            child:const Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => XinZeng()));
            }
            ),
          ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
