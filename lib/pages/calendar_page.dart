import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../data/task_store.dart';
import '../models/task.dart';
import 'task_detail_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  List<Task> getTasksForDay(DateTime day) {
    return TaskStore.tasks.where((task) {
      return task.deadline.year == day.year &&
          task.deadline.month == day.month &&
          task.deadline.day == day.day &&
          !task.archived;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTasks = selectedDay == null
        ? []
        : getTasksForDay(selectedDay!);

    return Scaffold(
      appBar: AppBar(title: const Text("Calendar")),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2100),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },

            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },

            eventLoader: (day) {
              return getTasksForDay(day);
            },

            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: selectedDay == null
                ? const Center(child: Text("Pilih tanggal"))
                : selectedTasks.isEmpty
                ? const Center(child: Text("Tidak ada tugas"))
                : ListView.builder(
                    itemCount: selectedTasks.length,
                    itemBuilder: (context, index) {
                      final task = selectedTasks[index];

                      return ListTile(
                        title: Text(task.title),
                        subtitle: Text(
                          "${task.deadline.day}/${task.deadline.month}/${task.deadline.year}",
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TaskDetailPage(task: task),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
