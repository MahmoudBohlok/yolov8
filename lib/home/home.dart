
import 'dart:ui';
import 'package:Tamrah/home/yolo/tesseract_image.dart';
import 'package:Tamrah/home/yolo/yolo_image.dart';
import 'package:Tamrah/home/yolo/yolo_video.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';




import '../dialog/close_app_dialog.dart';
import '../main.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  Options option = Options.none;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () {
          showDialog(
              context: context,
              builder: (context) {
                return ColseAppDialog(context);
              });


          return Future.value(true);

        },
    child:


      Scaffold(
      body: task(option),
      floatingActionButton: SpeedDial(
        //margin bottom
        icon: Icons.menu, //icon on Floating action button
        activeIcon: Icons.close, //icon when menu is expanded on button
        backgroundColor: Colors.black12, //background color of button
        foregroundColor: Colors.white, //font color, icon color in button
        activeBackgroundColor:
        Colors.deepPurpleAccent, //background color when menu is expanded
        activeForegroundColor: Colors.white,
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        buttonSize: const Size(56.0, 56.0),
        children: [
          SpeedDialChild(
            //speed dial child
            child: const Icon(Icons.video_call),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'تشغيل فيديو',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                option = Options.frame;
              });
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.camera),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'اختيار صوره من المعرض',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                option = Options.image;
              });
            },
          ),
          // SpeedDialChild(
          //   child: const Icon(Icons.text_snippet_outlined),
          //   foregroundColor: Colors.white,
          //   backgroundColor: Colors.green,
          //   label: 'Tesseract',
          //   labelStyle: const TextStyle(fontSize: 18.0),
          //   onTap: () {
          //     setState(() {
          //       option = Options.tesseract;
          //     });
          //   },
          // ),
          // SpeedDialChild(
          //   child: const Icon(Icons.document_scanner),
          //   foregroundColor: Colors.white,
          //   backgroundColor: Colors.green,
          //   label: 'Vision',
          //   labelStyle: const TextStyle(fontSize: 18.0),
          //   onTap: () {
          //     setState(() {
          //       option = Options.vision;
          //     });
          //   },
          // ),
        ],
      ),
      ),
    );
  }

  Widget task(Options option) {
    if (option == Options.frame) {
      return YoloVideo();
    }
    if (option == Options.image) {
      return YoloImage();
    }
    if (option == Options.tesseract) {
      return const TesseractImage();
    }
    return Container(
              padding: EdgeInsets.all(15),
            alignment: AlignmentDirectional.center,
            height: double.infinity,
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Image.asset(
            "assets/mainlogo.png",
            fit: BoxFit.cover,
        ));
  }
}




