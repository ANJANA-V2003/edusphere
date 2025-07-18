import 'package:edushpere/Admin_module/admin_login.dart';
import 'package:edushpere/Parent_Students_module/parents_login.dart';
import 'package:edushpere/Parent_Students_module/parents_navigationbar.dart';
import 'package:edushpere/Parent_Students_module/parents_register.dart';
import 'package:edushpere/Parent_Students_module/splash_screen_parents.dart';
import 'package:edushpere/Parent_Students_module/student_register.dart';
import 'package:edushpere/Teachers-module/Teacher_Login.dart';
import 'package:edushpere/Admin_module/logo_splashscreen_admin.dart';
import 'package:edushpere/Teachers-module/Teacher_Navigationbar.dart';
import 'package:edushpere/Teachers-module/Teacher_events.dart';
import 'package:edushpere/Teachers-module/Teachers_register.dart';
import 'package:edushpere/Teachers-module/splash_screen_teachers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 892),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                 // TRY THIS: Try running your application with "flutter run". You'll see
                // the application has a purple toolbar. Then, without quitting the app,
                // try changing the seedColor in the colorScheme below to Colors.green
                // and then invoke "hot reload" (save your changes or press the "hot
                // reload" button in a Flutter-supported IDE, or press "r" if you used
                // the command line to start the app).
                //
                // Notice that the counter didn't reset back to zero; the application
                // state is not lost during the reload. To reset the state, use hot
                // restart instead.
                //
                // This works for code too, not just values: Most code changes can be
                // tested with just a hot reload.
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Parents_Login(),
            ));
  }
}
