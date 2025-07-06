import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/core/helper/on_generate_route.dart';

void main() {
  runApp(const MemberApp());
}
 

 class MemberApp extends StatelessWidget {
  const MemberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit( 
            designSize: const Size(430, 932),
      child: MaterialApp(
           
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) =>OnGenerateRoute.router(settings) ,
            initialRoute:OnGenerateRoute.welcome  ,
       
      ),
    );
  }
}