import 'package:app_compat_benchmark_core/src/models/shared/default_value.dart';

abstract class DeviceAndOsScoresSet {
  DefaultValue get osVersionCompatible;

  //device and OS
  DefaultValue get dosOptimal;
  DefaultValue get dosSupported;
  DefaultValue get dosLimited;
  DefaultValue get dosMinimum;

  // CPU - core
  DefaultValue get coreOptimal;
  DefaultValue get coreSupported;
  DefaultValue get coreLimited;
  DefaultValue get coreMinimum;

  //CPU - frequrency
  DefaultValue get freqOptimal;
  DefaultValue get freqSupported;
  DefaultValue get freqLimited;
  DefaultValue get freqMinimum;

  //RAM
  DefaultValue get ramOptimal;
  DefaultValue get ramSupported;
  DefaultValue get ramLimited;
  DefaultValue get ramMinimum;

  //Storage
  DefaultValue get strgOptimal;
  DefaultValue get strgSupported;
  DefaultValue get strgLimited;
  DefaultValue get strgMinimum;

  DefaultValue get incompatible;
}
