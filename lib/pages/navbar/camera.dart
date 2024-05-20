//saves a list of cameradescription
//The late keyword indicates that the variable will be initialized before it's used
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> _cameras = [];

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  //ValueNotifier<CameraController?> is the type of the variable
  //valuenotifier holds one value and when changed notifies the listener
  late ValueNotifier<CameraController?> _controllerNotifier;
  //controls camera

  @override
  void initState() {
    //to make sure the parent class is initialized first
    super.initState();
    _controllerNotifier = ValueNotifier<CameraController?>(null);
    _initializeCamera(); //fetch available cameras and setup cameracontroller
  }

//async makes it possible to use await in the function
//use it to perform operations that take time to complete without blocking the main thread of your application
  Future<void> _initializeCamera() async {
//A Future acts like a placeholder for the value that will be available at some point in the future.

    try {
      //await inside async pauses execution until it gets a list of available cameras
      final cameras = await availableCameras();
      setState(
        () {
          _cameras = cameras;
          _controllerNotifier.value = CameraController(
              //check if there is cameras available or not
              _cameras.isNotEmpty ? _cameras[0] : throw 'No cameras available',
              //sets the resolution
              ResolutionPreset.medium);
        },
      );
      // ! indicates that the value is sure not null
      //initialzie prepares the camera for use
      await _controllerNotifier.value!.initialize();
      //checks if the widget is still in the widget tree
      if (!mounted) {
        return;
      }
      setState(() {});
    } catch (e) {
      // Handle initialization errors
      // print('Error initializing camera: $e');
    }
  }

  @override
  // It's your chance to clean up any resources associated with the widget.
  void dispose() {
    _controllerNotifier.value?.dispose();
    _controllerNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //This widget rebuilds whenever the value of the _controllerNotifier changes
    return ValueListenableBuilder<CameraController?>(
      valueListenable: _controllerNotifier,
      builder: (context, controller, _) {
        if (_cameras.isEmpty ||
            controller == null ||
            !controller.value.isInitialized) {
          return Container(); // Or show a loading indicator
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Light blue
                  Color.fromARGB(255, 65, 180, 226), // Light blue
                  Color.fromARGB(255, 0, 91, 218)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
            // Desired height
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 420,
                    height: 555,
                    child: CameraPreview(controller),
                  ),
                ),
                const Positioned(

                  bottom: 0.0, 

                  child: SizedBox(
                    width: 420.0, // Desired width
                    height: 135.0, // Desired height
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Your Translation',
                        fillColor: Color.fromARGB(255, 228, 225, 225),
                        filled: true,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
