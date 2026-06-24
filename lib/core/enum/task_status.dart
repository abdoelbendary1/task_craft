enum TaskStatus {
  pending(1, 'Pending'),
  inProgress(2, 'In Progress'),
  done(3, 'Done');

  final int id;
  final String label;

  const TaskStatus(this.id, this.label);

  static TaskStatus fromId(int id) {
    return TaskStatus.values.firstWhere(
      (e) => e.id == id,
      orElse: () => TaskStatus.pending,
    );
  }
}
