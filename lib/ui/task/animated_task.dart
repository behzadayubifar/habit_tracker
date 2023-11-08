import 'package:animtaions_ba/constants/app_assets.dart';
import 'package:animtaions_ba/ui/task/task_completion_ring.dart';
import 'package:animtaions_ba/theming/app_theme.dart';
import 'package:animtaions_ba/ui/common_widgets/centered_svg_icon.dart';
import 'package:flutter/material.dart';

class AnimatedTask extends StatefulWidget {
  const AnimatedTask({super.key, required this.iconName});
  final String iconName;

  @override
  State<AnimatedTask> createState() => _AnimatedTaskState();
}

class _AnimatedTaskState extends State<AnimatedTask>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curveAnimation;
  bool _showCheckIcon = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _animationController.addStatusListener(_checkStatusUpdates);
    _curveAnimation = _animationController.drive(
      CurveTween(curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    // _animationController.removeStatusListener((status) {});
    _animationController.dispose();
    super.dispose();
  }

  void _checkStatusUpdates(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (mounted) {
        setState(() => _showCheckIcon = true);
      }
      if (mounted) {
        Future.delayed(Duration(seconds: 1), () {
          setState(() => _showCheckIcon = false);
        });
      }
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.forward();
    } else if (!_showCheckIcon) {
      _animationController.value = 0.0;
    }
  }

  void _handleTapCancel() {
    if (_animationController.status != AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTapUp: (_) => _handleTapCancel(),
      child: AnimatedBuilder(
        animation: _curveAnimation,
        builder: (context, child) {
          final themeData = AppTheme.of(context);
          final progress = _curveAnimation.value;
          final hasCompleted = progress == 1.0;
          final iconColor =
              hasCompleted ? themeData.accentNegative : themeData.taskIcon;
          return SizedBox(
            height: 160,
            child: Stack(
              children: [
                TaskCompletionRing(
                  progress: _curveAnimation.value,
                ),
                // Positioned.fill(child: Text("COMPLETED !!!")),
                Positioned.fill(
                  child: CenteredSvgIcon(
                    iconName: hasCompleted && _showCheckIcon
                        ? AppAssets.check
                        : widget.iconName,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
