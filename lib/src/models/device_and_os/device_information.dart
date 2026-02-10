class DeviceInformation {
  final String deviceName;
  final String manufacturer;
  final String model;
  final String brand;

  final String operatingSystem;
  final String systemVersion;
  final String buildNumber;

  final String cpuArchitecture;
  final int cpuCores;
  final double cpuFrequencyMhz;

  final int totalRamMb;
  final int availableRamMb;

  final int totalMemoryMb;
  final int availableMemoryMb;

  DeviceInformation({
    required this.deviceName,
    required this.manufacturer,
    required this.model,
    required this.brand,
    required this.operatingSystem,
    required this.systemVersion,
    required this.buildNumber,
    required this.cpuArchitecture,
    required this.cpuCores,
    required this.cpuFrequencyMhz,
    required this.totalRamMb,
    required this.availableRamMb,
    required this.totalMemoryMb,
    required this.availableMemoryMb,
  });
}
