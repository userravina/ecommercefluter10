import 'package:ecommercefluter10/Controller/ecommerce_controler.dart';
import 'package:ecommercefluter10/model/ecommerce_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/firebase.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  // ignore: prefer_typing_uninitialized_variables

  ecommerce_controller controller = Get.put(ecommerce_controller());

    Model_ecommerce  m = Get.arguments;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 310,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image.network("${m.Img}",
                        height: 28.h, width: 80.w),
                  ),
                ],
              ),
            ),
            Container(
              height: 457,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xff07635d),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
              child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            " ${m.Name}",
                            style: GoogleFonts.radioCanada(color: Colors.white,fontSize: 25),
                          ),
                          const Spacer(),
                          const Text(
                            "New   ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Row(
                          children: [
                            Obx(
                              () =>  Text(
                                "  \$ ${(m.Price)!*controller.number.value}",
                                style: GoogleFonts.radioCanada(color: Colors.white,fontSize: 18),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            const Icon(
                              Icons.star_half,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("  Description:",style: GoogleFonts.radioCanada(color: Colors.white,fontSize: 18),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,left: 13,top: 5),
                        child: Text("${m.desc}",style: GoogleFonts.radioCanada(color: Colors.white,),),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "  category",
                            style:  GoogleFonts.radioCanada(color: Colors.white,fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${m.cate}",
                            style: GoogleFonts.radioCanada(color: Colors.white,fontSize: 15),
                          ),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        "  Quantity",
                        style: GoogleFonts.radioCanada(color: Colors.white,fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 40,
                          width: 157,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller.number > 0) {
                                    controller.number.value--;
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  size: 20,color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              Obx(
                                    () => Text(
                                  "${controller.number.value}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                    ),
                              ),
                              const SizedBox(
                                width: 27,
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.number.value++;
                                },
                                icon: const Icon(Icons.add,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: ()  {
                          print("view  ${controller.number.value}");
                           FirebaseHelper.firehelper.cartProduct(
                              Model_ecommerce(
                                id: m.id,
                                Name: m.Name,
                                ic: controller.number.value,
                                Price: m.Price,
                                cate: m.cate,
                                 Img: m.Img,
                                desc: m.desc,
                                decount: m.decount
                              )
                          );
                          Get.toNamed('cart');
                        },
                        child: Container(
                          height: 40,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add to cart",
                                style: GoogleFonts.actor(color: Colors.black,fontSize: 18),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}