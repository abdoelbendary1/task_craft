// lib/core/presentation/widgets/connectivity_overlay_wrapper.dart
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectivityOverlayWrapper extends StatelessWidget {
  final Widget child;
  const ConnectivityOverlayWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        child, // Displays the actual requested screen underneath
        StreamBuilder<List<ConnectivityResult>>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final results = snapshot.data ?? [];
            if (results.contains(ConnectivityResult.none)) {
              return Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  child: Container(
                    color: theme.colorScheme.error, // Production error red tint
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    alignment: Alignment.topCenter,
                    child: const Text(
                      'Offline mode • Changes will sync later',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink(); // Automatically disappears when connection is restored
          },
        ),
      ],
    );
  }
}
