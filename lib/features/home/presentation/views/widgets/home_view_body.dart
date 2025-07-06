import 'package:flutter/material.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/colors_manager.dart';
 
import 'package:member/features/home/presentation/views/widgets/kids_card_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: KidsCardListView(),
      ),
    );
  }
}
