import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_bundle.dart';
import 'package:app_compat_benchmark_core/src/defaults/device_and_os/requirements/device_and_os_requirements_set.dart';
import 'package:app_compat_benchmark_core/src/defaults/shared/default_value.dart';

class DeviceAndOsRequirementsDefaultBundle extends DefaultValue
    implements DeviceAndOsRequirementsSet {
  const DeviceAndOsRequirementsDefaultBundle._()
    : super(key: 'default', value: 0);

  static const defaults = DeviceAndOsRequirementsDefaultBundle._();

  @override
  DefaultValue get coreLimitedReq =>
      DeviceAndOsRequirementsDefaults.coreLimitedReq;

  @override
  DefaultValue get coreOptimalReq =>
      DeviceAndOsRequirementsDefaults.coreOptimalReq;

  @override
  DefaultValue get coreSupportedReq =>
      DeviceAndOsRequirementsDefaults.coreSupportedReq;

  @override
  DefaultValue get freqLimitedReq =>
      DeviceAndOsRequirementsDefaults.freqLimitedReq;

  @override
  DefaultValue get freqOptimalReq =>
      DeviceAndOsRequirementsDefaults.freqOptimalReq;

  @override
  DefaultValue get freqSupportedReq =>
      DeviceAndOsRequirementsDefaults.freqSupportedReq;

  @override
  DefaultValue get ramLimitedReq =>
      DeviceAndOsRequirementsDefaults.ramLimitedReq;

  @override
  DefaultValue get ramOptimalReq =>
      DeviceAndOsRequirementsDefaults.ramOptimalReq;

  @override
  DefaultValue get ramSupportedReq =>
      DeviceAndOsRequirementsDefaults.ramSupportedReq;

  @override
  DefaultValue get strgLimitedReq =>
      DeviceAndOsRequirementsDefaults.strgLimitedReq;

  @override
  DefaultValue get strgOptimalReq =>
      DeviceAndOsRequirementsDefaults.strgOptimalReq;

  @override
  DefaultValue get strgSupportedReq =>
      DeviceAndOsRequirementsDefaults.strgSupportedReq;

  @override
  DefaultValue get osVersion => DeviceAndOsRequirementsDefaults.osVersion;

  @override
  DefaultValue get archLimitedReq =>
      DeviceAndOsRequirementsDefaults.archOptimalReq;

  @override
  DefaultValue get archMinimumReq =>
      DeviceAndOsRequirementsDefaults.archSupportedReq;

  @override
  DefaultValue get archOptimalReq =>
      DeviceAndOsRequirementsDefaults.archLimitedReq;

  @override
  DefaultValue get archSupportedReq =>
      DeviceAndOsRequirementsDefaults.archMinimumReq;

  @override
  DefaultValue get deviceOsLimitedTotal =>
      DeviceAndOsRequirementsDefaults.deviceOsOptimalTotal;

  @override
  DefaultValue get deviceOsOptimalTotal =>
      DeviceAndOsRequirementsDefaults.deviceOsSupportedTotal;

  @override
  DefaultValue get deviceOsSupportedTotal =>
      DeviceAndOsRequirementsDefaults.deviceOsOptimalTotal;
}
