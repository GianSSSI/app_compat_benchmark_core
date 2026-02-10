import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step.dart';

class BenchmarkStepResult {
  final BenchmarkStepType type;
  final double fps;
  final double frameTime;
  final double cpuUsage;
  final double memoryUsage;

  BenchmarkStepResult({
    required this.type,
    required this.fps,
    required this.frameTime,
    required this.cpuUsage,
    required this.memoryUsage,
  });

  @override
  String toString() {
    return 'BenchmarkStepResult('
        'type: $type, '
        'fps: ${fps.toStringAsFixed(2)}, '
        'frameTime: ${frameTime.toStringAsFixed(2)}ms, '
        'cpuUsage: ${cpuUsage.toStringAsFixed(2)}%, '
        'memoryUsage: $memoryUsage KB'
        ')';
  }
}
