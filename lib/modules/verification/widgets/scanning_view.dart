import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class ScanningView extends StatefulWidget {
  const ScanningView({super.key});

  @override
  State<ScanningView> createState() => _ScanningViewState();
}

class _ScanningViewState extends State<ScanningView> {
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_cameraController.value.isInitialized) ...[
          CameraPreview(
            _cameraController,
            child: Column(
              children: [],
            ),
          ),
        ] else ...[
          const Center(child: CircularProgressIndicator()),
        ]
      ],
    );
  }
}
