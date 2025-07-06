import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/assets_manager.dart';
import 'package:member/features/home/presentation/views/tabs/notifications/widgets/circle_tab.dart';
import 'package:member/features/home/presentation/views/tabs/notifications/widgets/notification_item.dart';
import 'package:member/features/home/presentation/views/tabs/notifications/widgets/section_header.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int selectedTabIndex = 0; // 0 = Bus, 1 = Emergency

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Notifications",
                  style: AppTextStyles.heading.copyWith(
                      color: const Color(0XFF000000), fontSize: 20)),

              const SizedBox(height: 16),

              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => selectedTabIndex = 0),
                    child: CircleTab(title: "Bus", selected: selectedTabIndex == 0),
                  ),
                  SizedBox(width: 100.w),
                  GestureDetector(
                    onTap: () => setState(() => selectedTabIndex = 1),
                    child: CircleTab(title: "Emergency", selected: selectedTabIndex == 1),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: selectedTabIndex == 0
                      ? _buildBusNotifications()
                      : _buildEmergencyNotifications(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBusNotifications() {
    return [
      const SectionHeader(title: "Today"),
      NotificationItem(
        name: "Reem's bus arrived!",
        subtitle: "Please meet the bus outside",
        time: null,
        image: AssetsManager.kid2,
        showSwipe: false,
      ),
      NotificationItem(
        name: "Reem's bus is about to arrive",
        subtitle: "2 mins left",
        time: "2 mins left",
        image: AssetsManager.kid2,
        showSwipe: false,
      ),
      NotificationItem(
        name: "Omar’s bus arrived!",
        subtitle: "Please meet the bus outside",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: false,
      ),
      NotificationItem(
        name: "Omar’s bus is about to arrive",
        subtitle: "1 min left",
        time: "1 min left",
        image: AssetsManager.kid1,
        showSwipe: true,
      ),
      const SizedBox(height: 16),
      const SectionHeader(title: "Yesterday , September 1"),
      NotificationItem(
        name: "Omar’s bus arrived!",
        subtitle: "Please meet the bus outside",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: false,
      ),
    ];
  }

  List<Widget> _buildEmergencyNotifications() {
    return [
      const SectionHeader(title: "Today"),
      NotificationItem(
        name: "Omar’s Bus was in an accident!",
        subtitle: "We will notify you with more details",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: false,
      ),
      NotificationItem(
        name: "Omar’s Bus was in an accident!",
        subtitle: "We will notify you with more details",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: false,
      ),
      NotificationItem(
        name: "Omar’s Bus was in an accident!",
        subtitle: "We will notify you with more details",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: true,
      ),
      const SectionHeader(title: "Yesterday , September 1"),
      NotificationItem(
        name: "Omar’s Bus was in an accident!",
        subtitle: "We will notify you with more details",
        time: null,
        image: AssetsManager.kid1,
        showSwipe: false,
      ),
    ];
  }
}
 