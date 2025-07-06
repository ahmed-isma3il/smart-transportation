 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/core/helper/assets_manager.dart';
import 'package:member/core/helper/colors_manager.dart';

class KidsCard extends StatelessWidget {
  final String studentName;
  final String schoolName;
  final String driverName;
  final String supervisorName;
  final String pickupTime;
  final String dropTime;
  final String busNumber;
  final String studentImage;

  final Color nameColor;
  final Color dividerColor;
  final Color headerBackgroundColor;

  const KidsCard({
    super.key,
    required this.studentName,
    required this.schoolName,
    required this.driverName,
    required this.supervisorName,
    required this.pickupTime,
    required this.dropTime,
    required this.busNumber,
    required this.studentImage,
    this.nameColor = ColorsManager.primary, // ← لون اسم الطالب (افتراضي)
    this.dividerColor = const Color(0xFFCAE9FE), // ← لون الخط
    this.headerBackgroundColor = const Color(0xFFCAE9FE), // ← لون خلفية الصورة
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: headerBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 55.r,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      studentImage,
                      fit: BoxFit.cover,
                      width: 80.w,
                      height: 80.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            studentName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: nameColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            schoolName,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0XFF1B4865),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                _iconWithText(AssetsManager.bus_icon, busNumber),
                _lineDivider(),
                _iconWithText(AssetsManager.home_icon, pickupTime),
                _lineDivider(),
                _iconWithText(AssetsManager.school_icon, dropTime),
              ],
            ),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(
                          text: 'Driver:\n ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: driverName),
                    ],
                  ),
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(
                              text: 'Supervisor:\n ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: supervisorName),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(AssetsManager.call, width: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconWithText(String iconPath, String text) {
    return Column(
      children: [
        Image.asset(iconPath, width: 24),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _lineDivider() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Container(
          height: 8.h,
          color: dividerColor,
        ),
      ),
    );
  }
}
