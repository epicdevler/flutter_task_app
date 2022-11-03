class Task {
  final String title;
  final String description;
  bool isCompleted;
  final DateTime timeStamp;

  Task(this.title, this.description, this.timeStamp,
      {this.isCompleted = false});
}
