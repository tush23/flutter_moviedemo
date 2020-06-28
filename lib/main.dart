import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configer/configer_page.dart';
import 'constants/constants.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //*for transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );
  Constants.perfs =await SharedPreferences.getInstance();
  
  runApp(ConfigerPage());
}
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
// home: Home(),
//     );
    // return Container(
    //   // height: 50,
    //   // decoration: BoxDecoration(
    //   //   color: const Color(0xff7c94b6),
    //   //   image: new DecorationImage(
    //   //     fit: BoxFit.cover,
    //   //     colorFilter: ColorFilter.mode(
    //   //         Colors.black.withOpacity(0.2), BlendMode.dstATop),
    //   //     image: new NetworkImage(
    //   //       'https://wallpapercave.com/wp/wp4444517.jpg',
    //   //     ),
    //   //   ),
    //   // ),
    //   color: Colors.white,
    //   child: ShaderMask(
    //     shaderCallback: (rect) {
    //       return LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [Colors.green, Colors.transparent],
    //       ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height / 1.55));
    //     },
    //     blendMode: BlendMode.dstATop, //dstAtop or dstIn

    //     child: Image.network(
    //       'https://wallpapercave.com/wp/wp4444517.jpg',
    //       colorBlendMode: BlendMode.saturation,
    //       color: Colors.blueAccent,
    //       height: 400,
    //       fit: BoxFit.contain,
    //     ),
    //   ),
    // );
  //}
//}
