import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/assets_manager.dart';
import 'package:member/core/helper/colors_manager.dart';
import 'package:member/features/home/presentation/views/widgets/home_view_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeViewBody(),
    Center(child: Text('Location')),
    Center(child: Text('Notifications')),
    Center(child: Text('Menu')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Hi Maryam,\n',
                style: AppTextStyles.heading.copyWith(
                  fontSize: 16,
                  color: ColorsManager.primary,
                ),
              ),
              const TextSpan(
                text: 'Welcome Back!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0XFF000000),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40.r),topLeft: Radius.circular(40.r)),
        child: BottomNavigationBar(
        
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: ColorsManager.primary,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          showSelectedLabels: true,
           unselectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 10
          ),
            selectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          fontSize: 10
          ),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsManager.mapicon)),
              label: 'Map',
        
        
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsManager.profile_user)),
              label: 'Student',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsManager.notification)),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AssetsManager.menu)),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
