import 'package:android___tutorial/getx/splash_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashGetController s=Get.put(SplashGetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: GetBuilder<SplashGetController>(
           init: SplashGetController(),
           
            dispose:(state) => s.onClose(),
            //dispose: (state) => SplashGetController(),
            builder: (controller) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Android Tutorial",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Image.asset(
                          "assets/images/Android-Logo-Black-PNG.png",
                          height: 40,
                          width: 40,
                        )
                      ],
                    ))
                  ]);
            }));
  }
}
