import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';

class TieredReq {
  final double optimal;
  final double supported;
  final double limited;
  final double? degraded; // optional (performance)
  final double? minimum; // optional

  const TieredReq({
    required this.optimal,
    required this.supported,
    required this.limited,
    this.degraded,
    this.minimum,
  });

  factory TieredReq.fromJson(Map<String, dynamic> json) => TieredReq(
    optimal: JsonParser.toDouble(json['optimal']),
    supported: JsonParser.toDouble(json['supported']),
    limited: JsonParser.toDouble(json['limited']),
    degraded: JsonParser.toDoubleOrNull(json['degraded']),
    minimum: JsonParser.toDoubleOrNull(json['minimum']),
  );
}
