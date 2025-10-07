/// domain entity representing a habit
class Habit {
  const Habit({
    required this.id,
    required this.title,
    required this.completed,
    required this.dueDate,
  });

  final String id;
  final String title;
  final bool completed;
  final DateTime dueDate;

  Habit copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? dueDate,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Habit &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          completed == other.completed &&
          dueDate == other.dueDate;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ completed.hashCode ^ dueDate.hashCode;

  @override
  String toString() {
    return 'Habit(id: $id, title: $title, completed: $completed, dueDate: $dueDate)';
  }
}
