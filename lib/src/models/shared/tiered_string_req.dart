class TieredStringReq {
  final String optimal;
  final String supported;
  final String limited;
  final String minimum;

  const TieredStringReq({
    required this.optimal,
    required this.supported,
    required this.limited,
    required this.minimum,
  });

  factory TieredStringReq.fromJson(Map<String, dynamic> json) {
    final o = json['optimal'];
    final s = json['supported'];
    final l = json['limited'];
    final m = json['minimum'];
    if (o == null || s == null || l == null || m == null) {
      throw const FormatException(
        'TieredStringReq requires optimal/supported/limited/minimum',
      );
    }
    return TieredStringReq(
      optimal: o.toString(),
      supported: s.toString(),
      limited: l.toString(),
      minimum: m.toString(),
    );
  }
}
