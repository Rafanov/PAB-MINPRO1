import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../data/task_store.dart';
import 'add_task_page.dart';
import 'task_detail_page.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  String searchQuery = "";

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = TaskStore.tasks
        .where((t) => !t.archived)
        .where(
          (task) =>
              task.title.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inbox"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari tugas...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TaskDetailPage(task: task)),
              );
              refresh();
            },
            child: TaskCard(
              task: task,
              onDelete: () {
                TaskStore.tasks.remove(task);
                refresh();
              },
              onEdit: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddTaskPage(task: task)),
                );
                refresh();
              },
              onArchive: () {
                task.archived = true;
                refresh();
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskPage()),
          );

          if (result != null) {
            TaskStore.tasks.add(result);
            refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
