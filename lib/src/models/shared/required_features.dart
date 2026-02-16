import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';

class RequiredFeatures {
  final bool gps;
  final bool location;
  final bool camera;
  final bool nfc;

  const RequiredFeatures({
    required this.gps,
    required this.location,
    required this.camera,
    required this.nfc,
  });

  factory RequiredFeatures.fromJson(Map<String, dynamic> json) {
    bool b(String k, bool fallback) =>
        JsonParser.toBoolOrNull(json[k]) ?? fallback;

    return RequiredFeatures(
      gps: b('gps', false),
      location: b('location', false),
      camera: b('camera', false),
      nfc: b('nfc', false),
    );
  }
}
