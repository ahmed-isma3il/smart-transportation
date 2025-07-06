import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/assets_manager.dart';
import 'package:member/core/helper/colors_manager.dart';

class RequestSent extends StatelessWidget {
  const RequestSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:  100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetsManager.request_done,height: 210.h,width: 210.w,) ,
            SizedBox(height: 30.h,),
            Center(child: Text("Request Sent!",style: AppTextStyles.heading,)),
        
          SizedBox(height: 30.h,),
            Center(child: Text("You will be notified once your \n request is accepted",
            
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold.copyWith(color: ColorsManager.primary),))
        
        
          ],
        ),
      ),
    );
  }
}
