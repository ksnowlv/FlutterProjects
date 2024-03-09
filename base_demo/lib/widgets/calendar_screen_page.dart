import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreenPage extends StatefulWidget {
  const CalendarScreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  CalendarScreenPageState createState() => CalendarScreenPageState();
}

class CalendarScreenPageState extends State<CalendarScreenPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Selector'),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
