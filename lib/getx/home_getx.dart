import 'package:get/get.dart';

class HomeGetxController extends GetxController{
 var ishovered=false.obs;
  onHover(){
ishovered.toggle();
update();
  }
}