import 'package:app_compat_benchmark_core/src/models/feature_support/feature_step_type.dart';

enum FeatureStatus {
  supported,
  unsupported,
  permissionDenied,
  serviceDisabled,
  runtimeFailed,
  ready,
}

class FeatureSuppResult {
  final FeatureStepType stepType;
  final FeatureStatus status;
  final bool incompatible;
  final String? message;

  FeatureSuppResult({
    required this.stepType,
    required this.status,
    required this.message,
    this.incompatible = false,
  });
}
