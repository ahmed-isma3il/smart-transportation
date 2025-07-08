import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:member/core/helper/on_generate_route.dart';
 import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ← مهم
void main() {
  runApp(const MemberApp());
}

class MemberApp extends StatelessWidget {
  const MemberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
          locale: const Locale('en'), // أو Locale('ar')
  supportedLocales: const [
    Locale('en'),
    Locale('ar'),
  ],
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Montserrat",  
        ),
        onGenerateRoute: (settings) => OnGenerateRoute.router(settings),
        initialRoute: OnGenerateRoute.welcome,
      ),
    );
  }
}
