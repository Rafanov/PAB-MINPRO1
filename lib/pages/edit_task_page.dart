import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class EditTaskPage extends StatefulWidget {
  final Task task;

  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController deadlineController;

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.task.title);
    descController = TextEditingController(text: widget.task.description);

    selectedDate = widget.task.deadline;

    deadlineController = TextEditingController(
      text: DateFormat('dd MMM yyyy').format(widget.task.deadline),
    );
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

  void save() {
    widget.task.title = titleController.text;
    widget.task.description = descController.text;
    widget.task.deadline = selectedDate ?? DateTime.now();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Tugas")),
      body: Padding(
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
              minLines: 3,
              maxLines: 5,
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
                onPressed: save,
                child: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
