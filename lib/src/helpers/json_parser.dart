class JsonParser {
  static double? toDoubleOrNull(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v.trim());
    return null;
  }

  static double toDouble(dynamic v, {double? fallback}) {
    final d = toDoubleOrNull(v);
    if (d != null) return d;
    if (fallback != null) return fallback;
    throw FormatException('Expected double, got ${v.runtimeType}: $v');
  }

  static int? toIntOrNull(dynamic v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v.trim());
    return null;
  }

  static int toInt(dynamic v, {int? fallback}) {
    final i = toIntOrNull(v);
    if (i != null) return i;
    if (fallback != null) return fallback;
    throw FormatException('Expected int, got ${v.runtimeType}: $v');
  }

  static bool? toBoolOrNull(dynamic v) {
    if (v == null) return null;
    if (v is bool) return v;
    if (v is String) {
      final s = v.trim().toLowerCase();
      if (s == 'true') return true;
      if (s == 'false') return false;
    }
    return null;
  }

  static Map<String, dynamic>? toMap(dynamic v) {
    if (v is Map) return Map<String, dynamic>.from(v);
    return null;
  }
}
