import 'package:flutter/material.dart';
import 'package:member/core/helper/assets_manager.dart';
import 'package:member/core/helper/colors_manager.dart';
import 'package:member/features/home/presentation/views/widgets/fun_card.dart';

class KidsCardListView extends StatelessWidget {
  const KidsCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> kidsData = [
      {
        'studentName': 'Omar',
        'schoolName': "Delta Modern Language School",
        'driverName': "Mahmoud",
        'supervisorName': "Layla",
        'pickupTime': "7:00 am",
        'dropTime': "7:30 am",
        'busNumber': "8900",
        'studentImage': AssetsManager.kid1,
        'nameColor': ColorsManager.primary,
        'dividerColor': const Color(0xFFCAE9FE),
        'headerBackgroundColor': const Color(0xFFEAF6FF),
      },
      {
        'studentName': 'Reem',
        'schoolName': 'Delta Modern Language School',
        'driverName': 'Mahmoud',
        'supervisorName': 'Layla',
        'pickupTime': '7:02 am',
        'dropTime': '7:32 am',
        'busNumber': '8988',
        'studentImage':AssetsManager.kid2,
        'nameColor': const Color(0xFFFFD078),
        'dividerColor': const Color(0xFFFFF9CD),
        'headerBackgroundColor': const Color(0xFFFFF9CD),
      },
    ];

    return ListView.builder(
      itemCount: kidsData.length,
      itemBuilder: (context, index) {
        final kid = kidsData[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:  8.0),
          child: KidsCard(
            studentName: kid['studentName'],
            schoolName: kid['schoolName'],
            driverName: kid['driverName'],
            supervisorName: kid['supervisorName'],
            pickupTime: kid['pickupTime'],
            dropTime: kid['dropTime'],
            busNumber: kid['busNumber'],
            studentImage: kid['studentImage'],
            nameColor: kid['nameColor'],
            dividerColor: kid['dividerColor'],
            headerBackgroundColor: kid['headerBackgroundColor'],
          ),
        );
      },
    );
  }
}
