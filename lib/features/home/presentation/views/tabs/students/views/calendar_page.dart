import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
DateTime _focusedDay = DateTime.utc(2025, 9, 1); 

  DateTime? _selectedDay;

  // Sample colored days
  final Map<DateTime, String> statusMap = {
    DateTime.utc(2025, 9, 1): 'attended',
    DateTime.utc(2025, 9, 2): 'today',
    DateTime.utc(2025, 9, 6): 'absent',
    DateTime.utc(2025, 9, 9): 'parent',
  };

  Color? _getMarkerColor(DateTime day) {
    final key = DateTime.utc(day.year, day.month, day.day);
    switch (statusMap[key]) {
      case 'today':
        return Colors.purple;
      case 'attended':
        return Colors.green;
      case 'absent':
        return Colors.red;
      case 'parent':
        return Colors.blue;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text("Calendar",style: AppTextStyles.heading.copyWith(color: Colors.black,fontSize: 20),),
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Legend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Attendance", style: TextStyle(color: Colors.blue)),
                    Text("  - Upcoming Days  "),
                 
                  ],
                ),
                   Row(
                  children: const [
                          Text("Previous Trip Info", style: TextStyle(color: Colors.blue)),
                    Text(" - Past Days"),
                 
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Calendar
          TableCalendar(
            firstDay: DateTime.utc(2025, 8, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              markerDecoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.purple.shade200,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                final color = _getMarkerColor(day);
                if (color != null) {
                  return Positioned(
                    bottom: 4,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 20),
          // Legend Colors
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 8,
              spacing: 20,
              children: const [
           Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: const [
    _LegendItem(color: Color(0XFF735BF2), label: 'Today'),
    SizedBox(height: 8),
    _LegendItem(color: Color(0XFF6FB677), label: 'Attended'),
    SizedBox(height: 8),
    _LegendItem(color: Color(0XFFEB5144), label: 'Absent'),
    SizedBox(height: 8),
    _LegendItem(color: Color(0XFF5073FF), label: 'Parent Pick up'),
  ],
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        CircleAvatar(radius: 10.r, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
