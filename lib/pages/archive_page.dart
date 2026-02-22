import 'package:flutter/material.dart';
import '../data/task_store.dart';
import '../widgets/task_card.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = TaskStore.tasks.where((t) => t.archived).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Archive")),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return TaskCard(
            task: task,
            onDelete: () {
              TaskStore.tasks.remove(task);
              refresh();
            },
            onEdit: () {},
            onArchive: () {
              task.archived = false;
              refresh();
            },
          );
        },
      ),
    );
  }
}
