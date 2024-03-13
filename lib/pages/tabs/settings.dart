import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        widthFactor: 411.4,
        heightFactor: 730,
        child: Column(
          children: [
            Image(
              image: AssetImage("images/p3.jpg"),
              width: 411.4,
              height: 730,
              fit: BoxFit.contain,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (BuildContext context) {
            //       return const real();
            //     }));
            //   },
            //   style: ButtonStyle(
            //       shape: MaterialStateProperty.all(const StadiumBorder(
            //           side: BorderSide(style: BorderStyle.none))),
            //       fixedSize: const MaterialStatePropertyAll(Size(350, 30))),
            //   child: const Text(
            //     " |||  天 南 门  |||",
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //         fontSize: 25,
            //         color: Colors.black,
            //         fontWeight: FontWeight.w900),
            //   ),
            // )
          ],
        ));
  }
}

// Center(
//       widthFactor: 532,
//       heightFactor: 532,
//       child: Image(image: AssetImage("images/third.jpg"),
//       width: 411.4,
//       height: 540,
//       fit: BoxFit.contain,),

//     );

// Image(image: AssetImage("images/third.jpg"),
//       width: 411.4,
//       height: 532,
//       fit: BoxFit.contain,

//     )
