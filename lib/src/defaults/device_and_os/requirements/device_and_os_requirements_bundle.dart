import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsRequirementsDefaults {
  //osVersion
  static const osVersion = DefaultValue(key: "osVersion", value: 11);

  //cpu arch
  static const archOptimalReq = DefaultValue(
    key: "archOptimalReq",
    value: 'arm64',
  );
  static const archSupportedReq = DefaultValue(
    key: "archSupportedReq",
    value: 'arm64-v8a',
  );
  static const archLimitedReq = DefaultValue(
    key: "archLimitedReq",
    value: 'x86_64',
  );
  static const archMinimumReq = DefaultValue(
    key: "archMinimumReq",
    value: 'armeabi-v7a',
  );

  //cpu sub categories - core
  static const coreOptimalReq = DefaultValue(key: "coreOptimalReq", value: 8);
  static const coreSupportedReq = DefaultValue(
    key: "coreSupportedReq",
    value: 6,
  );
  static const coreLimitedReq = DefaultValue(key: "coreLimitedReq", value: 4);

  //cpu sub categories - frequency
  static const freqOptimalReq = DefaultValue(
    key: "freqOptimalReq",
    value: 2200,
  );
  static const freqSupportedReq = DefaultValue(
    key: "freqSupportedReq",
    value: 1800,
  );
  static const freqLimitedReq = DefaultValue(
    key: "freqLimitedReq",
    value: 1400,
  );

  //ram and storage sub category - ram
  static const ramOptimalReq = DefaultValue(key: "ramOptimalReq", value: 2);
  static const ramSupportedReq = DefaultValue(key: "ramSupportedReq", value: 1);
  static const ramLimitedReq = DefaultValue(key: "ramLimitedReq", value: 0.5);

  //ram and storage sub category - storage in GB
  static const strgOptimalReq = DefaultValue(key: "strgOptimalReq", value: 10);
  static const strgSupportedReq = DefaultValue(
    key: "strgSupportedReq",
    value: 5,
  );
  static const strgLimitedReq = DefaultValue(key: "strgLimitedReq", value: 2);

  //total domain score threshold
  static const deviceOsOptimalTotal = DefaultValue(
    key: "deviceOsOptimalTotal",
    value: 90,
  );
  static const deviceOsSupportedTotal = DefaultValue(
    key: "deviceOsSupportedTotal",
    value: 85,
  );
  static const deviceOsLimitedTotal = DefaultValue(
    key: "deviceOsLimitedTotal",
    value: 60,
  );
}
