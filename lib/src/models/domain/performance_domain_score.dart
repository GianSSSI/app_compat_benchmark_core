import 'package:app_compat_benchmark_core/src/models/performance/benchmark_result.dart';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step_score.dart';

class PerformanceDomainScore {
  final List<BenchmarkStepScore> stepScores;
  final List<BenchmarkStepResult> results;
  final double overallScore;
  final String overallRating;

  PerformanceDomainScore({
    required this.results,
    required this.stepScores,
    required this.overallScore,
    required this.overallRating,
  });
}
