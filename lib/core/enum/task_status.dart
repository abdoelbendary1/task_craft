// features/project_tasks/core/enum/task_status.dart
enum TaskStatus {
  pending(0, 'Pending'),
  inProgress(1, 'In Progress'),
  done(2, 'Done');

  final int id;
  final String label;
  const TaskStatus(this.id, this.label);

  factory TaskStatus.fromId(int id) {
    return TaskStatus.values.firstWhere((e) => e.id == id, orElse: () => TaskStatus.pending);
  }
}

// features/project_tasks/core/enum/task_priority.dart
enum TaskPriority {
  low(0, 'Low'),
  medium(1, 'Medium'),
  high(2, 'High');

  final int id;
  final String label;
  const TaskPriority(this.id, this.label);

  factory TaskPriority.fromId(int id) {
    return TaskPriority.values.firstWhere((e) => e.id == id, orElse: () => TaskPriority.medium);
  }
}