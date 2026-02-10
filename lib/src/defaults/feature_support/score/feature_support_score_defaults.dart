import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportScoreDefaults {
  static const featureSupported = DefaultValue(key: 'featureReady', value: 100);

  static const featureNotSupported = DefaultValue(
    key: 'featureNotSupported',
    value: -1,
  );
}
