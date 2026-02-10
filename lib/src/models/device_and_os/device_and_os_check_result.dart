enum DeviceAndOsCheckType {
  osVersion,
  cpuArchitecture,
  cpuCores,
  cpuFrequency,
  ram,
  storage,
}

enum DeviceAndOsCheckStatus { supported, limited, incompatible }

class DeviceAndOsCheckResult {
  final DeviceAndOsCheckType type;
  final DeviceAndOsCheckStatus status;
  final String message;
  final bool isHardBlocker;

  const DeviceAndOsCheckResult({
    required this.type,
    required this.status,
    required this.message,
    this.isHardBlocker = false,
  });
}
