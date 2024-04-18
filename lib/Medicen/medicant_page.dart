

import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';

import 'package:pharmacy/Medicen/pharmace_medisants.dart';
import 'package:pharmacy/combonants.dart';
import 'package:pharmacy/constant_sana.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

class medicinePage  extends StatelessWidget{


  var data=Get.arguments;
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          // extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: const BackButton(color: Colors.black,),


              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                  child: Container(color: Colors.transparent,),
                ),
              ),

              backgroundColor:Colors.white.withAlpha(100) ,
              elevation: 0,
              toolbarHeight: 90,

            ),
            body:

            Container(

                decoration: BoxDecoration(

                    image:data[0]==null?DecorationImage(image:AssetImage('images/imagesnotfound.png',),alignment: Alignment.topCenter ,scale: 1 ):
                    DecorationImage(image:NetworkImage(
                      "http://192.168.43.142:8000/${data[0]}"
                        ""),alignment: Alignment.topCenter ,scale: 2.5 ),
                   // image: DecorationImage(image:AssetImage('images/imagesnotfound.png',),alignment: Alignment.topCenter ,scale: 2.5 ) ,

                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,


                        colors: [
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          fourthBackColor,
                          fifthBackColor,
                          sixBackColor,
                          seventhBackColor,
                          eightBackColor,


                        ]
                    )

                ),
                child:
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.4,),
                    FrostedGlassBox(theWidth: MediaQuery.of(context).size.width, theHeight:
                    200.0, theChild:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(

                          child: Row(
                            children: [
                              Text(
                                "Medicine",style: TextStyle(
                                fontWeight: FontWeight.w500,
                                // fontSize: 23.sp,
                              ),),
                              Spacer(),
                              Text(
                                CacheHelper.getData(key:"name_medicine_one_en" ),style: TextStyle(
                                fontWeight: FontWeight.w400,
                                // fontSize: 23.sp,
                              ),),
                              SizedBox(width: 4,),
                              Text(
                                CacheHelper.getData(key:"name_medicine_one_ar" ),style: TextStyle(
                                fontWeight: FontWeight.w400,
                                // fontSize: 23.sp,
                              ),),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Expanded(

                          child: Row(
                            children: [
                              // Text("Description"
                              //   ,style: TextStyle(
                              //     fontWeight: FontWeight.w500,
                              //     //  fontSize: 15.sp
                              //   ),),
                              // Spacer(),
                              // Text(CacheHelper.getData(key:"description_medicine_one_en" )
                              //   ,style: TextStyle(
                              //     fontWeight: FontWeight.w400,
                              //   //  fontSize: 15.sp
                              //   ),),
                              // SizedBox(height: 5,),
                              // Text(CacheHelper.getData(key:"description_medicine_one_ar")
                              //   ,style: TextStyle(
                              //     fontWeight: FontWeight.w400,
                              //     //  fontSize: 15.sp
                              //   ),),
                            ],
                          ),
                        ),
                      ],
                    )
                    ),
                    FrostedGlassBox(theWidth: MediaQuery.of(context).size.width, theHeight: 140.0,paddinbottom: 5.0, theChild:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text('Price'
                              ,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                //  fontSize: 15.sp,
                              ),),
                            const SizedBox(height: 10,),
                            Text("${CacheHelper.getData(key:"price_medicine_one")}"
                              ,style: TextStyle(
                                fontWeight: FontWeight.w800,
                                //  fontSize: 16.sp
                              ),),
                          ],

                        ),const SizedBox(width: 100,),
                        Column(
                          children: [
                            Text('Pack of'
                              ,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                // fontSize: 15.sp,
                              ),),
                            const SizedBox(height: 10,),
                            Text('${CacheHelper.getData(key: "part_medicine_one")} tablets'
                              ,style: TextStyle(
                                fontWeight: FontWeight.w800,
                                //   fontSize: 16.sp
                              ),),
                          ],
                        ),



                      ],
                    )
                    ),
                    FrostedGlassBox(theWidth: MediaQuery.of(context).size.width, theHeight: 120.0,paddinleft: 0.0, paddinbottom: 0.0,paddintop: 0.0,theChild:
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(

                            borderRadius:  const BorderRadius.only(
                              topLeft: Radius.circular(16.0),bottomLeft: Radius.circular(16.0),
                            ),
                            child: Image.asset('images/pharmacy.jpg' ,width: 100,height: 100,)
                        ),

                        const SizedBox(width:30,),
                        Column(
                          children: [
                            const SizedBox(height: 20,),
                            Text(CacheHelper.getData(key: "name_pharmacy_home")
                              ,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                //   fontSize: 23.sp,
                              ),),
                            const SizedBox(height: 10,),
                            Text('sellers available'
                              ,style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                //    fontSize: 16.sp
                              ),),
                          ],
                        ),



                      ],
                    )
                    ),
                    const SizedBox(height: 20,),
                    Text('     Semilar Items'
                      ,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800,
                        // fontSize: 23.sp,
                      ),),
                    const SizedBox(height: 20,),

                    ConditionalBuilder(
                      condition:state is!GetPharmacyMedicineSemilarInHomeLoadingState ,
                      builder: (context) => GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          shrinkWrap: true,
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:     MediaQuery.of(context).size.width > 800
                                ?4
                                : MediaQuery.of(context).size.width > 500
                                ?3
                                :2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            mainAxisExtent:  MediaQuery.of(context).size.width > 400
                                ?250
                                :270,
                          ),
                          itemCount: PharmacyHomeCubit.get(context).alternativesMedicine.alternatives!.length,
                          itemBuilder: (_, index) {
                            return    GestureDetector(
                                onTap: (){

                                },
                                child:
                                Stack(
                                  children: [

                                    Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withAlpha(50),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,

                                              colors: [
                                                fourthBackColor,
                                                fourthBackColor,
                                                fourthBackColor,
                                                fourthBackColor,
                                                thirdBackColor,
                                                secondBackColor,


                                              ]
                                          )
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          ClipRRect(

                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(16.0),
                                              topRight: Radius.circular(16.0),
                                            ),
                                            child:
                                            ConditionalBuilder(
                                              condition: PharmacyHomeCubit.get(context).alternativesMedicine.alternatives![index].medicine!.medicinePhotoPath!=null,
                                              builder: (context) => Stack(
                                                  alignment: Alignment.bottomCenter,
                                                  children:[
                                                    Image(image:NetworkImage("http://192.168.43.142:8000/${PharmacyHomeCubit.get(context).alternativesMedicine.alternatives![index].medicine!.medicinePhotoPath}"),height:
                                                    MediaQuery.of(context).size.height > 400
                                                        ? 150
                                                        :170,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,),


                                                  ]


                                              ),
                                              fallback: (context) => Stack(
                                                  alignment: Alignment.bottomCenter,
                                                  children:[
                                                    Image(image:AssetImage("images/imagesnotfound.png"),height:
                                                    MediaQuery.of(context).size.height > 400
                                                        ? 150
                                                        :170,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,),


                                                  ]


                                              ),),
                                          ),

                                          Padding(
                                            padding:  const EdgeInsets.only(top: 8, left: 8),
                                            child:


                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [


                                                Text(
                                                  "${PharmacyHomeCubit.get(context).alternativesMedicine.alternatives![index].medicine!.tradeNameEn}",
                                                  style: Theme.of(context).textTheme.subtitle1!.merge(
                                                    const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      //   fontSize: 16.sp
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  "${PharmacyHomeCubit.get(context).alternativesMedicine.alternatives![index].medicine!.tradeNameAr}",
                                                  style: Theme.of(context).textTheme.subtitle1!.merge(
                                                    TextStyle(
                                                      color: Colors.grey.shade700,

                                                      // fontSize: 14.sp
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                Text(
                                                  "${PharmacyHomeCubit.get(context).alternativesMedicine.alternatives![index].medicine!.commercialPrice}",
                                                  style: Theme.of(context).textTheme.subtitle2!.merge(
                                                    const TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      //   fontSize: 16.sp
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom:0,
                                      right : 0,
                                      child:Container(
                                        height: 40,
                                        width: 60,
                                        decoration: const BoxDecoration(

                                          borderRadius: BorderRadius.only(topLeft:Radius.circular(16.0) ,bottomRight:Radius.circular(16.0) ),
                                          color: greentheem
                                          ,
                                        ),
                                        child:  const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ), )
                                  ],
                                )
                            );
                          }
                      ) , fallback: (context) =>CircularProgressIndicator(),)

                  ],
                )



            )
        );
      },
    );

    // );

  }

}