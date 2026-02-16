// Keep your app-only score rubric

import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/defaults/performance_default.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/requirements/performance_req_set.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/scores/performance_score_defaults_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/scores/performance_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/perfomance/weights/performance_weights_set.dart';

import 'package:app_compat_benchmark_core/src/models/performance/benchmark_result.dart';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step_score.dart';

class BenchmarkScorer {
  // NEW config sets (nullable so you can inject merged server+defaults)
  final PerformanceRequirementsSet? performanceRequirements;
  final PerformanceWeightsSet? performanceWeights;

  // KEEP score rubric app-only (points per tier)
  final PerformanceScoreSet? performanceScore;

  BenchmarkScorer({
    this.performanceWeights,
    this.performanceScore,
    this.performanceRequirements,
  });

  // NEW defaults (from new system)
  PerformanceRequirementsSet get _requirements =>
      performanceRequirements ?? PerformanceDefaults();

  PerformanceWeightsSet get _weights =>
      performanceWeights ?? PerformanceDefaults();

  // app-only score rubric default
  PerformanceScoreSet get _scores =>
      performanceScore ?? PerformanceScoreDefaultsBundle.defaults;

  // FPS scoring (higher is better)
  double _scoreFPS(double fps) {
    final r = _requirements.fps; // TieredReq (has degraded)

    if (fps >= r.optimal) return _scores.fpsOptimal.value;
    if (fps >= r.supported) return _scores.fpsSupported.value;
    if (fps >= r.limited) return _scores.fpsLimited.value;

    // degraded is optional in the model; use it if present
    final degraded = r.degraded;
    if (degraded != null && fps >= degraded) return _scores.fpsDegraded.value;

    return _scores.fpsMinimum.value;
  }

  // Frame time scoring (lower is better)
  double _scoreFrameTime(double frameTimeMs) {
    final r = _requirements.frameTimeMs; // TieredReq (has degraded)

    if (frameTimeMs <= r.optimal) return _scores.frameTimeOptimal.value;
    if (frameTimeMs <= r.supported) return _scores.frameTimeSupported.value;
    if (frameTimeMs <= r.limited) return _scores.frameTimeLimited.value;

    final degraded = r.degraded;
    if (degraded != null && frameTimeMs <= degraded) {
      return _scores.frameTimeDegraded.value;
    }

    return _scores.frameTimeMinimum.value;
  }

  // CPU usage scoring (lower is better)
  double _scoreCPU(double cpuPercent) {
    final r = _requirements.cpuUsagePercent; // TieredReq (has degraded)

    if (cpuPercent <= r.optimal) return _scores.cpuUsgOptimal.value;
    if (cpuPercent <= r.supported) return _scores.cpuUsgSupported.value;
    if (cpuPercent <= r.limited) return _scores.cpuUsgLimited.value;

    final degraded = r.degraded;
    if (degraded != null && cpuPercent <= degraded) {
      return _scores.cpuUsgDegraded.value;
    }

    return _scores.cpuUsgMinimum.value;
  }

  // Memory usage scoring (your input is KB; payload requirements are MB)
  double _scoreMemory(double memoryKb) {
    final memoryMb = memoryKb / 1024 / 1024; // KB -> MB
    final r = _requirements.memoryUsageMB; // TieredReq (likely no degraded)

    if (memoryMb <= r.optimal) return _scores.memoryUsgOptimal.value;
    if (memoryMb <= r.supported) return _scores.memoryUsgSupported.value;
    if (memoryMb <= r.limited) return _scores.memoryUsgLimited.value;

    // If you later add degraded for memory, this will automatically use it:
    // final degraded = r.degraded;
    // if (degraded != null && memoryMb <= degraded) {
    //   return _scores.i.value; // only if your score set has this
    // }

    return _scores.memoryUsgMinimum.value;
  }

  // Score a single benchmark step
  BenchmarkStepScore scoreStep(BenchmarkStepResult step) {
    final fpsScore = _scoreFPS(step.fps);
    final frameScore = _scoreFrameTime(step.frameTime);
    final cpuScore = _scoreCPU(step.cpuUsage);
    final memoryScore = _scoreMemory(step.memoryUsage);

    final totalScore =
        fpsScore * _weights.fpsWeight +
        frameScore * _weights.frameTimeWeight +
        cpuScore * _weights.cpuWeight +
        memoryScore * _weights.memoryWeight;

    return BenchmarkStepScore(
      stepType: step.type,
      fps: fpsScore,
      frameTime: frameScore,
      cpuUsage: cpuScore,
      memoryUsage: memoryScore,
      totalScore: totalScore,
    );
  }

  // Score all steps and compute overall score
  double scoreOverall(List<BenchmarkStepResult> results) {
    if (results.isEmpty) return 0;

    final total = results
        .map(scoreStep)
        .map((e) => e.totalScore)
        .whereType<double>()
        .fold<double>(0, (sum, v) => sum + v);

    return total / results.length;
  }
}

extension BenchmarkRating on double {
  String get rating {
    if (this >= 90) return "🔥 Excellent";
    if (this >= 75) return "✅ Good";
    if (this >= 60) return "⚠️ Fair";
    return "❌ Poor";
  }
}
