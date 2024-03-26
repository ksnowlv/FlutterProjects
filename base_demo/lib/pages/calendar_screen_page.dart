import 'package:base_demo/common/logger.dart';
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
            XLogger.getLogger().d('您选择的日期:$_selectedDay, 当前焦点日期:$_focusedDay');
          });
        },
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
            XLogger.getLogger().d('当前日历格式:$_calendarFormat');
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
           XLogger.getLogger().d('当前焦点日期:$_focusedDay');
        },
      ),
    );
  }
}
