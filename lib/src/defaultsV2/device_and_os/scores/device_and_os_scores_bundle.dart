import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/scores/device_and_os_scores_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaultsV2/device_and_os/scores/device_and_os_scores_set.dart';
import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

class DeviceAndOsScoresDefaultBundle extends DefaultValue
    implements DeviceAndOsScoresSet {
  const DeviceAndOsScoresDefaultBundle._() : super(key: 'default', value: 0.0);

  static const defaults = DeviceAndOsScoresDefaultBundle._();

  // ---------- CORE ----------
  @override
  DefaultValue get coreOptimal => DeviceAndOsScoreDefaults.coreOptimal;

  @override
  DefaultValue get coreSupported => DeviceAndOsScoreDefaults.coreSupported;

  @override
  DefaultValue get coreLimited => DeviceAndOsScoreDefaults.coreLimited;

  @override
  DefaultValue get coreMinimum => DeviceAndOsScoreDefaults.coreMinimum;

  // ---------- DOS ----------
  @override
  DefaultValue get dosOptimal => DeviceAndOsScoreDefaults.dosOptimal;

  @override
  DefaultValue get dosSupported => DeviceAndOsScoreDefaults.dosSupported;

  @override
  DefaultValue get dosLimited => DeviceAndOsScoreDefaults.dosLimited;

  @override
  DefaultValue get dosMinimum => DeviceAndOsScoreDefaults.dosMinimum;

  // ---------- FREQUENCY ----------
  @override
  DefaultValue get freqOptimal => DeviceAndOsScoreDefaults.freqOptimal;

  @override
  DefaultValue get freqSupported => DeviceAndOsScoreDefaults.freqSupported;

  @override
  DefaultValue get freqLimited => DeviceAndOsScoreDefaults.freqLimited;

  @override
  DefaultValue get freqMinimum => DeviceAndOsScoreDefaults.freqMinimum;

  // ---------- RAM ----------
  @override
  DefaultValue get ramOptimal => DeviceAndOsScoreDefaults.ramOptimal;

  @override
  DefaultValue get ramSupported => DeviceAndOsScoreDefaults.ramSupported;

  @override
  DefaultValue get ramLimited => DeviceAndOsScoreDefaults.ramLimited;

  @override
  DefaultValue get ramMinimum => DeviceAndOsScoreDefaults.ramMinimum;

  // ---------- STORAGE ----------
  @override
  DefaultValue get strgOptimal => DeviceAndOsScoreDefaults.strgOptimal;

  @override
  DefaultValue get strgSupported => DeviceAndOsScoreDefaults.strgSupported;

  @override
  DefaultValue get strgLimited => DeviceAndOsScoreDefaults.strgLimited;

  @override
  DefaultValue get strgMinimum => DeviceAndOsScoreDefaults.strgMinimum;

  // ---------- OTHER ----------
  @override
  DefaultValue get incompatible => DeviceAndOsScoreDefaults.incompatible;

  @override
  DefaultValue get osVersionCompatible =>
      DeviceAndOsScoreDefaults.osVersionCompatible;
}
