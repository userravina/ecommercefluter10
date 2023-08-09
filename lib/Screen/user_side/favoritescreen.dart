
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/ecommerce_controler.dart';

// ignore: camel_case_types
class fevreatScreen extends StatefulWidget {
  const fevreatScreen({super.key});

  @override
  State<fevreatScreen> createState() => _fevreatScreenState();
}

// ignore: camel_case_types
class _fevreatScreenState extends State<fevreatScreen> {
  ecommerce_controller controller  = Get.put(ecommerce_controller());
  @override
  void initState() {
    controller.flist;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Favorite Product",
                  style: GoogleFonts.alice(
                      fontSize: 20,
                      letterSpacing: 1,
                      color: Colors.black54,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
           SizedBox(height: 80.h,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return  Padding(padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: SizedBox(
                          width: 50,
                          child: Image.network(
                            "${controller.flist[index].Img}",
                          )),
                      subtitle: Text(
                        "${controller.flist[index].cate}",
                        style: GoogleFonts.mada(color: Colors.black),
                      ),
                      title: Text(
                        "${controller.flist[index].Name}",
                        style: GoogleFonts.mada(color: Colors.black),
                      ),
                      trailing:  CircleAvatar(
                        backgroundColor:
                        Colors.teal.shade100,
                        // ignore: unrelated_type_equality_checks
                        child: Icon(
                          Icons.favorite,
                          // ignore: unrelated_type_equality_checks
                          color: controller.favoritelist != true
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.flist.length,
              ),
            ),
        ],
      ),
    ));
  }
}
