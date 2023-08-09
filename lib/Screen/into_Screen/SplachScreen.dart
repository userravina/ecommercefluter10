
import 'dart:async';
import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class splach extends StatefulWidget {
  const splach({super.key});

  @override
  State<splach> createState() => _splachState();
}

// ignore: camel_case_types
class _splachState extends State<splach> {
  bool login = false;
  @override
  void initState()  {
   login =  FirebaseHelper.firehelper.checkuser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        login == false
            ? Get.offAllNamed("into")
            : Get.offNamed("finger");
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Image.asset("assets/images/Splash.png"),
            )
          ],
        ),
      ),
    );
  }
}
