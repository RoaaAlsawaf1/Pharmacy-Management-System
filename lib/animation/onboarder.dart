import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';
import 'package:pharmacy/Rigester_Warehouse/Register_WarehouseScreen.dart';
import 'package:pharmacy/Rigester_pharmacy/Register_Pharmacy_Screen.dart';
import 'package:pharmacy/Rigester_user/Register_User_Screen.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late RiveAnimationController _riveAnimationControllerUser;
  late RiveAnimationController _riveAnimationControllerWarehouse;
  late RiveAnimationController _riveAnimationControllerPharmacy;
  @override
  void initState(){
    _riveAnimationControllerUser=OneShotAnimation("active",autoplay: false);
    _riveAnimationControllerWarehouse=OneShotAnimation("active",autoplay: false);
    _riveAnimationControllerPharmacy=OneShotAnimation("active",autoplay: false);


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
        child: Stack(
          children: [
            // Positioned(
            //     width: MediaQuery.of(context).size.width*1.7,
            //     bottom: 130,
            //
            //     child: Image.asset("images/")),
            Positioned.fill(child:
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20,
                  sigmaY: 10
              ),
              //child: SizedBox(),
            ),

            ),
           const RiveAnimation.asset("images/sshapes_greenblack.riv"),
            Positioned.fill(child:
            BackdropFilter(
                filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30
            ),
                child: const SizedBox(),
            ),
  ),
            SafeArea(
              child: SingleChildScrollView(

                child: ConditionalBuilder(
                  condition:ResponsiveBreakpoints.of(context).isDesktop ||ResponsiveBreakpoints.of(context).isTablet  ,
                  builder:(context) =>Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical:40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:  [
                              Text(
                                "31".tr
                                ,
                                style: TextStyle(
                                    fontSize:40,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    height: 1.2,
                                    color: HexColor(green.toString())

                                ),
                              ),
                              const  SizedBox(height: 16),
                                Text(
                                "34".tr,
                                style: TextStyle(color: Colors.black38),
                              ),
                              const Text(""),

                               Text(
                                "32".tr,
                                style: TextStyle(color: Colors.black38),
                              ),
                              const Text(""),
                               Text(
                                "33".tr,
                                style: TextStyle(color: Colors.black38),
                              ),


                            ],
                          ),
                        ),
                        const SizedBox(height:200,),
                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerUser.isActive=true;
                            //   navigateTo(widget: RegisterScreen(),context: context);
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateAndFinish(widget:RegisterUserScreen(),context: context);
                                }
                            );


                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerUser],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const SizedBox(width: 8,),
                                          Text("35".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                        const SizedBox(height: 4,),
                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerWarehouse.isActive=true;
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateAndFinish(widget:RegisterWarehouseScreen() ,context: context);
                                }
                            );

                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerWarehouse],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const SizedBox(width: 8,),
                                          Text("36".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                        const  SizedBox(height: 4,),
                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerPharmacy.isActive=true;
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateAndFinish(widget:RegisterPharmacyScreen() ,context: context);
                                }
                            );

                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerPharmacy],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const  SizedBox(width: 8,),
                                          Text("37".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),

                      ],
                    ),
                  )  ,
                  fallback:(context) =>Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical:40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260,
                          child: Column(
                            children:  [
                              Text(
                                "31".tr
                                ,
                                style: TextStyle(
                                    fontSize:40,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                    height: 1.2,
                                    color: HexColor(green.toString())

                                ),
                              ),
                              const  SizedBox(height: 16),
                              Text(
                                "34".tr,
                                style: TextStyle(color: Colors.black38),
                              ),
                              const Text(""),

                              Text(
                                "32".tr,
                                style: TextStyle(color: Colors.black38),
                              ),
                              const Text(""),
                              Text(
                                "33".tr,
                                style: TextStyle(color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),

                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerUser.isActive=true;
                            //   navigateTo(widget: RegisterScreen(),context: context);
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateTo(widget:RegisterUserScreen(),context: context);
                                }
                            );


                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerUser],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const SizedBox(width: 8,),
                                          Text("35".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                        const SizedBox(height: 4,),
                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerWarehouse.isActive=true;
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateAndFinish(widget:RegisterWarehouseScreen() ,context: context);
                                }
                            );

                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerWarehouse],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const SizedBox(width: 8,),
                                          Text("36".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),
                        const  SizedBox(height: 4,),
                        GestureDetector(
                          onTap:() {
                            _riveAnimationControllerPharmacy.isActive=true;
                            Future.delayed(
                                const Duration(milliseconds: 900),
                                    (){
                                  navigateAndFinish(widget:RegisterPharmacyScreen() ,context: context);
                                }
                            );

                          },
                          child: SizedBox(
                              height: 64,
                              width: 200,
                              child: Stack(
                                children: [
                                  RiveAnimation.asset(
                                    "images/button_greenblack.riv",
                                    controllers: [_riveAnimationControllerPharmacy],
                                  ),
                                  Positioned.fill(
                                      top: 8,
                                      child:
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[
                                          Icon(Icons.arrow_forward, color: HexColor(green.toString())),
                                          const  SizedBox(width: 8,),
                                          Text("37".tr,style:TextStyle(fontWeight:FontWeight.w600, color: HexColor(green.toString())),

                                          ),
                                        ],
                                      ))
                                ],
                              )),
                        ),

                      ],
                    ),
                  ) ,
                ),
              ),
    ),
          ],
        ),
      ),
    );
  }
}
