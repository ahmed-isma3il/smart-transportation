import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/colors_manager.dart';
import 'package:member/features/home/presentation/views/tabs/students/widgets/show_driver_info_dialog.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  final Map<DateTime, String> statusMap = {
    DateTime.now().subtract(Duration(days: 1)): 'attended', // أمس
    DateTime.now(): 'today', // اليوم
    DateTime.now().add(Duration(days: 4)): 'absent', // بعد 4 أيام
    DateTime.now().add(Duration(days: 7)): 'parent', // بعد أسبوع
  };

  Color? _getMarkerColor(DateTime day) {
    final key = DateTime.utc(day.year, day.month, day.day);
    switch (statusMap[key]) {
      case 'today':
        return Color(0XFF735BF2);
      case 'attended':
        return Color(0XFF6FB677);
      case 'absent':
        return Color(0XFFEB5144);
      case 'parent':
        return Color(0XFF5073FF);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: AppTextStyles.heading.copyWith(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
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
                      Text(
                        "Previous Trip Info",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(" - Past Days"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime.now().subtract(
                const Duration(days: 30),
              ), // شهر واحد للخلف
              lastDay: DateTime.now().add(
                const Duration(days: 30),
              ), // شهر واحد للأمام
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                final yesterday = DateTime.now().subtract(Duration(days: 1));
                final normalizedYesterday = DateTime(
                  yesterday.year,
                  yesterday.month,
                  yesterday.day,
                );

                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;

                  // عرض معلومات السائق إذا كان اليوم المحدد هو أمس
                  if (isSameDay(selectedDay, normalizedYesterday)) {
                    showDriverInfoDialog(context);
                  }
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle, // استخدم إما shape أو borderRadius
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0XFF735BF2),
                  shape: BoxShape.circle, // استخدم إما shape أو borderRadius
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.circle, // استخدم إما shape أو borderRadius
                ),
              ),

              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  final color = _getMarkerColor(normalizeDate(day));

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
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                runSpacing: 8,
                spacing: 20,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _LegendItem(color: Color(0XFF735BF2), label: 'Today'),
                      SizedBox(height: 8),
                      _LegendItem(color: Color(0XFF6FB677), label: 'Attended'),
                      SizedBox(height: 8),
                      _LegendItem(color: Color(0XFFEB5144), label: 'Absent'),
                      SizedBox(height: 8),
                      _LegendItem(
                        color: Color(0XFF5073FF),
                        label: 'Parent Pick up',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DateTime normalizeDate(DateTime date) {
  return DateTime.utc(date.year, date.month, date.day);
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 10.r, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}

void _showAttendanceDialog(BuildContext context, DateTime selectedDay) {
  bool fromHome = false;
  bool fromSchool = false;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "${DateFormat('MMMM').format(selectedDay)} ${selectedDay.day}",
                        style: AppTextStyles.semiBold.copyWith(
                          color: ColorsManager.primary,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Default:",
                      style: AppTextStyles.semiBold.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.green,
                            size: 16.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Will Attend",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Change To:",
                      style: AppTextStyles.semiBold.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.red, size: 12.sp),
                          SizedBox(width: 6.w),
                          Text(
                            "Absent",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "Reason:",
                        style: AppTextStyles.semiBold.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(12.r),
                        ),
                        maxLines: 2,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.blue, size: 12.sp),
                          SizedBox(width: 6.w),
                          Text(
                            "Parent Pick up",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: fromHome,
                            onChanged: (value) {
                              setState(() {
                                fromHome = value!;
                                if (fromHome) fromSchool = false;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            "From Home",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Checkbox(
                            value: fromSchool,
                            onChanged: (value) {
                              setState(() {
                                fromSchool = value!;
                                if (fromSchool) fromHome = false;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            "From School",
                            style: AppTextStyles.semiBold.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Leave a note:",
                      style: AppTextStyles.semiBold.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: ColorsManager.primary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: ColorsManager.primary,
                            width: 2,
                          ),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12.r),
                      ),
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFFCAE9FE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.w,
                            vertical: 12.h,
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: AppTextStyles.heading.copyWith(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
