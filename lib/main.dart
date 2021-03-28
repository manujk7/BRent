import 'package:brent/modules/bookFlight/view/components/bookFlight.dart';
import 'package:brent/modules/bookFlight/view/components/payment.dart';
import 'package:brent/modules/firstPage/view/firstPage.dart';
import 'package:brent/modules/home/controller/homeController.dart';
import 'package:brent/modules/home/controller/homePageController.dart';
import 'package:brent/modules/home/view/components/home.dart';
import 'package:brent/modules/profile/controller/profileController.dart';
import 'package:brent/modules/profile/view/components/password.dart';
import 'package:brent/modules/profile/view/components/profile.dart';
import 'package:brent/modules/signUp/controller/signUpController.dart';
import 'package:brent/modules/signUp/view/components/signUpPage.dart';
import 'package:brent/services/prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/invite/view/components/manageInvites.dart';
import 'modules/login/controller/loginController.dart';
import 'modules/login/view/loginPage.dart';
import 'modules/other/shareApp.dart';

SharedPrefs appAuth = new SharedPrefs();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _controller = Get.put(LoginController());
  final _controllerSignUp = Get.put(SignUpController());
  final _controllerHome = Get.put(HomeController());
  final _controllerProfile = Get.put(ProfileController());
  final _controllerHomePage = Get.put(HomePageController());
  Widget _defaultHome = new FirstPage();
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new Home();
  }
  runApp(GetMaterialApp(
    title: 'BRent',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    //when initial Route is given no need to add home widget for initial start point of app
    //full app route structure
    routes: {
      '/': (context) => _defaultHome,
      '/firstPage': (context) => FirstPage(),
      '/login': (context) => LoginPage(),
      '/signUp': (context) => SignUpPage(),
      '/home': (context) => Home(),
      '/profile': (context) => ProfilePage(),
      '/shareApp': (context) => ShareAppPage(),
      '/bookFlightPage': (context) => BookFlightPage(),
      '/paymentPage': (context) => PaymentPage(),
      '/invitePage': (context) => ManageInvitePage(),
      '/changePassword': (context) => ChangePassword()
    },
    theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nunito',
        dividerTheme: DividerThemeData(
            color: Colors.grey //  <--- change the divider's color
            )),
  ));
}

// class MyApp extends StatelessWidget {
//   final _controller = Get.put(LoginController());
//   final _controllerSignUp = Get.put(SignUpController());
//   final _controllerHome = Get.put(HomeController());
//   final _controllerProfile = Get.put(ProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'BRent',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       //when initial Route is given no need to add home widget for initial start point of app
//       //full app route structure
//       routes: {
//         '/': (context) => FirstPage(),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => Home(),
//         '/profile': (context) => ProfilePage(),
//         '/shareApp': (context) => ShareAppPage(),
//         '/bookFlightPage': (context) => BookFlightPage(),
//         '/paymentPage': (context) => PaymentPage(),
//         '/invitePage': (context) => ManageInvitePage(),
//         '/changePassword': (context) => ChangePassword()
//       },
//       theme: ThemeData(
//           primarySwatch: Colors.grey,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//           fontFamily: 'Nunito',
//           dividerTheme: DividerThemeData(
//               color: Colors.grey //  <--- change the divider's color
//               )),
//     );
//   }
// }
