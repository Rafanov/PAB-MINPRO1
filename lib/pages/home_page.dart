import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import '../data/task_store.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = TaskStore.tasks.where((task) {
      return !task.archived &&
          task.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

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
      body: tasks.isEmpty
          ? const Center(child: Text("Belum ada tugas"))
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
                    refresh();
                  },
                  onArchive: () {
                    setState(() {
                      task.archived = true;
                    });
                  },
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
            setState(() {
              TaskStore.tasks.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
