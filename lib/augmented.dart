import 'package:arkit_plugin/arkit_node.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:arkit_plugin/geometries/arkit_sphere.dart';
import 'package:arkit_plugin/widget/arkit_scene_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Augmented extends StatefulWidget {
  const Augmented({Key? key}) : super(key: key);

  @override
  _AugmentedState createState() => _AugmentedState();
}

class _AugmentedState extends State<Augmented> {
  late ARKitController arkitController;

  // onArCoreViewCreated(ARKitController _arCoreController){
  //   arkitController=_arCoreController;
  //  _addSphere(arkitController);
  // }
  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;

    this.arkitController.add(ARKitNode(
      geometry: ARKitBox(
          height: 0.3,
          width: 0.4,
          materials: [
            ARKitMaterial(
              diffuse: ARKitMaterialProperty.image("assets/car.png"),
              doubleSided: false,
            )
          ]
      ),
      scale: vector.Vector3.all(0.1),
      // position:  vector.Vector3.all(0.5)
    ));
  }


  // _addSphere(ARKitController _arCoreController){
  //   final material= ArCoreMaterial(color: Colors.deepOrange);
  //   final sphere=ArCoreSphere(materials: [material],radius: 0.2);
  //   final node=ArCoreNode(shape: sphere,position: vector.Vector3(
  //     0,0,-1
  //   ));
  //   _arCoreController.(node);
  // }
  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated)
    );
  }
}
