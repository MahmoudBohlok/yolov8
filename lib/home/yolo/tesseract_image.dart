import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:async';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:image_picker/image_picker.dart';

class TesseractImage extends StatefulWidget {
  const TesseractImage({Key? key}) : super(key: key);

  @override
  State<TesseractImage> createState() => _TesseractImageState();
}

class _TesseractImageState extends State<TesseractImage> {
  late FlutterVision vision;
  late List<Map<String, dynamic>> tesseractResults = [];
  File? imageFile;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    vision = FlutterVision();
    loadTesseractModel().then((value) {
      setState(() {
        isLoaded = true;
        tesseractResults = [];
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await vision.closeTesseractModel();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: Text("Model not loaded, waiting for it"),
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          imageFile != null ? Image.file(imageFile!) : const SizedBox(),
          tesseractResults.isEmpty
              ? const SizedBox()
              : Align(child: Text(tesseractResults[0]["text"])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: pickImage,
                child: const Text("Pick image"),
              ),
              ElevatedButton(
                onPressed: tesseractOnImage,
                child: const Text("Get Text"),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadTesseractModel() async {
    await vision.loadTesseractModel(
      args: {
        'psm': '11',
        'oem': '1',
        'preserve_interword_spaces': '1',
      },
      language: 'spa',
    );
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
      });
    }
  }

  tesseractOnImage() async {
    tesseractResults.clear();
    Uint8List byte = await imageFile!.readAsBytes();
    final result = await vision.tesseractOnImage(bytesList: byte);
    if (result.isNotEmpty) {
      setState(() {
        tesseractResults = result;
      });
    }
  }
}