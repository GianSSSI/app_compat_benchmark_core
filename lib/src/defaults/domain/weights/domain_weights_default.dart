import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DomainWeightsDefault {
  static const deviceAndOs = DefaultValue(key: 'deviceAndOs', value: 0.25);
  static const performance = DefaultValue(key: 'performance', value: 0.50);
  static const featureSuppport = DefaultValue(
    key: 'featureSuppport',
    value: 0.25,
  );
}
