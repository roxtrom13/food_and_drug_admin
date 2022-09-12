import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraTab extends StatefulWidget {
  const CameraTab({Key? key}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

enum WidgetState {
  none,
  loading,
  loaded,
  error,
}

class _CameraTabState extends State<CameraTab> {
  WidgetState _widgetState = WidgetState.none;
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  initializeCamera() async {
    _widgetState = WidgetState.loading;

    if (mounted) {
      setState(() {});
    }

    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high);

    await _cameraController.initialize();

    if (_cameraController.value.hasError) {
      _widgetState = WidgetState.error;
    } else {
      _widgetState = WidgetState.loaded;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    initializeCamera();

    // switch(_widgetState) {
    //   case WidgetState.none:
    //     jj
    // }

    return const Text("Hola mundo");
  }
}
