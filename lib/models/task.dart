class Task {
  String title;
  String description;
  DateTime deadline;
  bool archived;
  bool completed;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
    this.archived = false,
    this.completed = false,
  });
}
