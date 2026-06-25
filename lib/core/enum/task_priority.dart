enum Priorities {
  low(0, 'Low'),
  medium(1, 'Medium'),
  high(2, 'High');

  final int id;
  final String label;

  const Priorities(this.id, this.label);

  static Priorities fromId(int id) {
    return Priorities.values.firstWhere(
      (e) => e.id == id,
      orElse: () => Priorities.medium,
    );
  }
}
