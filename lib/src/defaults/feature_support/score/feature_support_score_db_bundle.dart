import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/feature_support/score/feature_support_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class FeatureSupportScoresJsonBundle implements FeatureSupportScoresSets {
  final Map<String, DefaultValue> _scores;

  FeatureSupportScoresJsonBundle._(this._scores);

  factory FeatureSupportScoresJsonBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return FeatureSupportScoresJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _scores[key] ?? fallback;

  @override
  DefaultValue get featureNotSupported => _get(
    'featureNotSupported',
    FeatureSupportScoreDefaults.featureNotSupported,
  );

  @override
  DefaultValue get featureSupported =>
      _get('featureSupported', FeatureSupportScoreDefaults.featureSupported);
}
