
import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/Screen/user_side/cart_screen.dart';
import 'package:ecommercefluter10/Screen/user_side/profilescreen.dart';
import 'package:ecommercefluter10/Screen/user_side/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomeScreen.dart';
import 'favoritescreen.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  @override
  Widget build(BuildContext context) {
    ecommerce_controller controller = Get.put(ecommerce_controller());
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () =>  IndexedStack(
            index: controller.i.value,
            children: const [
              HomeScreen(),
              searchscreen(),
              cartscreen(),
              // fevreatScreen(),
              fevreatScreen(),
              profilescreen(),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => SizedBox(height: 60,
            child: BottomNavigationBar(
              currentIndex: controller.i.value,
              onTap: (value) {
                controller.i.value = value;
              },unselectedFontSize: 20,
              mouseCursor: MouseCursor.uncontrolled,
              elevation: 15,
              unselectedItemColor: Colors.deepOrange.shade200,
              selectedItemColor: Colors.teal.shade800,
              items: const [
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.shopping_cart),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
