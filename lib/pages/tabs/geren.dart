import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.w),
            color: Theme.of(context).primaryColorLight,
            child: const Row(children: <Widget>[
              CircleAvatar(backgroundImage: AssetImage("images/xingxing.png"),),//取头像
              SizedBox(width: 20,),
              Expanded(child: ListTile(
                title:Text("yy"),//昵称
                subtitle: Text("m"),//个性签名
              ),),
              Icon(Icons.keyboard_arrow_right),
            ]),
          ),
          Container(
            color: Theme.of(context).primaryColorLight,
            child: const ListTile(
              leading: Icon(Icons.aspect_ratio),
              title: Text("w"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          )
        ],
      ),
    );
  }
}