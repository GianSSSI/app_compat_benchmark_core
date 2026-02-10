import 'package:app_compat_benchmark_core/src/models/device_and_os/device_and_os_check_result.dart';

class DeviceAndOsDomainScore {
  final double domainScore;

  /// Sub-scores (useful for UI / debugging)
  final double osScore;
  final double cpuScore;
  final double ramStorageScore;

  //results

  final List<DeviceAndOsCheckResult> results;

  /// Hard-fail compatibility flag
  final bool incompatible;

  DeviceAndOsDomainScore({
    required this.domainScore,
    required this.osScore,
    required this.cpuScore,
    required this.ramStorageScore,
    required this.incompatible,
    this.results = const [],
  });
}
