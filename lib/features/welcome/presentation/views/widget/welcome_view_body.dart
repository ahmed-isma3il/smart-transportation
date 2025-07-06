import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/colors_manager.dart';
import 'package:member/core/helper/on_generate_route.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  final int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 136.h),
          Center(child: Text("Welcome Maryam!", style: AppTextStyles.heading)),
          SizedBox(height: 40.h),
          Center(
            child: Text(
              "Please provide the following details to\n complete your member account",
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 60.h),

          _buildStep(
            stepNumber: 1,
            title: "Join Service Provider",
            isActive: currentStep == 0,
          ),
          _buildLine(isActive: currentStep >= 1),
          _buildStep(
            stepNumber: 2,
            title: "Add Student’s Details",
            isActive: currentStep == 1,
          ),
          _buildLine(isActive: currentStep >= 2),
          _buildStep(
            stepNumber: 3,
            title: "Add Address",
            isActive: currentStep == 2,
          ),

          Spacer(flex: 2),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, OnGenerateRoute.servicesView);
              },
              child: Container(
                height: 42.h,
                width: 326.w,
                decoration: BoxDecoration(
                  color: Color(0XFF509BC7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Start",
                    style: AppTextStyles.semiBold.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          Center(
            child: Container(
              height: 42.h,
              width: 326.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0XFF9FCBE5)),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  "Switch Account Type",
                  style: AppTextStyles.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildStep({
    required int stepNumber,
    required String title,
    required bool isActive,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 12.w, top: 4.h),
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color:
                isActive
                    ? ColorsManager.primary
                    : ColorsManager.primary.withOpacity(0.2),
            shape: BoxShape.circle,
            border:
                isActive
                    ? Border.all(color: ColorsManager.primary, width: 2)
                    : null,
          ),
          child:
              isActive
                  ? Center(
                    child: Icon(
                      Icons.circle,
                      size: 8.w,
                      color: ColorsManager.primary,
                    ),
                  )
                  : null,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step $stepNumber:",
              style: AppTextStyles.semiBold.copyWith(fontSize: 14.sp),
            ),
            Text(
              title,
              style: AppTextStyles.semiBold.copyWith(
                fontSize: 14.sp,
                color: ColorsManager.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLine({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h).copyWith(left: 9.w),
      height: 30.h,
      width: 2.w,
      color:
          isActive
              ? ColorsManager.primary
              : ColorsManager.primary.withOpacity(0.2),
    );
  }
}
