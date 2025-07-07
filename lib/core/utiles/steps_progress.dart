import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/config/app_text_styles.dart';
import 'package:member/core/helper/colors_manager.dart';

class StepData {
  final String title;

  StepData({required this.title});
}
class StepsProgress extends StatelessWidget {
  final List<StepData> steps;
  final int currentStep;

  const StepsProgress({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isActive = index == currentStep;
        final isCompleted = index < currentStep;
        final isLast = index == steps.length - 1;

        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // مؤشر الدائرة والخط
              Column(
                children: [
                  // دائرة
                  _buildStepCircle(isActive, isCompleted),

                  // خط تحت الدائرة
                  if (!isLast)
                    Container(
                      width: 1.5.w,
                      height: 72.h,
                      color: isCompleted || isActive
                          ? ColorsManager.primary
                          : ColorsManager.primary.withOpacity(0.3),
                    ),
                ],
              ),
              SizedBox(width: 12.w),

              // نص الخطوة
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step ${index + 1}:",
                    style: AppTextStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    step.title,
                    style: AppTextStyles.semiBold.copyWith(
                      fontSize: 14.sp,
                      color: ColorsManager.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStepCircle(bool isActive, bool isCompleted) {
    if (isCompleted) {
      return Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          shape: BoxShape.circle,
        ),
      );
    } else if (isActive) {
      return Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: ColorsManager.primary, width: 1.5),
        ),
        child: Center(
          child: Container(
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsManager.primary,
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: const Color(0xFFBFDCED).withOpacity(.5),
          shape: BoxShape.circle,
          border: Border.all(color: ColorsManager.primary, width: 1.5),
        ),
      );
    }
  }
}
