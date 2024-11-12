import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DebuggerWrapper extends StatelessWidget {
  final Widget child;

  const DebuggerWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    void onDebugDb() {
      context.push(PAGES.driftDebug.path);
    }

    return Stack(
      children: [
        child,
        Positioned(
          bottom: 16,
          left: 16,
          child: FloatingActionButton(
            heroTag: 'Debug fab',
            backgroundColor: Colors.red,
            onPressed: onDebugDb,
            child: const Icon(Icons.bug_report),
          ),
        ),
      ],
    );
    // return Scaffold(
    //   floatingActionButton: FloatingActionButton(
    //     backgroundColor: Colors.red,
    //     onPressed: onDebugDb,
    //     child: const Icon(Icons.bug_report),
    //   ),
    //   body: child,
    // );
  }
}
