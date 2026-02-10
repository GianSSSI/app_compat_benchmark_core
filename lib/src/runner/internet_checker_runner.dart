import 'package:app_compat_benchmark_core/src/models/internet_checker/internet_check_result.dart';
import 'package:network_speed/network_speed.dart';

class InternetCheckerRunner {
  Future<InternetCheckResult> checkCConnectivity() async {
    Map<String, dynamic> networkInfo =
        await NetworkSpeed.getCurrentNetworkSpeed();

    return InternetCheckResult(
      isConnected: true,
      networkType: networkInfo['networkType'],
      downloadSpeedMbps: networkInfo['downloadSpeed'],
      uploadSpeedMbps: networkInfo['uploadSpeed'],
    );
  }
}
