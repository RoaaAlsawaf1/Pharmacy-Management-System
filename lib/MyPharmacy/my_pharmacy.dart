import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';

import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/make_order/button_screen.dart';

import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class MyPharmacy extends StatefulWidget {
  const MyPharmacy({Key? key}) : super(key: key);

  @override
  State<MyPharmacy> createState() => _MyPharmacyState();
}

class _MyPharmacyState extends State<MyPharmacy> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          // appBar: AppBar(
          //   toolbarHeight:80,
          //   titleSpacing: 8,
          //   leadingWidth: 58,
          //   elevation: 0.0,
          //   flexibleSpace: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient:LinearGradient(
          //
          //         begin:  Alignment.topRight,
          //         end:Alignment.bottomLeft ,
          //
          //         colors: [
          //           HexColor('A8BEE7'),
          //           HexColor('AEC9DE'),//gray light
          //           //gray dark
          //           HexColor('BBC5CE'),
          //
          //
          //
          //         ],
          //         tileMode: TileMode.clamp,
          //
          //       ),
          //     ) ,
          //   ),
          //   leading:Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: () {
          //       navigateTo(widget:drawerScreen() ,context:context);
          //     }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
          //   )
          //   ,
          //   title: Row(
          //     children: [
          //       Text("My Pharmacy",style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.normal),),
          //     ],
          //   ) ,
          //   // actions: [
          //   //   Padding(
          //   //     padding: const EdgeInsets.only(right: 24.0),
          //   //     child: LottieBuilder.asset("images/124405-prescription.json",width: 40,height: 40,),
          //   //   )
          //   // ],
          //
          // ),
          extendBodyBehindAppBar: true,
          appBar:   AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 70,
            elevation: 0.0,

            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(color: Colors.transparent,),
              ),
            ),

            backgroundColor:Colors.white.withAlpha(100) ,

            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child:  Text("300".tr,
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: drawerScreen());
              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 100000,
                      child: ConditionalBuilder(
                        builder: (context) =>ConditionalBuilder(
                            condition:PharmacyHomeCubit.get(context).modelPharmacy.pharmacies!.isNotEmpty ,
                            builder: (context) =>  ListView.separated(
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder:(context, index) => Pharma(context,PharmacyHomeCubit.get(context).modelPharmacy.pharmacies![index]),
                                separatorBuilder:(context, index) => const SizedBox(height: 10),
                                itemCount: PharmacyHomeCubit.get(context).modelPharmacy.pharmacies!.length),
                            fallback: (context) => Padding(
                              padding: const EdgeInsets.only(top: 400.0),
                              child: Text("There are no Pharmacy",style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                            ),),
                        fallback: (context) =>Center(child: CircularProgressIndicator(color:  HexColor(green.toString()))),
                        condition:state is !PharmacyWLoadingState  ,


                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


        );
      },
    );
  }
  Widget Pharma(context,Pharmacies pharmacies) => InkWell(
    onTap: () {

      CacheHelper.saveData(key:"ppp", value:   pharmacies.pharmacyName);
      CacheHelper.saveData(key:"nnnp", value:   pharmacies.number);
      CacheHelper.saveData(key: "idPharmacy", value: pharmacies.id);
      if(pharmacies.validated==0){
        showToast(text: "301".tr, state: ToastStates.EROOR);
      }
     else{
        Get.to(() => Button(), arguments: [
          pharmacies.id



        ]);
      }

    },
    child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              color: Colors.white.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text("303".tr,overflow: TextOverflow.ellipsis),
                                Spacer(),
                                Text("${pharmacies.pharmacyName!}",overflow: TextOverflow.ellipsis),

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("304".tr,overflow: TextOverflow.ellipsis,),
                                Spacer(),
                                Text("${pharmacies.number!}",overflow: TextOverflow.ellipsis,),

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color:pharmacies.validated==0?Colors.grey[400] :HexColor(green.toString()),

              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
              ),
            ),
            height: 30,
            width: 150,
            child:  Center(
              child: Text(pharmacies.validated==0?'301'.tr:"302".tr,style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              )),
            ),

          ),
        ]),
  );

}
