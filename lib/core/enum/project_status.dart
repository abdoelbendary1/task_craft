enum ProjectStatus {
  pending(1, 'Pending'),
  inProgress(2, 'In Progress'),
  done(3, 'Done');

  // 🟢 Maps explicitly to your Supabase DB ID values
  final int id;
  final String label;

  const ProjectStatus(this.id, this.label);

  // Helper to convert database integer IDs directly into type-safe Enums
  static ProjectStatus fromId(int id) {
    return ProjectStatus.values.firstWhere(
      (e) => e.id == id,
      orElse: () => ProjectStatus.pending,
    );
  }
}