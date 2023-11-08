import 'package:animtaions_ba/constants/text_styles.dart';
import 'package:animtaions_ba/model/task_preset.dart';
import 'package:animtaions_ba/theming/app_theme.dart';
import 'package:animtaions_ba/ui/task/animated_task.dart';
import 'package:flutter/material.dart';

class TaskWithName extends StatelessWidget {
  const TaskWithName({super.key, required this.task});
  final TaskPreset task;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedTask(iconName: task.iconName),
        SizedBox(
          height: 8.0,
        ),
        Text(
          task.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyles.taskName.copyWith(
            color: AppTheme.of(context).accent,
          ),
        )
      ],
    );
  }
}
