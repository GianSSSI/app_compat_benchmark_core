import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class PerformanceWeightsDefaultBundle extends DefaultValue
    implements PerformanceWeightsSet {
  const PerformanceWeightsDefaultBundle._() : super(key: 'default', value: 0);
  static const defaults = PerformanceWeightsDefaultBundle._();
  @override
  DefaultValue get cpuWeight => PerformanceWeightsDefault.cpuWeight;

  @override
  DefaultValue get fpsWeight => PerformanceWeightsDefault.fpsWeight;

  @override
  DefaultValue get frameTimeWeight => PerformanceWeightsDefault.frameTimeWeight;

  @override
  DefaultValue get memoryWeight => PerformanceWeightsDefault.memoryWeight;
}
