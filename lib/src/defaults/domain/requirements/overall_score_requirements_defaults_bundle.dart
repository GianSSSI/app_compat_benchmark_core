import 'package:app_compat_benchmark_core/src/defaults/domain/requirements/overall_score_requirements_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/domain/requirements/overall_score_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class OverallScoreRequirementsDefaultsBundle extends DefaultValue
    implements OverallScoreRequirementsSet {
  const OverallScoreRequirementsDefaultsBundle._()
    : super(key: 'default', value: 0);

  static const defaults = OverallScoreRequirementsDefaultsBundle._();

  @override
  DefaultValue get optimalOverall =>
      OverallScoreRequirementsDefault.optimalOverall;

  @override
  DefaultValue get supportedOverall =>
      OverallScoreRequirementsDefault.supportedOverall;

  @override
  DefaultValue get limitedOverall =>
      OverallScoreRequirementsDefault.limitedOverall;
}
