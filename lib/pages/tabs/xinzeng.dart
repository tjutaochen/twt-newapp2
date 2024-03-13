import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterr/pages/tabs.dart';
import 'package:flutterr/main.dart';
import 'package:flutterr/netconfit.dart';
import 'dart:convert';

class XinZeng extends StatefulWidget {
  const XinZeng({super.key});

  @override
  State<XinZeng> createState() => _XinZengState();
}

class _XinZengState extends State<XinZeng> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.3),
        leading: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left)),
        title: const Text(
          "发布商品",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Tabs()));
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Tabs()));
            },
            child: const Text(
              "发布",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Form(
              key: GlobalKey(),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        //keyboardType: TextInputType.number,
                        obscureText: false,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return '文本框不能为空或长度至少为6';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            label: Text(
                              '文字说明',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            )),
                      ),
                      // TextFormField(
                      //   obscureText: true,
                      //   controller: passwordController,
                      //   decoration: const InputDecoration(
                      //       label: Text(
                      //         '验证码',
                      //         style: TextStyle(fontWeight: FontWeight.w800),
                      //       ),
                      //       floatingLabelBehavior:
                      //           FloatingLabelBehavior.always,
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Colors.blue,
                      //             width: 1,
                      //             style: BorderStyle.solid),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20)),
                      //       )),
                      // ),
                      Container(
                          color: Colors.white,
                          width: double.infinity,
                          height: 400.h,
                          child: Stack(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  NetConfig.post(email, password).then(
                                    (value) {
                                      String result = value.toString();
                                      dynamic data = jsonDecode(result);
                                      print(data['data']['userId']);
                                    },
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const XinxiDemo())); //name==null?XinxiDemo():Tabs()
                                },
                                child: Text("上传图片"),
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   height: 400.h,
                              //   color: Colors.white,

                              // )
                            ],
                          ))
                    ],
                  )))
        ],
      ),
    );
  }
}
