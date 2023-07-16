import 'package:dc_appoinment/screens/auth_page.dart';
import 'package:dc_appoinment/screens/booking_page.dart';
import 'package:dc_appoinment/screens/doctor_details.dart';
import 'package:dc_appoinment/screens/success_booked.dart';
import 'package:dc_appoinment/utils/config.dart';
import 'package:flutter/material.dart';

import 'main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //this is for push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //define ThemeData here
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //pre defined input decoration
        inputDecorationTheme: const InputDecorationTheme(
            focusColor: Config.primaryColor,
            border: Config.OutlinedBorder,
            focusedBorder: Config.focusBorder,
            errorBorder: Config.errorBorder,
            enabledBorder: Config.OutlinedBorder,
            floatingLabelStyle: TextStyle(color: Config.primaryColor),
            prefixIconColor: Colors.black38),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Config.primaryColor,
            selectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey.shade700,
            elevation: 10,
            type: BottomNavigationBarType.fixed),
        // primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        //auth page
        '/': (context) => const AuthPage(),
        //this is for main layout
        'main': (context) => const MainLayout(),
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppointmentBooked(),
      },
    );
  }
}
