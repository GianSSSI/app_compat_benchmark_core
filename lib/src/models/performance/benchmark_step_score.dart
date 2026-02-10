import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step.dart';

class BenchmarkStepScore {
  final BenchmarkStepType stepType;
  final double fps;
  final double frameTime;
  final double cpuUsage;
  final double memoryUsage;
  final double? totalScore;
  BenchmarkStepScore({
    required this.stepType,
    this.fps = 0.0,
    this.frameTime = 0.0,
    this.cpuUsage = 0.0,
    this.memoryUsage = 0.0,
    this.totalScore,
  });

  BenchmarkStepScore copyWith({
    double? fps,
    double? frameTime,
    double? cpuUsage,
    double? memoryUsage,
    double? totalScore,
  }) {
    return BenchmarkStepScore(
      stepType: stepType,
      fps: fps ?? this.fps,
      frameTime: frameTime ?? this.frameTime,
      cpuUsage: cpuUsage ?? this.cpuUsage,
      memoryUsage: memoryUsage ?? this.memoryUsage,
      totalScore: totalScore ?? this.totalScore,
    );
  }

  @override
  String toString() {
    return 'BenchmarkStepScore(stepType: $stepType, '
        'fps: ${fps.toStringAsFixed(2)}, '
        'frameTime: ${frameTime.toStringAsFixed(2)} ms, '
        'cpuUsage: ${cpuUsage.toStringAsFixed(2)}, '
        'memoryUsage: ${memoryUsage.toStringAsFixed(2)})';
  }
}
