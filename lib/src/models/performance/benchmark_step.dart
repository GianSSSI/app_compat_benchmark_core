enum BenchmarkStepType { idle, scroll, navigation, animation }

class BenchmarkStep {
  final BenchmarkStepType type;
  final String label;

  const BenchmarkStep(this.type, this.label);
}
