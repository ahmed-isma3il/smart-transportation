import 'package:flutter/material.dart';
import 'package:member/features/address_details_screen/presentation/views/address_details_screen.dart';
import 'package:member/features/home/presentation/views/home.dart';
import 'package:member/features/home/presentation/views/tabs/menu/views/account_info.dart';
import 'package:member/features/home/presentation/views/tabs/menu/views/reports.dart';
import 'package:member/features/home/presentation/views/tabs/menu/widgets/new_report_page.dart';
import 'package:member/features/home/presentation/views/tabs/menu/widgets/report_details_page.dart';
import 'package:member/features/home/presentation/views/tabs/students/views/calendar_page.dart';
import 'package:member/features/home/presentation/views/tabs/students/views/shared_access.dart';
import 'package:member/features/home/presentation/views/tabs/students/views/student_information.dart';
import 'package:member/features/home/presentation/views/tabs/students/views/upload_photos_page.dart';
import 'package:member/features/location_picker/presentation/views/location_picker.dart';
import 'package:member/features/pending_confirmation/presentation/views/request_is_pending.dart';
import 'package:member/features/pending_confirmation/presentation/views/request_sent.dart';
import 'package:member/features/service/presentation/views/servies_view.dart';
import 'package:member/features/step2/presentation/views/step2_view.dart';
import 'package:member/features/step3/presentation/views/step3_view.dart';
import 'package:member/features/student_details/presentation/views/student_details_view.dart';
import 'package:member/features/welcome/presentation/views/welcome_view.dart';

class OnGenerateRoute {
   static const String welcome = "welcome";
   static const String servicesView = "ServicesView";
   static const String step2View = "Step2View";
static const String step3View = "Step4View";

   static const String studentDetailsView = "StudentDetailsView";
   static const String addressDetailsScreen = "AddressDetailsScreen";
   static const String requestSent = "RequestSent";
   static const String requestIspending = "RequestIsPending";
   static const String home = "Home";
   static const String studentInformationPage = "StudentInformationPage";

   static const String uploadPhotosPage = "UploadPhotosPage";
  
   static const String calendarPage = "CalendarPage";
   static const String sharedAccessPage = "SharedAccessPage";
   static const String accountInfoPage = "AccountInfoPage";
   static const String reportsPage = "ReportsPage";

   static const String newReportPage = "NewReportPage";
   static const String reportDetailsPage = "ReportDetailsPage";
   static const String locationPickerScreen = "LocationPickerScreen";

           
     
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (context) =>   WelcomeView());
           case servicesView:
        return MaterialPageRoute(builder: (context) =>   ServicesView());
                   case step2View:
        return MaterialPageRoute(builder: (context) =>   Step2View());
                           case step3View:
        return MaterialPageRoute(builder: (context) =>   Step3View());
               case studentDetailsView:
        return MaterialPageRoute(builder: (context) =>   StudentDetailsView());
                   case addressDetailsScreen:
        return MaterialPageRoute(builder: (context) =>   AddressDetailsScreen());
              case requestSent:
        return MaterialPageRoute(builder: (context) =>   RequestSent());
            case requestIspending:
        return MaterialPageRoute(builder: (context) =>   RequestIsPending());
                    case home:
        return MaterialPageRoute(builder: (context) =>   Home());
                 case studentInformationPage:
        return MaterialPageRoute(builder: (context) =>   StudentInformationPage());
                         case uploadPhotosPage:
        return MaterialPageRoute(builder: (context) =>   UploadPhotosPage());
                  case calendarPage:
        return MaterialPageRoute(builder: (context) =>   CalendarPage());
                          case sharedAccessPage:
        return MaterialPageRoute(builder: (context) =>   SharedAccessPage());
                          case accountInfoPage:
        return MaterialPageRoute(builder: (context) =>   AccountInfoPage());
              case reportsPage:
        return MaterialPageRoute(builder: (context) =>   ReportsPage());
        
                          case locationPickerScreen:
        return MaterialPageRoute(builder: (context) =>   LocationPickerScreen());
                case newReportPage:
        return MaterialPageRoute(builder: (context) =>   NewReportPage());
    case reportDetailsPage:
  final args = settings.arguments as Map<String, dynamic>;
  return MaterialPageRoute(
    builder: (context) => ReportDetailsPage(
      reportId: args['reportId'],
      title: args['title'],
      status: args['status'],
      recipient: args['recipient'],
      description: args['description'],
    ),
  ); 
  }
  
}
}