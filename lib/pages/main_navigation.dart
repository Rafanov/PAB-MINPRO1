import 'package:flutter/material.dart';
import 'inbox_page.dart';
import 'today_page.dart';
import 'upcoming_page.dart';
import 'calendar_page.dart';
import 'archive_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final pages = const [
    InboxPage(),
    TodayPage(),
    UpcomingPage(),
    CalendarPage(),
    ArchivePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.inbox_outlined),
            label: "Inbox",
          ),
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            label: "Today",
          ),
          NavigationDestination(
            icon: Icon(Icons.upcoming_outlined),
            label: "Upcoming",
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          NavigationDestination(
            icon: Icon(Icons.archive_outlined),
            label: "Archive",
          ),
        ],
      ),
    );
  }
}
