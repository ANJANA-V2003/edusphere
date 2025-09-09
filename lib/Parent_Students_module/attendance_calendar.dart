import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendance_Calendar extends StatefulWidget {
  const Attendance_Calendar({super.key});

  @override
  State<Attendance_Calendar> createState() => _Attendance_CalendarState();
}

class _Attendance_CalendarState extends State<Attendance_Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, String> attendance = {
    DateTime.utc(2024, 7, 1): 'absent',
    DateTime.utc(2024, 7, 5): 'present',
    DateTime.utc(2024, 7, 10): 'absent',
    DateTime.utc(2024, 7, 16): 'absent',
    DateTime.utc(2024, 7, 17): 'present',
    DateTime.utc(2024, 7, 18): 'present',
    DateTime.utc(2024, 7, 26): 'absent',
    DateTime.utc(2024, 7, 29): 'present',
    DateTime.utc(2024, 7, 30): 'present',
    DateTime.utc(2024, 7, 31): 'absent',
  };

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    int getWorkingDaysOfMonth(DateTime date) {
      int workingDays = 0;
      DateTime firstDay = DateTime(date.year, date.month, 1);
      DateTime lastDay = DateTime(date.year, date.month + 1, 0);
      for (DateTime day = firstDay;
          day.isBefore(lastDay.add(Duration(days: 1)));
          day = day.add(Duration(days: 1))) {
        // Monday =1 , Sunday =7
        if(day.weekday!=DateTime.saturday&& day.weekday!= DateTime.sunday)
          {
            workingDays ++;
          }
      }
      return workingDays;
    }

    final totalDays = getWorkingDaysOfMonth(_focusedDay);
    final presentDays = attendance.values.where((v) => v == 'present').length;
    final absentDays = attendance.values.where((v) => v == 'absent').length;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) =>
                    _isSameDay(_selectedDay ?? DateTime.now(), day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final status =
                        attendance[DateTime.utc(day.year, day.month, day.day)];
                    if (status == 'present') {
                      return _buildCell(day, Colors.green);
                    } else if (status == 'absent') {
                      return _buildCell(day, Colors.red);
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildStatCard("Total working days", totalDays, Color(0xff0B99A0)),
            _buildStatCard("Total present", presentDays, Color(0xff18CA39)),
            _buildStatCard("Total absent", absentDays, Color(0xffE11818)),
          ],
        ),
      ),
    );
  }

  Widget _buildCell(DateTime day, Color color) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildStatCard(String label, int count, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Text(
        '$label : $count',
        style: const TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
