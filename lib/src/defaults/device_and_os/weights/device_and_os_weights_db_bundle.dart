import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_and_os_weights_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/weights/device_os_weights_default.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsDbWeightsJsonBundle implements DeviceAndOsWeightsSet {
  final Map<String, DefaultValue> _weights;

  DeviceAndOsDbWeightsJsonBundle._(this._weights);

  factory DeviceAndOsDbWeightsJsonBundle.fromJson(Map<String, dynamic> json) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return DeviceAndOsDbWeightsJsonBundle._(map);
  }

  DefaultValue _get(String key, DefaultValue fallback) =>
      _weights[key] ?? fallback;

  // ---------- CPU ----------
  @override
  DefaultValue get cpuSubArch =>
      _get('cpuSubArch', DeviceAndOsWeightsDefault.cpuSubArch);

  @override
  DefaultValue get cpuSubCore =>
      _get('cpuSubCore', DeviceAndOsWeightsDefault.cpuSubCore);

  @override
  DefaultValue get cpuSubFreq =>
      _get('cpuSubFreq', DeviceAndOsWeightsDefault.cpuSubFreq);

  // ---------- RAM / STORAGE ----------
  @override
  DefaultValue get ramSub => _get('ramSub', DeviceAndOsWeightsDefault.ramSub);

  @override
  DefaultValue get storageSub =>
      _get('storageSub', DeviceAndOsWeightsDefault.storageSub);

  // ---------- DOMAIN ----------
  @override
  DefaultValue get os => _get('os', DeviceAndOsWeightsDefault.os);

  @override
  DefaultValue get ramStorage =>
      _get('ramStorage', DeviceAndOsWeightsDefault.ramStorage);

  @override
  DefaultValue get cpu => _get('cpu', DeviceAndOsWeightsDefault.cpu);
}
