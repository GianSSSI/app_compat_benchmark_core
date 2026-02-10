import 'package:app_compat_benchmark_core/src/defaults/domain/weights/domain_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/domain/weights/domain_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DomainWeightsDefaultBundle extends DefaultValue
    implements DomainWeightsSet {
  const DomainWeightsDefaultBundle._() : super(key: 'default', value: 0);

  static const defaults = DomainWeightsDefaultBundle._();

  @override
  DefaultValue get deviceAndOs => DomainWeightsDefault.deviceAndOs;

  @override
  DefaultValue get featureSuppport => DomainWeightsDefault.featureSuppport;

  @override
  DefaultValue get performance => DomainWeightsDefault.performance;
}
