

import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class SearchMedicine extends StatefulWidget {
   SearchMedicine({Key? key}) : super(key: key);

  @override
  State<SearchMedicine> createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  var searchController = TextEditingController();

  var data=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        //var searchlist = PharmacyHomeCubit.get(context).SearchMedicinesPharmacy;

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
          //     }, icon:Icon(Icons.arrow_back,)),
          //   ),
          //   title: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Text("Search " ),
          //   ),
          //
          //
          //
          // ),
          extendBodyBehindAppBar: true,
          appBar:   AppBar(
            toolbarHeight: 160,
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
                  padding: const EdgeInsets.only(top: 16.0,left: 8),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        navigateAndFinish(context: context,widget:  drawerScreen());
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text("Search",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.grey.shade800,
                        )),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0,left:15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      defaultSearch(
                        controller: searchController,
                        label: "Search for medicine",
                        // width:MediaQuery.of(context).size.width,
                        // height:MediaQuery.of(context).size.height*0.06,
                        type: TextInputType.text,
                        prefix: Icons.search_rounded,
                        onChange: (value) {
  PharmacyHomeCubit.get(context).getSearchHome(value: value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Search for medicine';
                          }
                          else {
                            return null;
                          }
                        },
                      )
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
              gradient: LinearGradient(

                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

                colors: [
                  HexColor('A8BEE7'),
                  HexColor('AEC9DE'), //gray light
                  //gray dark
                  HexColor('BBC5CE'),
                  HexColor('BDB9C7'), //
                  HexColor('D3C8CC'),
                  HexColor('D3CACF'),
                  HexColor('DBD9DE'),
                  HexColor('D7D2D8'),

                ],
                tileMode: TileMode.clamp,

              ),

            ),

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  //Text
                  //pharmacy
                  Padding(
                      padding: const EdgeInsets.all(32.0),
                      child:
                      ConditionalBuilder(
                        condition: state is !GetSearchHomeInHomeLoadingState ,
                        builder: (context) =>
                            Container(
                              height:10000,
                              width: double.infinity,
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:(context, index) {
                                    return
                                      Stack(
                                        alignment: AlignmentDirectional.bottomEnd,
                                        children: [

                                          Container(

                                            //height: MediaQuery.of(context).size.height*0.3,
                                            width: double.infinity,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color:Colors.white.withOpacity(0.2),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(24.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text("Medicine ",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                                                      const Spacer(),
                                                      Expanded(

                                                        child: Text("  ${PharmacyHomeCubit.get(context).SearchMedicinesHome[index]["trade_name_en"]}"
                                                            ,style: const TextStyle(fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text("Description ",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                                                       const Spacer(),
                                                       Expanded(

                                                         child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesHome[index]["description_en"]}"
                                                            ,style: const TextStyle(fontSize: 12)),
                                                       ),
                                                     ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  const Row(
                                                    children:  [
                                                      Expanded(
                                                        child: Divider(),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                                        child: Text(
                                                          "Ar",
                                                          style: TextStyle(
                                                              color: Colors.black38,
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(child: Divider()),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text("الدواء ",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                                                      const Spacer(),
                                                      Expanded(

                                                        child: Text("  ${PharmacyHomeCubit.get(context).SearchMedicinesHome[index]["trade_name_ar"]}"
                                                            ,style: const TextStyle(fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text("الوصف ",style: TextStyle(fontSize: 14,fontWeight:FontWeight.w500)),
                                                      const Spacer(),
                                                      Expanded(

                                                        child: Text("${PharmacyHomeCubit.get(context).SearchMedicinesHome[index]["description_ar"]}"
                                                            ,style: const TextStyle(fontSize: 12)),
                                                      ),
                                                    ],
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),


                                        ],

                                      );


                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                                  itemCount: PharmacyHomeCubit.get(context).SearchMedicinesHome.length
                              ),
                            ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      )
                  ),

                ],
              ),


            ),
          ),

        );
      },
    );
  }
}
