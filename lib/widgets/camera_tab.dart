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

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.none:
      case WidgetState.loading:
        return _buildScaffold(
          context,
          const Center(
            child: CircularProgressIndicator(),
          ),
        );
      case WidgetState.loaded:
        return Stack(
          children: [
            Positioned.fill(
              child: CameraPreview(_cameraController),
            ),
            Positioned.fill(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(backgroundColor: Colors.transparent),
                body: Stack(
                  children: [
                    Positioned(
                      bottom: 50,
                      right: 20,
                      left: 20,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 60.0,
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      case WidgetState.error:
        return _buildScaffold(
          context,
          const Center(
            child: Text("La cámara no se pudo inicializar."),
          ),
        );
    }
  }

  Widget _buildScaffold(BuildContext context, Widget body) {
    // return Container(
    //   child: body,
    // backgroundColor: Colors.black,
    // body: body,
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {},
    //   child: const Icon(Icons.camera),
    // ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // );
    return body;
  }

  Future<void> initializeCamera() async {
    _widgetState = WidgetState.loading;

    if (mounted) setState(() {});

    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);

    await _cameraController.initialize();

    if (_cameraController.value.hasError) {
      print("Has error :(");
      _widgetState = WidgetState.error;
      if (mounted) setState(() {});
    } else {
      print("All good :)");
      _widgetState = WidgetState.loaded;
      if (mounted) setState(() {});
    }
  }
}
