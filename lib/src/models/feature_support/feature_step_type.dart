enum FeatureStepType { camera, gps }

extension FeatureStepTypeX on FeatureStepType {
  bool get isHardBlocker {
    switch (this) {
      case FeatureStepType.camera:
        return true;
      case FeatureStepType.gps:
        return true;
    }
  }
}
