
import 'package:ecommercefluter10/model/ecommerce_model.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class ecommerce_controller extends GetxController{

  // ignore: non_constant_identifier_names
  List<Model_ecommerce> ProductList = [];

  RxInt i = 0.obs;
  RxInt subtotal = 0.obs ;
  List<Model_ecommerce> tempList = [];
  void insetTempCartCollection(List<Model_ecommerce> list)
  {
    tempList = list;
  }
  RxBool isPressed=false.obs;
  RxInt number = 1.obs;
  List<Model_ecommerce> cartList=[];
  List favoritelist = [];
  List<Model_ecommerce> flist = [];
  void changefevorit(index)
  {
    index = isPressed.value = true;
    update();
  }

  void change(int index) {
    i.value = index;
    update();
  }



}