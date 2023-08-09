import 'package:ecommercefluter10/utils/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntoScreen extends StatefulWidget {
  const IntoScreen({super.key});

  @override
  State<IntoScreen> createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Choose Product",
              image: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset("assets/images/into1.png"),
              ),
              decoration: PageDecoration(
                  bodyTextStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 15)),
              body:
                  "A Product is thw item offered for sale.A product can be a service or an item. it can be physical or in virtual or cyber form",
            ),
            PageViewModel(
              title: "Make Payment",
              image: Image.asset("assets/images/into2.png"),
              decoration: PageDecoration(
                bodyTextStyle:
                    TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
              body:
                  "Payment is the transfer of money\n services in exchange product Payments \n typically made terms agreed",
            ),
            PageViewModel(
              title: "Get Your Order",
              image: Image.asset("assets/images/into3.png"),
              decoration: PageDecoration(
                  bodyTextStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 15)),
              body:
                  "Business or commerce an order is a stated \n intention either spoken to engage in a \n commercial transaction specific products",
            ),
          ],
          next: const Text(
            "Next",
          ),
          done: TextButton(
            onPressed: () {
              bool login = false;
              FirebaseHelper.firehelper.checkuser();
              login == false
                  ? Get.offAllNamed("login")
                  : Get.offAllNamed("bottom");
              // Navigator.pushReplacementNamed(context, 'login');
            },
            child: const Text("Done"),
          ),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: const Text("skip"),
          onDone: () {
            Navigator.pushReplacementNamed(context, 'photo');
          },
        ),
      ),
    );
  }
}
