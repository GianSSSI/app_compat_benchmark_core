import 'dart:async';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_result.dart';
import 'package:app_compat_benchmark_core/src/models/performance/benchmark_step.dart';
import 'package:flutter/material.dart';
import 'package:flutter_perf_monitor/flutter_perf_monitor.dart';

class BenchmarkRunner {
  //single benchmark step
  Future<BenchmarkStepResult> runStep({
    required BenchmarkStepType step,
    required Future<void> Function() action,
    Duration sampleInterval = const Duration(milliseconds: 100),
  }) async {
    FlutterPerfMonitor.initialize();
    FlutterPerfMonitor.startMonitoring();

    final samples = <PerformanceMetrics>[];

    // Timer
    final timer = Timer.periodic(sampleInterval, (_) {
      samples.add(FlutterPerfMonitor.getCurrentMetrics());
    });

    await action();

    await Future.delayed(const Duration(milliseconds: 500));

    timer.cancel();
    FlutterPerfMonitor.stopMonitoring();

    // Compute averages
    double avgFps = 0;
    double avgCpu = 0;
    double avgMemory = 0;
    double avgFrameTime = 0;

    if (samples.isNotEmpty) {
      avgFps =
          samples.map((m) => m.fps).reduce((a, b) => a + b) / samples.length;
      avgCpu =
          samples.map((m) => m.cpuUsage).reduce((a, b) => a + b) /
          samples.length;
      avgMemory =
          samples.map((m) => m.memoryUsage).reduce((a, b) => a + b) /
          samples.length;
      avgFrameTime =
          samples.map((m) => m.frameTime).reduce((a, b) => a + b) /
          samples.length;
    }

    return BenchmarkStepResult(
      type: step,
      fps: avgFps,
      frameTime: avgFrameTime,
      cpuUsage: avgCpu,
      memoryUsage: avgMemory,
    );
  }

  Future<void> scrollTest(ScrollController controller) async {
    if (!controller.hasClients) return;

    final max = controller.position.maxScrollExtent;

    for (int i = 0; i < 4; i++) {
      await controller.animateTo(
        max,
        duration: const Duration(milliseconds: 700),
        curve: Curves.linear,
      );
      await controller.animateTo(
        0,
        duration: const Duration(milliseconds: 700),
        curve: Curves.linear,
      );
    }
  }

  Future<void> navigationTest(BuildContext context) async {
    for (int i = 0; i < 3; i++) {
      final route = MaterialPageRoute(builder: (_) => const _BenchmarkPage());
      Navigator.of(context).push(route);
      await Future.delayed(const Duration(milliseconds: 500)); // let it render
      Navigator.of(context).pop();
      await Future.delayed(const Duration(milliseconds: 250));
    }
  }

  Future<void> animationStressTest(
    BuildContext context,
    TickerProvider vsync,
  ) async {
    final completer = Completer<void>();
    late AnimationController controller;

    final overlay = OverlayEntry(
      builder: (_) {
        controller = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 900),
        )..repeat(reverse: true);

        final animation = CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        );

        int frames = 0;
        void listener() {
          frames++;
          if (frames >= 400) {
            // longer duration
            controller.removeListener(listener);
            controller.dispose();
            completer.complete();
          }
        }

        controller.addListener(listener);

        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(14, (index) {
              return AnimatedBuilder(
                animation: animation,
                builder: (_, __) {
                  // rotation angle, mixing directions
                  final angle = animation.value * 2 * 3.14159 * (index + 1.3);
                  final scaleFactor = 0.5 + 0.7 * animation.value; // pulsating
                  final opacity =
                      0.4 + 0.6 * (1 - (animation.value - 0.5).abs() * 2);
                  final size = 30.0 + index * 18;

                  return Transform.rotate(
                    angle: index.isEven ? angle : -angle * 1.4,
                    child: Transform.scale(
                      scale: scaleFactor,
                      child: Opacity(
                        opacity: opacity,
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors
                                    .primaries[(index * 3) %
                                        Colors.primaries.length]
                                    .withValues(alpha: 0.8),
                                Colors
                                    .accents[(index * 2) %
                                        Colors.accents.length]
                                    .withValues(alpha: 0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              index.isEven ? 12 : 24,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black..withValues(alpha: 0.3),
                                blurRadius: 8,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlay);
    await completer.future;
    overlay.remove();
  }
}

class _BenchmarkPage extends StatelessWidget {
  const _BenchmarkPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Route Screen"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero Image / Banner
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://picsum.photos/600/200',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Welcome Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome to the Benchmark Test",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Suspendisse varius enim in eros elementum tristique. "
                    "Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Image Card
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    'https://picsum.photos/600/250',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Grid of Mini Cards
          Row(
            children: [
              Expanded(
                child: Card(
                  color: Colors.blue.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Icon(Icons.speed, size: 40, color: Colors.blue),
                        SizedBox(height: 8),
                        Text("Performance", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  color: Colors.green.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Icon(Icons.device_hub, size: 40, color: Colors.green),
                        SizedBox(height: 8),
                        Text("Device Info", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Text Section
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Additional Information",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Integer posuere erat a ante venenatis dapibus posuere velit aliquet.",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
