import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterr/pages/tabs/home.dart';
import './pages/tabs.dart';
import './netconfit.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932), //屏幕适配
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter demo',
              theme: ThemeData(primarySwatch: Colors.blue),
              home: const Tabs());
        }); //Tabs位于tabs.dart
  }
}

class RegisterDemo extends StatefulWidget {
  const RegisterDemo({super.key});

  @override
  State<RegisterDemo> createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
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
        // appBar: AppBar(
        //   title: const Text('Register Demo'),
        // ),
        body: Column(
      children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            "images/register.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Stack(
          children: [
            Positioned.fill(
                child: Container(
              height: 500.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 172, 214, 247).withOpacity(0.3),
                    const Color.fromRGBO(229, 239, 244, 1).withOpacity(0.3),
                  ])),
            )),
            Form(
                //key:Globalkey(),
                key: GlobalKey(),
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
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
                                '手机号',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              )),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                              label: Text(
                                '验证码',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              )),
                        ),
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
                            child: const Text('登录')),
                      ],
                    )))
          ],
        )
      ],
    ));
  }
}

class XinxiDemo extends StatefulWidget {
  const XinxiDemo({super.key});

  @override
  State<XinxiDemo> createState() => _XinxiDemoState();
}

class _XinxiDemoState extends State<XinxiDemo> {
  late TextEditingController gexingController;
  late TextEditingController xiaoquController;
  late TextEditingController nameController;
  late TextEditingController gradeController;
  late TextEditingController majorController;
  late TextEditingController lianxiController;
  @override
  void initState() {
    gexingController = TextEditingController();
    xiaoquController = TextEditingController();
    nameController = TextEditingController();
    gradeController = TextEditingController();
    majorController = TextEditingController();
    lianxiController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Register Demo'),
        // ),
        body: Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 172, 214, 247).withOpacity(0.3),
                const Color.fromRGBO(229, 239, 244, 1).withOpacity(0.3),
              ])),
        )),
        Form(
            key: GlobalKey(),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    "images/xinxi.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      label: Text(
                        '昵称',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                TextFormField(
                  controller: gradeController,
                  decoration: const InputDecoration(
                      label: Text(
                        '年级',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                TextFormField(
                  controller: majorController,
                  decoration: const InputDecoration(
                      label: Text(
                        '专业',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                TextFormField(
                  controller: xiaoquController,
                  decoration: const InputDecoration(
                      label: Text(
                        '校区',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                TextFormField(
                  controller: lianxiController,
                  decoration: const InputDecoration(
                      label: Text(
                        '联系方式',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                TextFormField(
                  controller: gexingController,
                  decoration: const InputDecoration(
                      label: Text(
                        '个性签名',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String grade = gradeController.text;
                      String major = majorController.text;
                      String xiaoqu = xiaoquController.text;
                      String lianxi = lianxiController.text;
                      String gexing = gexingController.text;

                      NetConfig.post(name, grade).then(
                        (value) => print(value),
                      );
                      NetConfig.post(major, xiaoqu).then(
                        (value) => print(value),
                      );
                      NetConfig.post(lianxi, gexing).then(
                        (value) => print(value),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tabs()));
                    },
                    child: const Text('下一步')),
              ],
            )))
      ],
    ));
  }
}
