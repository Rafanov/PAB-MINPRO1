import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import '../data/task_store.dart';
import 'add_task_page.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  bool isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final tasks = TaskStore.tasks.where((task) {
      return !task.archived && isSameDate(task.deadline, today);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Today")),
      body: tasks.isEmpty
          ? const Center(child: Text("Tidak ada tugas hari ini"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];

                return TaskCard(
                  task: task,
                  onDelete: () {
                    setState(() {
                      TaskStore.tasks.remove(task);
                    });
                  },
                  onEdit: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddTaskPage(task: task),
                      ),
                    );
                    setState(() {});
                  },
                  onArchive: () {
                    setState(() {
                      task.archived = true;
                    });
                  },
                );
              },
            ),
    );
  }
}
