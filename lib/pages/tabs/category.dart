import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  //生命周期函数

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: Colors.black54,
        ),
        backgroundColor: Colors.white70,
        title: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            indicatorWeight: 2,
            indicatorPadding: const EdgeInsets.all(5),
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text(
                  "发现",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "学习",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "会员",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "学习",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "交往",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "摆摊",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "二次元",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
      ),
      body:
          // Container(
          //   height: 500,
          //   width: 400,
          //   padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          //   child: const Image(image: AssetImage("")),
          // ),

          TabBarView(controller: _tabController, children: [
        ListView(
          children: const [
            ListTile(
             
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
              title: Text("数模组队三缺一"),
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
              title: Text("gagaga"),
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
              title: Text("gagaga"),
            ),
          ],
        ),
        ListView(
          children: const [
            ListTile(
              title: Text("gagaga"),
            ),
          ],
        ),
      ]),
    );
  }
}
