import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/features/home/presentation/components/app_choice_chip.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final Function(String title, String priority) onTaskCreated;

  const AddTaskBottomSheet({super.key, required this.onTaskCreated});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _taskController = TextEditingController();
  String _selectedPriority = 'Medium';

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'What needs to be done?',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _taskController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Enter task description...',
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'PRIORITY',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: ['Low', 'Medium', 'High'].map((priority) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: AppChoiceChip<String>(
                    label: priority,
                    value: priority,
                    groupValue: _selectedPriority,
                    onChanged: (val) => setState(() => _selectedPriority = val),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 52.h),
                      side: BorderSide(color: theme.colorScheme.secondary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: theme.colorScheme.onSurface),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_taskController.text.trim().isNotEmpty) {
                        widget.onTaskCreated(
                          _taskController.text.trim(),
                          _selectedPriority,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Create Task'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
