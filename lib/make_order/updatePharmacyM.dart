import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import 'SearchM.dart';

class UpdateMedicinePharmacy extends StatelessWidget {
   UpdateMedicinePharmacy({Key? key}) : super(key: key);
   var maxController=TextEditingController();

   var data=Get.arguments;

   Map<String,Map<String,String>>map={};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener:(context, state) {
        if(state is PhUpdateSuccessState){
          if(state.value==200){
            showToast(text: "Update Successfully", state: ToastStates.EROOR);

            maxController.clear();
          }
        }
      },
      builder:(context, state) {
        return Scaffold(

          // appBar: AppBar(
          //   toolbarHeight: 80,
          //   titleSpacing: 0.0,
          //   leadingWidth: 46,
          //   elevation: 0.0,
          //   flexibleSpace: Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [
          //           HexColor('A8BEE7'),
          //           HexColor('AEC9DE'), //gray light
          //           //gray dark
          //           HexColor('BBC5CE'),
          //         ],
          //         tileMode: TileMode.clamp,
          //       ),
          //     ),
          //   ),
          //   leading:Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(onPressed: () {
          //       Navigator.pop(context);
          //     }, icon:const Icon(Icons.arrow_back,)),
          //   ),
          //   title: const Padding(
          //     padding: EdgeInsets.all(16.0),
          //     child: Text("update" ),
          //   ),
          //
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
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child:  Text("My Warehouse",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: SearchM());
                PharmacyHomeCubit.get(context).getSearchPharmacy(value:'',id:       CacheHelper.getData(key: "idPharmacy"));

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
            child:SingleChildScrollView(

              child: Padding(
                  padding: const EdgeInsets.only(right:  16.0,left: 16.0,top: 150),
                  child:Container(
                    height:100000,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(" Max_quantity :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                        const SizedBox(height: 30,),
                        Row(

                          children: [

                            Expanded(


                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all( Radius.circular(35)),
                                  color: Colors.white.withOpacity(0.3),),
                                child:defaultTextFieldPharmacyUpdate(
                                  controller: maxController, type: TextInputType.text,
                                  validate: (value){

                                  },
                                  prefix: Icons.production_quantity_limits,
                                  hint:"quantity",




                                ),
                              ),
                            ),

                          ],

                        ),

                        const SizedBox(height: 30,),


                        const SizedBox(height:450,),
                        newDefaultButton3(function:(){
                          PharmacyHomeCubit.get(context).updateMedicinePharmacy(
                              quantity:maxController.text,

                              pharmacyMedicine_id:data[0]);

                        }, text: "update"),
                        SizedBox(height: 20,),
                        ConditionalBuilder(
                          builder: (context) => SizedBox(),
                          fallback: (context) => LinearProgressIndicator(color:
                          HexColor(green.toString()),minHeight:2,),
                          condition: state is! PhUpdateLoadingState ,


                        ),

                      ],
                    ),
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
