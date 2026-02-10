enum DomainType { deviceAndOs, performance, featureSupport }

class OverallBenchmarkScore {
  final String result;
  final Map<String, String> interpretation;
  final double score;

  OverallBenchmarkScore({
    required this.interpretation,
    required this.score,
    required this.result,
  });
}
