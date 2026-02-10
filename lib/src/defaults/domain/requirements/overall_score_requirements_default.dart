import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class OverallScoreRequirementsDefault {
  static const optimalOverall = DefaultValue(key: 'optimalOverall', value: 90);

  static const supportedOverall = DefaultValue(
    key: 'supportedOverall',
    value: 70,
  );

  static const limitedOverall = DefaultValue(key: 'limitedOverall', value: 60);
}
