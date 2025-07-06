import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/core/helper/assets_manager.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // --- Top bar: Menu + Organizer ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AssetsManager.orginzer,
                        height: 16,
                        width: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Organizer",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 24),

              // --- Profile Picture ---
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AssetsManager.profile),
              ),

              const SizedBox(height: 8),

              // --- Name + QR ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  Text(
                    "Maryam",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(width: 6),
               Image.asset(AssetsManager.qrcode,height: 30.h,width: 30.w,)
                ],
              ),

              const SizedBox(height: 16),
              Container(height: 1, color: Colors.lightBlueAccent.withOpacity(0.3)),

              const SizedBox(height: 16),

              // --- Menu Items with images ---
              buildMenuItem(AssetsManager.account_information, "Account Information"),
              buildMenuItem(AssetsManager.addresses, "Addresses"),
              buildMenuItem(AssetsManager.report, "Reports"),
              buildMenuItem(AssetsManager.serivce_provider, "Service Provider"),
              buildMenuItem(AssetsManager.language, "Language"),
              buildMenuItem(AssetsManager.about_us, "About Us"),

              const Spacer(),

              // --- Log out ---
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildMenuItem(String imagePath, String title) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            // تنفيذ التنقل هنا
          },
        ),
        const Divider(height: 1),
      ],
    );
  }
}
