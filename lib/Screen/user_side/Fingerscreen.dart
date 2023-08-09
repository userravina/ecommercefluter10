
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class fingerscreen extends StatefulWidget {
  const fingerscreen({super.key});

  @override
  State<fingerscreen> createState() => _fingerscreenState();
}

// ignore: camel_case_types
class _fingerscreenState extends State<fingerscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 415.8, left: 3),
                    child: Image.asset("assets/images/f1.png",
                        color: const Color(0xff07635d))),
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(top: 450, left: 125),
              child: Text(
                "Finger Print \n  access!",
                style: GoogleFonts.alice(color: Colors.white,fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 680, left: 120),
              child: Text(
                "Long press",
                style: GoogleFonts.alice(color: Colors.white,fontSize: 20),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 540, left: 120),
                child: InkWell(
                    focusColor: Colors.grey,
                    onLongPress: () {
                      Get.offNamed('bottom');
                    },
                    child: Image.asset("assets/images/finger.png"))),
            Padding(
                padding: const EdgeInsets.only(top: 145, left: 110),
                child: Image.asset("assets/images/f22.png")),

          ],
        ),
      ),
    );
  }
}
