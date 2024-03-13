import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.blue.withOpacity(0.3),
            backgroundColor: Colors.blue.withOpacity(0.3),
            surfaceTintColor:Colors.blue.withOpacity(0.3),
            toolbarHeight: 50.h,
            title: const Text("北洋二手",
            style: TextStyle(
color: Colors.black,
fontWeight: FontWeight.w900,
fontSize: 18,

            ),),
          ),
            backgroundColor: Colors.blue.shade100,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          const Color.fromARGB(255, 172, 214, 247)
                              .withOpacity(0.3),
                          const Color.fromRGBO(229, 239, 244, 1)
                              .withOpacity(0.3),
                        ])),
                  )),
                  ListView(
                    children: [
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                      Text("待添加..."),
                    ],
                  )
                ],
              ),
            )));
  }
}


