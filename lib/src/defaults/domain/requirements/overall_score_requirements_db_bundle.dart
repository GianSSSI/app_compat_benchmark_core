import 'package:app_compat_benchmark_core/src/defaults/domain/requirements/overall_score_requirements_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/domain/requirements/overall_score_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class OverallScoreDbRequirementsJsonBundle
    implements OverallScoreRequirementsSet {
  final Map<String, DefaultValue> _weights;

  OverallScoreDbRequirementsJsonBundle._(this._weights);

  factory OverallScoreDbRequirementsJsonBundle.fromJson(
    Map<String, dynamic> json,
  ) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return OverallScoreDbRequirementsJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _weights[key] ?? fallback;

  @override
  DefaultValue get limitedOverall =>
      _get('limitedOverall', OverallScoreRequirementsDefault.limitedOverall);

  @override
  DefaultValue get optimalOverall =>
      _get('optimalOverall', OverallScoreRequirementsDefault.optimalOverall);

  @override
  DefaultValue get supportedOverall => _get(
    'supportedOverall',
    OverallScoreRequirementsDefault.supportedOverall,
  );
}
