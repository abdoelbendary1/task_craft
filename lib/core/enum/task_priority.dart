enum TaskPriority {
  low(1, 'Low'),
  medium(2, 'Medium'),
  high(3, 'High');

  final int id;
  final String label;

  const TaskPriority(this.id, this.label);

  static TaskPriority fromId(int id) {
    return TaskPriority.values.firstWhere(
      (e) => e.id == id,
      orElse: () => TaskPriority.medium,
    );
  }
}
