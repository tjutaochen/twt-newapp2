import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import './search.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: [
          GetPage(name: "/searchpage", page: () => const SearchScreen())
        ],
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.blue.withOpacity(0.3),
              backgroundColor: Colors.blue.withOpacity(0.3),
              surfaceTintColor: Colors.blue.withOpacity(0.3),
              toolbarHeight: 50.h,
              title: const Text(
                "北洋二手",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 21.78),
              ),
            ),
            backgroundColor: Colors.blue.shade100,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [Positioned(left: 40.w,right: 40.w,
                  child:Container(
                    height: 34.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(200, 220, 210, 1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: const Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Icon(Icons.search, color: Colors.teal),
                          ),
                          Text(
                            "点我进行搜索",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ),
                      onTap: () {
                        Get.toNamed("/searchpage");
                      },
                    ),
                  ),),
                  
                  Positioned(
                      top: 100.h,
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
                ],
              ),
            )));
  }
}
