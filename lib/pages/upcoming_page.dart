import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import '../data/task_store.dart';
import 'add_task_page.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({super.key});

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final tasks = TaskStore.tasks.where((task) {
      return !task.archived && task.deadline.isAfter(today);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Upcoming")),
      body: tasks.isEmpty
          ? const Center(child: Text("Tidak ada tugas mendatang"))
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
