import 'dart:io';

import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';
import 'package:app_compat_benchmark_core/src/models/feature_support/feature_support_result.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class FeatureCheckerRunner {
  Future<FeatureSuppResult> checkCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        return FeatureSuppResult(
          stepType: FeatureStepType.camera,
          status: FeatureStatus.unsupported,
          message: 'No Camera Found',
          incompatible: true,
        );
      }

      final permission = await Permission.camera.status;
      if (!permission.isGranted) {
        return FeatureSuppResult(
          stepType: FeatureStepType.camera,
          status: FeatureStatus.permissionDenied,
          message: 'Camera Permission Denied or Not Granted',
          incompatible: true,
        );
      }

      final controller = CameraController(
        cameras.first,
        ResolutionPreset.low,
        enableAudio: false,
      );

      await controller.initialize();
      await controller.dispose();

      return FeatureSuppResult(
        stepType: FeatureStepType.camera,
        status: FeatureStatus.ready,
        message: 'Camerea is Ready and Supported',
      );
    } catch (e) {
      return FeatureSuppResult(
        stepType: FeatureStepType.camera,
        status: FeatureStatus.runtimeFailed,
        message: e.toString(),
      );
    }
  }

  Future<FeatureSuppResult> checkLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return FeatureSuppResult(
        stepType: FeatureStepType.gps,
        status: FeatureStatus.serviceDisabled,
        message: 'Location Service is Disabled',
        incompatible: true,
      );
    }

    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return FeatureSuppResult(
        stepType: FeatureStepType.gps,
        status: FeatureStatus.permissionDenied,
        message: 'Location Permission Denied or Not Granted',
        incompatible: true,
      );
    }

    try {
      final LocationSettings settings;

      if (Platform.isAndroid) {
        settings = AndroidSettings(
          accuracy: LocationAccuracy.low,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 3),
        );
      } else if (Platform.isIOS) {
        settings = AppleSettings(
          accuracy: LocationAccuracy.low,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 3),
        );
      } else {
        settings = const LocationSettings(
          accuracy: LocationAccuracy.low,
          distanceFilter: 10,
          timeLimit: Duration(seconds: 3),
        );
      }

      await Geolocator.getCurrentPosition(locationSettings: settings);

      return FeatureSuppResult(
        stepType: FeatureStepType.gps,
        status: FeatureStatus.ready,
        message: 'Location is Ready and Supported',
      );
    } catch (e) {
      return FeatureSuppResult(
        stepType: FeatureStepType.gps,
        status: FeatureStatus.runtimeFailed,
        message: e.toString(),
      );
    }
  }
  // Future<FeatureCheckResult> checkCamera() async {
  //   try {
  //     final cameras = await availableCameras();
  //     if (cameras.isEmpty) {
  //       return FeatureCheckResult(FeatureStatus.unsupported);
  //     }

  //     final permission = await Permission.camera.status;
  //     if (!permission.isGranted) {
  //       return FeatureCheckResult(FeatureStatus.permissionDenied);
  //     }

  //     final controller = CameraController(
  //       cameras.first,
  //       ResolutionPreset.low,
  //       enableAudio: false,
  //     );

  //     await controller.initialize();
  //     await controller.dispose();

  //     return FeatureCheckResult(FeatureStatus.ready);
  //   } catch (e) {
  //     return FeatureCheckResult(FeatureStatus.runtimeFailed, e.toString());
  //   }
  // }

  // Future<FeatureCheckResult> checkLocation() async {
  //   if (!await Geolocator.isLocationServiceEnabled()) {
  //     return FeatureCheckResult(FeatureStatus.serviceDisabled);
  //   }

  //   final permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     return FeatureCheckResult(FeatureStatus.permissionDenied);
  //   }

  //   try {
  //     final LocationSettings settings;

  //     if (Platform.isAndroid) {
  //       settings = AndroidSettings(
  //         accuracy: LocationAccuracy.low,
  //         distanceFilter: 10,
  //         timeLimit: Duration(seconds: 3),
  //       );
  //     } else if (Platform.isIOS) {
  //       settings = AppleSettings(
  //         accuracy: LocationAccuracy.low,
  //         distanceFilter: 10,
  //         timeLimit: Duration(seconds: 3),
  //       );
  //     } else {
  //       settings = const LocationSettings(
  //         accuracy: LocationAccuracy.low,
  //         distanceFilter: 10,
  //         timeLimit: Duration(seconds: 3),
  //       );
  //     }

  //     await Geolocator.getCurrentPosition(locationSettings: settings);

  //     return FeatureCheckResult(FeatureStatus.ready);
  //   } catch (e) {
  //     return FeatureCheckResult(FeatureStatus.runtimeFailed, e.toString());
  //   }
  // }
}
