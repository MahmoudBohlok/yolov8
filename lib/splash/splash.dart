import 'package:flutter/material.dart';
import 'package:flutter_mask_view/flutter_mask_view.dart';

import '../home/home.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>   with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _controller.forward();
    super.initState();
    _navigeToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                ImageProgressMaskView(
                  size: Size(300, 200),
                  backgroundRes: "assets/mainlogo.png",
                  progress: _controller.value,
                  pathProvider: PathProviders.createWaveProvider(50, 40),
                  rePaintDelegate: (_) => true,
                ),
                // Text(
                //   '${(_controller.value * 100).toInt()} %',
                //   style: TextStyle(
                //     color: Colors.red,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30,
                //   ),
                // )
              ],
            );
          },
        ),
      ),
    );
  }


  // }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //             padding: EdgeInsets.all(15),
  //           alignment: AlignmentDirectional.center,
  //           // Center is a layout widget. It takes a single child and positions it
  //           // in the middle of the parent.
  //           child:Center(
  //       child: FadeTransition(
  //         opacity: animation,
  //         child: Image.asset(
  //               ,
  //         ),
  //       ),
  //       ),
  //     ),
  //     );
  //


    // SafeArea(
    //     child: Container(
    //       padding: EdgeInsets.all(15),
    //     alignment: AlignmentDirectional.center,
    //     height: double.infinity,
    //     // Center is a layout widget. It takes a single child and positions it
    //     // in the middle of the parent.
    //     child: Image.asset(
    //     "assets/mainlogo.png",
    //     fit: BoxFit.cover,
    // ),
    //   ),
    //   ));






  void _navigeToHome() async {
    await Future.delayed(const Duration(milliseconds: 7000), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (con) => Home()));

    });
  }
}









