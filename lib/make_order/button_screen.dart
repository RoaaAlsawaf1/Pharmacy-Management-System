import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/MyPharmacy/generateQr_pharmacy.dart';
import 'package:pharmacy/MyPharmacy/my_pharmacy.dart';
import 'package:pharmacy/make_order/SearchM.dart';
import 'package:pharmacy/make_order/chooseWarehouse.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import '../shared/components/constant.dart';

class Button extends StatelessWidget {
   Button({Key? key}) : super(key: key);
  var data=Get.arguments;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

        if(state is generatePharmacy_QR_CubitSuccessState){

          navigateAndFinish(context: context,widget: GenerateQr_Pharmacy());


        }
        if(state is generatePharmacy_QR_CubitErrorState){
          showToast(text:"Unauthorized." ,state: ToastStates.EROOR);
        }
      },
      builder: (context, state) {
        return  Scaffold(
          extendBodyBehindAppBar: true,
          appBar:   AppBar(
            toolbarHeight: 150,
            leadingWidth:double.infinity,
            elevation: 0.0,

            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(color: Colors.transparent,),
              ),
            ),

            backgroundColor:Colors.white.withAlpha(100) ,

            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0,left: 8,right: 8),
                  child: IconButton(onPressed: () {
                    navigateAndFinish(context: context,widget: const MyPharmacy());
                  }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0,left: 34,right: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("303".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.grey.shade800
                            ),
                          ),
                          Spacer(),
                          Text("${CacheHelper.getData(key: "ppp")}",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.grey.shade800
                            ),
                          ),
                        ],
                      ),//
                      const SizedBox(height: 10,),
                      Row(

                        children: [

                          Text('${"304".tr}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600
                            ),
                          ),
                          Spacer(),
                          Text('${CacheHelper.getData(key: "nnnp")}',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade600
                            ),
                          ),
                        ],),
                    ],
                  ),
                ),

              ],
            ),


          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:LinearGradient(

                begin:  Alignment.topRight,
                end:Alignment.bottomLeft ,

                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'),//gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'),//
                  HexColor('D3C8CC'),
                  HexColor('D3CACF'),
                  HexColor('DBD9DE'),
                  HexColor('D7D2D8'),

                ],
                tileMode: TileMode.clamp,

              ),

            ),
            child:     SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: 1000,
                child:   Padding(
                  padding: const EdgeInsets.only(top:250.0,right: 20,left: 40),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Image.asset("images/icons8-order-96.png",width: 50,  height: 50),
                          const SizedBox(width: 10,),
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: HexColor(green),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: HexColor(green),
                                    size: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),

                            ],
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              Get.to(() => WarehouseMakeOrder(), arguments: [
                                CacheHelper.getData(key:  "idPharmacy")
                              ]);
                            },
                            child: Container(
                              width: 240,
                              height: 70,

                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("305".tr,style: const TextStyle(fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 5,),
                                    Text("306".tr,style: const TextStyle(color: Colors.grey,fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Image.asset("images/icons8-medicine-64 (1).png",width: 50,  height: 50),
                          const SizedBox(width: 10,),
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: HexColor(green),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: HexColor(green),
                                    size: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),

                            ],
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              Get.to(() => SearchM(), arguments: [
                                CacheHelper.getData(key:  "idPharmacy"),
                                PharmacyHomeCubit.get(context).getSearchPharmacy(value:'', id: CacheHelper.getData(key:  "idPharmacy")),
                              ]);
                            },
                            child: Container(
                              width: 240,
                              height: 70,

                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("307".tr,style: const TextStyle(fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 5,),
                                    Text("308".tr,style: const TextStyle(color: Colors.grey,fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),

                      Row(
                        children: [
                          Image.asset("images/icons8-qr-64.png",width: 50,  height: 50),
                          const SizedBox(width: 10,),
                          Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: HexColor(green),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: HexColor(green),
                                    size: 10,
                                  ),
                                ],
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),
                              const SizedBox(height:4 ,),
                              const Icon(
                                Icons.circle,
                                color:Colors.grey,
                                size: 4,
                              ),

                            ],
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                              PharmacyHomeCubit.get(context).getQRCode();
                            },
                            child: Container(
                              width: 240,
                              height:70,

                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                color: Colors.white.withOpacity(0.3),
                              ),
                              child:  Padding(
                                padding: EdgeInsets.only(left: 20.0,top: 10,right: 20),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("377".tr,style: TextStyle(fontWeight: FontWeight.w500)),
                                    SizedBox(height: 5,),
                                    Text("378".tr,style: TextStyle(color: Colors.grey,fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ),

              ),
            ),


          ),
        );
      },
    );
  }
}
