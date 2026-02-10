class InternetCheckResult {
  final bool isConnected;
  final String networkType;
  final double downloadSpeedMbps;
  final double uploadSpeedMbps;

  InternetCheckResult({
    required this.isConnected,
    required this.networkType,
    required this.downloadSpeedMbps,
    required this.uploadSpeedMbps,
  });

  @override
  String toString() {
    return 'InternetCheckResult(isConnected: $isConnected, '
        'networkType: $networkType, '
        'downloadSpeedMbps: ${downloadSpeedMbps}, '
        'uploadSpeedMbps: ${uploadSpeedMbps})';
  }
}
