import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

abstract class DeviceAndOsRequirementsSet {
  //os version
  DefaultValue get osVersion;

  //cpu arch
  DefaultValue get archOptimalReq;
  DefaultValue get archSupportedReq;
  DefaultValue get archLimitedReq;
  DefaultValue get archMinimumReq;

  //cpu sub categories - core
  DefaultValue get coreOptimalReq;
  DefaultValue get coreSupportedReq;
  DefaultValue get coreLimitedReq;

  //cpu sub categories - frequency
  DefaultValue get freqOptimalReq;
  DefaultValue get freqSupportedReq;
  DefaultValue get freqLimitedReq;

  //ram and storage sub category - ram
  DefaultValue get ramOptimalReq;
  DefaultValue get ramSupportedReq;
  DefaultValue get ramLimitedReq;

  //ram and storage sub category - storage in GB
  DefaultValue get strgOptimalReq;
  DefaultValue get strgSupportedReq;
  DefaultValue get strgLimitedReq;

  //total device and os scores
  DefaultValue get deviceOsOptimalTotal;
  DefaultValue get deviceOsSupportedTotal;
  DefaultValue get deviceOsLimitedTotal;
}
