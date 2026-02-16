import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

class FeatureSupportScoreDefaults {
  static const featureSupported = DefaultValue(
    key: 'featureReady',
    value: 100.0,
  );

  static const featureNotSupported = DefaultValue(
    key: 'featureNotSupported',
    value: -1.0,
  );
}
