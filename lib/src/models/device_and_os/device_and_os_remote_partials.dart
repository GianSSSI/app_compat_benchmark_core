import 'package:app_compat_benchmark_core/src/helpers/json_parser.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_req.dart';
import 'package:app_compat_benchmark_core/src/models/shared/tiered_string_req.dart';

class DeviceAndOsRemotePartial {
  // requirements
  final int? osVersion;
  final TieredStringReq? cpuArchitecture;
  final TieredReq? cpuCores;
  final TieredReq? cpuFrequencyMHz;
  final TieredReq? ramGB;
  final TieredReq? storageGB;
  final TieredReq? thresholds;

  // weights
  final double? cpuSubArch;
  final double? cpuSubCore;
  final double? cpuSubFreq;
  final double? ramSub;
  final double? storageSub;
  final double? os;
  final double? ramStorage;
  final double? cpu;

  const DeviceAndOsRemotePartial({
    this.osVersion,
    this.cpuArchitecture,
    this.cpuCores,
    this.cpuFrequencyMHz,
    this.ramGB,
    this.storageGB,
    this.thresholds,
    this.cpuSubArch,
    this.cpuSubCore,
    this.cpuSubFreq,
    this.ramSub,
    this.storageSub,
    this.os,
    this.ramStorage,
    this.cpu,
  });

  factory DeviceAndOsRemotePartial.fromJson(
    Map<String, dynamic> deviceAndOsJson,
  ) {
    final weights = JsonParser.toMap(deviceAndOsJson['weights']);
    final req = JsonParser.toMap(deviceAndOsJson['requirements']);

    final cpuSub = weights == null
        ? null
        : JsonParser.toMap(weights['cpuSubScores']);
    final ramStorageSub = weights == null
        ? null
        : JsonParser.toMap(weights['ramStorageSubScores']);
    final domainScores = weights == null
        ? null
        : JsonParser.toMap(weights['domainScores']);

    TieredReq? tierReqFromReq(String k) {
      final m = req == null ? null : JsonParser.toMap(req[k]);
      if (m == null) return null;
      try {
        return TieredReq.fromJson(m);
      } catch (_) {
        return null;
      }
    }

    TieredStringReq? arch() {
      final m = req == null ? null : JsonParser.toMap(req['cpuArchitecture']);
      if (m == null) return null;
      try {
        return TieredStringReq.fromJson(m);
      } catch (_) {
        return null;
      }
    }

    TieredReq? thresholds() {
      final m = req == null ? null : JsonParser.toMap(req['thresholds']);
      if (m == null) return null;
      try {
        return TieredReq.fromJson(m);
      } catch (_) {
        return null;
      }
    }

    return DeviceAndOsRemotePartial(
      osVersion: req == null ? null : JsonParser.toIntOrNull(req['osVersion']),
      cpuArchitecture: arch(),
      cpuCores: tierReqFromReq('cpuCores'),
      cpuFrequencyMHz: tierReqFromReq('cpuFrequencyMHz'),
      ramGB: tierReqFromReq('ramGB'),
      storageGB: tierReqFromReq('storageGB'),
      thresholds: thresholds(),

      cpuSubArch: cpuSub == null
          ? null
          : JsonParser.toDoubleOrNull(cpuSub['cpuSubArch']),
      cpuSubCore: cpuSub == null
          ? null
          : JsonParser.toDoubleOrNull(cpuSub['cpuSubCore']),
      cpuSubFreq: cpuSub == null
          ? null
          : JsonParser.toDoubleOrNull(cpuSub['cpuSubFreq']),

      ramSub: ramStorageSub == null
          ? null
          : JsonParser.toDoubleOrNull(ramStorageSub['ramSub']),
      storageSub: ramStorageSub == null
          ? null
          : JsonParser.toDoubleOrNull(ramStorageSub['storageSub']),

      os: domainScores == null
          ? null
          : JsonParser.toDoubleOrNull(domainScores['os']),
      ramStorage: domainScores == null
          ? null
          : JsonParser.toDoubleOrNull(domainScores['ramStorage']),
      cpu: domainScores == null
          ? null
          : JsonParser.toDoubleOrNull(domainScores['cpu']),
    );
  }
}
