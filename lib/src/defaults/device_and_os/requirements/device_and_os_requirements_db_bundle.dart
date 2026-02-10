import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsRequirementsJsonBundle implements DeviceAndOsRequirementsSet {
  final Map<String, DefaultValue> _requirements;

  DeviceAndOsRequirementsJsonBundle._(this._requirements);

  factory DeviceAndOsRequirementsJsonBundle.fromJson(
    Map<String, dynamic> json,
  ) {
    final map = <String, DefaultValue>{};

    json.forEach((key, value) {
      map[key] = DefaultValue(key: key, value: (value as num).toDouble());
    });

    return DeviceAndOsRequirementsJsonBundle._(map);
  }
  DefaultValue _get(String key, DefaultValue fallback) =>
      _requirements[key] ?? fallback;

  @override
  DefaultValue get archLimitedReq =>
      _get('archLimitedReq', DeviceAndOsRequirementsDefaults.archLimitedReq);

  @override
  DefaultValue get archMinimumReq =>
      _get('archMinimumReq', DeviceAndOsRequirementsDefaults.archMinimumReq);

  @override
  DefaultValue get archOptimalReq =>
      _get('archOptimalReq', DeviceAndOsRequirementsDefaults.archOptimalReq);

  @override
  DefaultValue get archSupportedReq => _get(
    'archSupportedReq',
    DeviceAndOsRequirementsDefaults.archSupportedReq,
  );

  @override
  DefaultValue get coreLimitedReq =>
      _get('coreLimitedReq', DeviceAndOsRequirementsDefaults.coreLimitedReq);

  @override
  DefaultValue get coreOptimalReq =>
      _get('coreOptimalReq', DeviceAndOsRequirementsDefaults.coreOptimalReq);

  @override
  DefaultValue get coreSupportedReq => _get(
    'coreSupportedReq',
    DeviceAndOsRequirementsDefaults.coreSupportedReq,
  );

  @override
  DefaultValue get deviceOsLimitedTotal => _get(
    'deviceOsLimitedTotal',
    DeviceAndOsRequirementsDefaults.deviceOsLimitedTotal,
  );
  @override
  DefaultValue get deviceOsOptimalTotal => _get(
    'deviceOsOptimalTotal',
    DeviceAndOsRequirementsDefaults.deviceOsOptimalTotal,
  );

  @override
  DefaultValue get deviceOsSupportedTotal => _get(
    'deviceOsSupportedTotal',
    DeviceAndOsRequirementsDefaults.deviceOsSupportedTotal,
  );

  @override
  DefaultValue get freqLimitedReq =>
      _get('freqLimitedReq', DeviceAndOsRequirementsDefaults.freqLimitedReq);

  @override
  DefaultValue get freqOptimalReq =>
      _get('freqOptimalReq', DeviceAndOsRequirementsDefaults.freqOptimalReq);

  @override
  DefaultValue get freqSupportedReq => _get(
    'freqSupportedReq',
    DeviceAndOsRequirementsDefaults.freqSupportedReq,
  );

  @override
  DefaultValue get osVersion =>
      _get('osVersion', DeviceAndOsRequirementsDefaults.osVersion);

  @override
  DefaultValue get ramLimitedReq =>
      _get('ramLimitedReq', DeviceAndOsRequirementsDefaults.ramLimitedReq);

  @override
  DefaultValue get ramOptimalReq =>
      _get('ramOptimalReq', DeviceAndOsRequirementsDefaults.ramOptimalReq);

  @override
  DefaultValue get ramSupportedReq =>
      _get('ramSupportedReq', DeviceAndOsRequirementsDefaults.ramSupportedReq);

  @override
  DefaultValue get strgLimitedReq =>
      _get('strgLimitedReq', DeviceAndOsRequirementsDefaults.strgLimitedReq);

  @override
  DefaultValue get strgOptimalReq =>
      _get('strgOptimalReq', DeviceAndOsRequirementsDefaults.strgOptimalReq);

  @override
  DefaultValue get strgSupportedReq => _get(
    'strgSupportedReq',
    DeviceAndOsRequirementsDefaults.strgSupportedReq,
  );
}
