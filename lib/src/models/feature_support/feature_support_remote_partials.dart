import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';
import 'package:app_compat_benchmark_core/src/models/shared/required_features.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';

class FeatureSupportRemotePartial {
  final double? featureSuppCamera;
  final double? featureSuppNfc;
  final double? featureSuppGps;

  final RequiredFeatures? requiredFeatures;
  final TieredReq? thresholds;

  const FeatureSupportRemotePartial({
    this.featureSuppCamera,
    this.featureSuppNfc,
    this.featureSuppGps,
    this.requiredFeatures,
    this.thresholds,
  });

  factory FeatureSupportRemotePartial.fromJson(
    Map<String, dynamic> featureJson,
  ) {
    final weights = JsonParser.toMap(featureJson['weights']);
    final reqFeatures = JsonParser.toMap(featureJson['requiredFeatures']);
    final th = JsonParser.toMap(featureJson['thresholds']);

    RequiredFeatures? rf() {
      if (reqFeatures == null) return null;
      try {
        return RequiredFeatures.fromJson(reqFeatures);
      } catch (_) {
        return null;
      }
    }

    TieredReq? thresholds() {
      if (th == null) return null;
      try {
        return TieredReq.fromJson(th);
      } catch (_) {
        return null;
      }
    }

    return FeatureSupportRemotePartial(
      featureSuppCamera: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['featureSuppCamera']),
      featureSuppNfc: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['featureSuppNfc']),
      featureSuppGps: weights == null
          ? null
          : JsonParser.toDoubleOrNull(weights['featureSuppGps']),
      requiredFeatures: rf(),
      thresholds: thresholds(),
    );
  }
}
