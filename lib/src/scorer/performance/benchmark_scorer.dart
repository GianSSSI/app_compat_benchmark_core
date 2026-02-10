import 'package:app_compat_benchmark_core/src/defaults/performance/requirements/performance_requirements_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/requirements/performance_requirements_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/score/performance_score_defaults_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/score/performance_score_sets.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/performance/weights/performance_weights_set.dart';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_result.dart';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step_score.dart';

class BenchmarkScorer {
  final PerformanceRequirementsSet? performanceRequirements;
  final PerformanceScoreSet? performanceScore;
  final PerformanceWeightsSet? performanceWeights;

  BenchmarkScorer({
    this.performanceWeights,
    this.performanceScore,
    this.performanceRequirements,
  });

  PerformanceRequirementsSet get _requirements =>
      performanceRequirements ?? PerformanceRequirementsDefaultsBundle.defaults;

  PerformanceScoreSet get _scores =>
      performanceScore ?? PerformanceScoreDefaultsBundle.defaults;

  PerformanceWeightsSet get _weights =>
      performanceWeights ?? PerformanceWeightsDefaultBundle.defaults;
  // FPS scoring
  double _scoreFPS(double fps) {
    final req = _requirements;
    if (fps >= req.fpsOptimal.value) {
      return _scores.fpsOptimal.value;
    }
    if (fps >= _requirements.fpsSupported.value) {
      return _scores.fpsSupported.value;
    }
    if (fps >= _requirements.fpsLimited.value) {
      return _scores.fpsLimited.value;
    }
    if (fps >= _requirements.fpsLimited.value) {
      return _scores.fpsDegraded.value;
    }
    return _scores.fpsMinimum.value;
  }

  // Frame time scoring
  double _scoreFrameTime(double frameTimeMs) {
    if (frameTimeMs <= _requirements.frameTimeOptimal.value) {
      return _scores.frameTimeOptimal.value;
    }
    if (frameTimeMs <= _requirements.frameTimeSupported.value) {
      return _scores.frameTimeSupported.value;
    }
    if (frameTimeMs <= _requirements.frameTimeLimited.value) {
      return _scores.frameTimeLimited.value;
    }
    if (frameTimeMs <= _requirements.frameTimeDegraded.value) {
      return _scores.frameTimeDegraded.value;
    }
    return _scores.frameTimeMinimum.value;
  }

  // CPU usage scoring
  double _scoreCPU(double cpuPercent) {
    if (cpuPercent <= _requirements.cpuOptimal.value) {
      return _scores.cpuUsgOptimal.value;
    }
    if (cpuPercent <= _requirements.cpuSupported.value) {
      return _scores.cpuUsgSupported.value;
    }
    if (cpuPercent <= _requirements.cpuLimited.value) {
      return _scores.cpuUsgLimited.value;
    }
    if (cpuPercent <= _requirements.cpuDegraded.value) {
      return _scores.cpuUsgDegraded.value;
    }
    return _scores.cpuUsgMinimum.value;
  }

  // Memory usage scoring (in KB)
  double _scoreMemory(double memoryKb) {
    final memoryMb = memoryKb / 1024 / 1024;
    if (memoryMb <= _requirements.memoryOptimal.value) {
      return _scores.memoryUsgOptimal.value;
    }
    if (memoryMb <= _requirements.memorySupported.value) {
      return _scores.memoryUsgSupported.value;
    }
    if (memoryMb <= _requirements.memoryLimited.value) {
      return _scores.memoryUsgLimited.value;
    }
    return _scores.memoryUsgMinimum.value;
  }

  // Score a single benchmark step
  BenchmarkStepScore scoreStep(BenchmarkStepResult step) {
    final fpsScore = _scoreFPS(step.fps);
    final frameScore = _scoreFrameTime(step.frameTime);
    final cpuScore = _scoreCPU(step.cpuUsage);
    final memoryScore = _scoreMemory(step.memoryUsage);

    final totalScore =
        fpsScore * _weights.fpsWeight.value +
        frameScore * _weights.frameTimeWeight.value +
        cpuScore * _weights.cpuWeight.value +
        memoryScore * _weights.memoryWeight.value;

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
        .reduce((a, b) => a! + b!);
    return total! / results.length;
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
