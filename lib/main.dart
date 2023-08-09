import 'package:ecommercefluter10/Screen/user_side/Notification_screen.dart';
import 'package:ecommercefluter10/Screen/user_side/buyScreen.dart';
import 'package:ecommercefluter10/Screen/user_side/cart_screen.dart';
import 'package:ecommercefluter10/Screen/user_side/view_screen.dart';
import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:ecommercefluter10/utils/notification_permistion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import 'Screen/login_screen/Signup_screen.dart';
import 'Screen/user_side/Bottom_Screen.dart';
import 'Screen/user_side/Fingerscreen.dart';
import 'Screen/user_side/HomeScreen.dart';
import 'Screen/login_screen/Login_screen.dart';
import 'Screen/into_Screen/SplachScreen.dart';
import 'Screen/into_Screen/intoScreen.dart';
import 'Screen/user_side/favoritescreen.dart';
import 'Screen/user_side/searchscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await  FirebaseHelper.firehelper.initMessageing();
  Notification_permision.service.initNotification();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType ) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (p0) => const splach(),
          'into': (p0) => const IntoScreen(),
          'login': (p0) => const Login(),
          'Signup': (p0) => const Signup(),
          'finger': (p0) => const fingerscreen(),

          // ================================== user side ================================

          'bottom': (p0) => const Bottom(),
          'Home': (p0) => const HomeScreen(),
          'view': (p0) => const ViewScreen(),
          'cart':(p0) => const cartscreen(),
          'serach':(p0) => const searchscreen(),
          'f':(p0) => const fevreatScreen(),
          'noti':(p0) => const notificationscreen(),
          'buy':(p0) => const OrderScreen(),
        },
      ),
    ),
  );
}
