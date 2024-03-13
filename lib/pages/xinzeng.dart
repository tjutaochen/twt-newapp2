import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './tabs.dart';
import 'package:flutterr/main.dart';
import 'package:flutterr/netconfit.dart';

class XinZeng extends StatefulWidget {
  const XinZeng({super.key});

  @override
  State<XinZeng> createState() => _XinZengState();
}

class _XinZengState extends State<XinZeng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OutlinedButton(onPressed: (){
          
        }, child: const Icon(Icons.keyboard_arrow_left)),
        title: const Text("发布商品",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight:FontWeight.w800,
        ),),
      ),
    );
  }
}