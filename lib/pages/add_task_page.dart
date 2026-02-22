import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  final Task? task;

  const AddTaskPage({super.key, this.task});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final deadlineController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descController.text = widget.task!.description;
      selectedDate = widget.task!.deadline;

      deadlineController.text = DateFormat(
        'dd MMM yyyy',
      ).format(widget.task!.deadline);
    }
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        deadlineController.text = DateFormat('dd MMM yyyy').format(picked);
      });
    }
  }

  void saveTask() {
    if (titleController.text.isEmpty) return;

    if (widget.task != null) {
      widget.task!.title = titleController.text;
      widget.task!.description = descController.text;
      widget.task!.deadline = selectedDate ?? DateTime.now();

      Navigator.pop(context);
    } else {
      final task = Task(
        title: titleController.text,
        description: descController.text,
        deadline: selectedDate ?? DateTime.now(),
      );

      Navigator.pop(context, task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Tambah Tugas" : "Edit Tugas"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              minLines: 4,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: deadlineController,
              readOnly: true,
              onTap: pickDate,
              decoration: const InputDecoration(
                labelText: "Deadline",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveTask,
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
