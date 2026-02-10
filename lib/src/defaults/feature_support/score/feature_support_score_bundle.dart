import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportScoreDefaultBundle extends DefaultValue
    implements FeatureSupportScoresSets {
  const FeatureSupportScoreDefaultBundle._() : super(key: 'default', value: 0);

  static const defaults = FeatureSupportScoreDefaultBundle._();

  @override
  DefaultValue get featureNotSupported =>
      FeatureSupportScoreDefaults.featureNotSupported;

  @override
  DefaultValue get featureSupported =>
      FeatureSupportScoreDefaults.featureSupported;
}
