class CpuArchitectureReq {
  final String optimal;
  final String supported;
  final String limited;
  final String minimum;

  const CpuArchitectureReq({
    required this.optimal,
    required this.supported,
    required this.limited,
    required this.minimum,
  });

  factory CpuArchitectureReq.fromJson(Map<String, dynamic> json) {
    return CpuArchitectureReq(
      optimal: (json['optimal'] ?? '').toString(),
      supported: (json['supported'] ?? '').toString(),
      limited: (json['limited'] ?? '').toString(),
      minimum: (json['minimum'] ?? '').toString(),
    );
  }
}
