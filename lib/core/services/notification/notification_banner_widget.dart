// lib/core/services/notification/notification_banner_widget.dart
import 'package:flutter/material.dart';
import 'notification_state.dart';

class TopNotificationBanner extends StatefulWidget {
  final NotificationPayload payload;
  final VoidCallback onDismiss;

  const TopNotificationBanner({
    super.key,
    required this.payload,
    required this.onDismiss,
  });

  @override
  State<TopNotificationBanner> createState() => _TopNotificationBannerState();
}

class _TopNotificationBannerState extends State<TopNotificationBanner> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5), // Starts fully hidden off-screen above the app
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack, // Playful slide bounce effect matching modern UI specs
      reverseCurve: Curves.easeInCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 12, // Safely clears system notches
      left: 16,
      right: 16,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: widget.payload.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: widget.payload.borderColor, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.payload.icon, color: widget.payload.textColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.payload.title,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: widget.payload.textColor),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.payload.message,
                        style: TextStyle(fontSize: 13, color: widget.payload.textColor.withOpacity(0.85), height: 1.3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    await _animationController.reverse();
                    widget.onDismiss();
                  },
                  child: Icon(Icons.close_rounded, color: widget.payload.textColor.withOpacity(0.6), size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}