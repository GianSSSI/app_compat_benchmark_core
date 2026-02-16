import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

class DeviceAndOsScoreDefaults {
  static const osVersionCompatible = DefaultValue(
    key: 'osVersionCompatible',
    value: 100.0,
  );

  //device and OS
  static const dosOptimal = DefaultValue(key: 'dosOptimal', value: 100.0);
  static const dosSupported = DefaultValue(key: 'dosSupported', value: 80.0);
  static const dosLimited = DefaultValue(key: 'dosLimited', value: 60.0);
  static const dosMinimum = DefaultValue(key: 'dosMinimum', value: 40.0);

  // CPU - core
  static const coreOptimal = DefaultValue(key: 'coreOptimal', value: 100.0);
  static const coreSupported = DefaultValue(key: 'coreSupported', value: 85.0);
  static const coreLimited = DefaultValue(key: 'coreLimited', value: 70.0);
  static const coreMinimum = DefaultValue(key: 'coreMinimum', value: 40.0);

  //CPU - frequrency
  static const freqOptimal = DefaultValue(key: 'freqOptimal', value: 100.0);
  static const freqSupported = DefaultValue(key: 'freqSupported', value: 80.0);
  static const freqLimited = DefaultValue(key: 'freqLimited', value: 70.0);
  static const freqMinimum = DefaultValue(key: 'freqMinimum', value: 40.0);

  //RAM
  static const ramOptimal = DefaultValue(key: 'ramOptimal', value: 100.0);
  static const ramSupported = DefaultValue(key: 'ramSupported', value: 70.0);
  static const ramLimited = DefaultValue(key: 'ramLimited', value: 40.0);
  static const ramMinimum = DefaultValue(key: 'ramMinimum', value: 20.0);

  //Storage
  static const strgOptimal = DefaultValue(key: 'strgOptimal', value: 100.0);
  static const strgSupported = DefaultValue(key: 'strgSupported', value: 80.0);
  static const strgLimited = DefaultValue(key: 'strgLimited', value: 50.0);
  static const strgMinimum = DefaultValue(key: 'strgMinimum', value: 20.0);

  static const incompatible = DefaultValue(key: 'incompatible', value: -1.0);

  static const List<DefaultValue> all = [
    osVersionCompatible,
    dosOptimal,
    dosSupported,
    dosLimited,
    dosMinimum,
    incompatible,
  ];
}
