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
        return Center(
          child: Stack(
            children: [
              CameraPreview(_cameraController),
              Positioned.fill(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      Positioned(
                        bottom: 20,
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
                                Icons.circle,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                try {
                                  await _sendImage(context);
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                  Navigator.pushNamed(
                                      context, "/image-results");
                                } catch (e) {
                                  Navigator.of(context).pop();
                                  // TODO: Show some error
                                }
                              },
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
          ),
        );
      case WidgetState.error:
        return _buildScaffold(
          context,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 40.0,
                ),
                Text(
                  "La cámara no se pudo inicializar.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Verifique los permisos y reinicie la aplicación.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildScaffold(BuildContext context, Widget body) {
    return Container(
      color: Colors.black,
      child: body,
    );
  }

  Future<void> initializeCamera() async {
    _widgetState = WidgetState.loading;

    if (mounted) setState(() {});

    _cameras = await availableCameras();
    _cameraController =
        CameraController(_cameras[0], ResolutionPreset.high);

    await _cameraController.initialize();

    if (_cameraController.value.hasError) {
      _widgetState = WidgetState.error;
      if (mounted) setState(() {});
    } else {
      _widgetState = WidgetState.loaded;
      if (mounted) setState(() {});
    }
  }

  Future<void> _sendImage(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 15.0),
                Text(
                  "Espere mientras procesamos su imagen",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    // TODO: Async computation goes here :)
    await Future.delayed(const Duration(seconds: 2));
  }
}
