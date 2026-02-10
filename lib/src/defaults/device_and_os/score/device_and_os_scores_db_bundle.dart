import 'package:app_compat_benchmark_core/src/defaults/device_and_os/score/device_and_os_scores_defaults.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/score/device_and_os_scores_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsScoresJsonBundle implements DeviceAndOsScoresSet {
  final Map<String, DefaultValue> _scores;

  DeviceAndOsScoresJsonBundle._(this._scores);

  factory DeviceAndOsScoresJsonBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return DeviceAndOsScoresJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _scores[key] ?? fallback;

  @override
  DefaultValue get coreLimited =>
      _get('cpuSubArch', DeviceAndOsScoreDefaults.coreLimited);

  @override
  DefaultValue get coreMinimum =>
      _get('coreMinimum', DeviceAndOsScoreDefaults.coreMinimum);

  @override
  DefaultValue get coreOptimal =>
      _get('coreOptimal', DeviceAndOsScoreDefaults.coreOptimal);

  @override
  DefaultValue get coreSupported =>
      _get('coreSupported', DeviceAndOsScoreDefaults.coreSupported);

  @override
  DefaultValue get dosLimited =>
      _get('dosLimited', DeviceAndOsScoreDefaults.dosLimited);

  @override
  DefaultValue get dosMinimum =>
      _get('dosMinimum', DeviceAndOsScoreDefaults.dosMinimum);

  @override
  DefaultValue get dosOptimal =>
      _get('dosOptimal', DeviceAndOsScoreDefaults.dosOptimal);

  @override
  DefaultValue get dosSupported => throw UnimplementedError();

  @override
  DefaultValue get freqLimited =>
      _get('freqLimited', DeviceAndOsScoreDefaults.freqLimited);

  @override
  DefaultValue get freqMinimum =>
      _get('freqMinimum', DeviceAndOsScoreDefaults.freqMinimum);

  @override
  DefaultValue get freqOptimal =>
      _get('freqOptimal', DeviceAndOsScoreDefaults.freqOptimal);
  @override
  DefaultValue get freqSupported =>
      _get('freqSupported', DeviceAndOsScoreDefaults.freqSupported);

  @override
  DefaultValue get incompatible =>
      _get('incompatible', DeviceAndOsScoreDefaults.incompatible);

  @override
  DefaultValue get osVersionCompatible =>
      _get('osVersionCompatible', DeviceAndOsScoreDefaults.osVersionCompatible);

  @override
  DefaultValue get ramLimited =>
      _get('ramLimited', DeviceAndOsScoreDefaults.ramLimited);

  @override
  DefaultValue get ramMinimum =>
      _get('ramMinimum', DeviceAndOsScoreDefaults.ramMinimum);

  @override
  DefaultValue get ramOptimal =>
      _get('ramOptimal', DeviceAndOsScoreDefaults.ramOptimal);

  @override
  DefaultValue get ramSupported =>
      _get('ramSupported', DeviceAndOsScoreDefaults.ramSupported);

  @override
  DefaultValue get strgLimited =>
      _get('strgLimited', DeviceAndOsScoreDefaults.strgLimited);

  @override
  DefaultValue get strgMinimum =>
      _get('strgMinimum', DeviceAndOsScoreDefaults.strgMinimum);

  @override
  DefaultValue get strgOptimal =>
      _get('strgOptimal', DeviceAndOsScoreDefaults.strgOptimal);

  @override
  DefaultValue get strgSupported =>
      _get('strgSupported', DeviceAndOsScoreDefaults.strgSupported);
}
