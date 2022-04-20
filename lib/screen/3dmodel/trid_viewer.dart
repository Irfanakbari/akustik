import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Model1 extends StatelessWidget {
  const Model1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModelViewer(
      backgroundColor: Colors.black.withOpacity(0.5),
      src: 'assets/objek/pc.glb',
      autoPlay: true,
      alt: "A 3D model of an astronaut",
      ar: true,
      autoRotate: true,
      cameraControls: true,
    ));
  }
}
