abstract class DeviceAndOsWeightsSet {
  // cpuSubScores
  double get cpuSubArch;
  double get cpuSubCore;
  double get cpuSubFreq;

  // ramStorageSubScores
  double get ramSub;
  double get storageSub;

  // domainScores
  double get os;
  double get ramStorage;
  double get cpu;
}
