




import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/constant_sana.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:pharmacy/Medicen/medicant_page.dart';
import 'package:pharmacy/shared/components/constant.dart';

class PharmacyPage  extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
          extendBodyBehindAppBar: true,
          appBar:  AppBar(
            leadingWidth:double.infinity,
            leading: Row(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        navigateAndFinish(context: context,widget: drawerScreen());
                      }, icon:Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),size: 25,) ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(  " ${CacheHelper.getData(key: "name_pharmacy_home")}",

                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.grey.shade800
                              ),
                            ),//
                            SizedBox(height: 10,),
                            Row(

                              children: [
                                Icon(Icons.numbers_outlined,color:HexColor(green.toString()),size: 15,),
                                SizedBox(width: 2,),
                                Text(CacheHelper.getData(key:"number_pharmacy_home"),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade600
                                  ),
                                ),
                              ],),
                          ],
                        ),
                      ),// location


                    ]    ),
                Spacer(),

              ],
            ),// icon go back



            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(color: Colors.transparent,),
              ),
            ),

            backgroundColor:Colors.white.withAlpha(100) ,
            toolbarHeight: 130,
            elevation: 0,

          ),
          body:

          Container(

              decoration: gradientBackground,
              child:

              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: 1000000,
                  child: Column(
                    children: [
                    ConditionalBuilder(
                        condition: state is!GetPharmacyMedicineInHomeLoadingState,
                        builder: (context) =>   GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(30, 190, 30, 20),
                          shrinkWrap: true,
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount:
                            MediaQuery.of(context).size.width > 800
                                ?4
                                :
                            MediaQuery.of(context).size.width > 500
                                ?3
                                :2,
                            crossAxisSpacing:
                            24.0,
                            mainAxisSpacing: 16.0,//مسافة يلي تحت
                            mainAxisExtent:
                            MediaQuery.of(context).size.width > 400
                                ?250
                                : 270,

                          ),
                          itemCount:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines!.length,

                          itemBuilder: (_, index) {
                            return
                              GestureDetector(

                                  onTap: (){
                                    print(PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![0].medicine!.medicinePhotoPath);
                                    CacheHelper.saveData(key:"name_medicine_one_en",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.tradeNameEn);
                                    CacheHelper.saveData(key:"name_medicine_one_ar",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.tradeNameAr);
                                    CacheHelper.saveData(key:"description_medicine_one_ar",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.descriptionAr);
                                    CacheHelper.saveData(key:"description_medicine_one_en",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.descriptionEn);
                                    CacheHelper.saveData(key:"price_medicine_one",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.commercialPrice);
                                    CacheHelper.saveData(key:"part_medicine_one",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.parts);
                                    CacheHelper.saveData(key:"id_m_h_p",
                                        value:PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.id);



                                    Get.to(() => medicinePage(), arguments: [
                                      PharmacyHomeCubit
                                          .get(context).onePage.pharmacyMedicines![index].medicine!.medicinePhotoPath
                                    ]);
                                    PharmacyHomeCubit.get(context).getAllMedicineSemailInHome(id:PharmacyHomeCubit
                                        .get(context).onePage.pharmacyMedicines![index].medicine!.id);
                                    print(CacheHelper.getData(key: "id_m_h_p"));
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
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              16.0,
                                            ),
                                            gradient: LinearGradient(
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
                                            condition:PharmacyHomeCubit
                                                .get(context).onePage.pharmacyMedicines![index].medicine!.medicinePhotoPath==null ,
                                            builder: (context) =>Image(image:AssetImage("images/imagesnotfound.png"),height:
                                            MediaQuery.of(context).size.height > 400
                                                ? 150
                                                :170,
                                              width: double.infinity,
                                              fit: BoxFit.cover,),
                                            fallback: (context) => Image(image:NetworkImage("http://192.168.43.142:8000/${PharmacyHomeCubit
                                                .get(context).onePage.pharmacyMedicines![index].medicine!.medicinePhotoPath}"),height:
                                            MediaQuery.of(context).size.height > 400
                                                ? 150
                                                :170,
                                              width: double.infinity,
                                              fit: BoxFit.cover,),)

                                            ),

                                            Padding(
                                              padding:  EdgeInsets.only(top: 8, left: 8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.tradeNameEn}",
                                                    style: Theme.of(context).textTheme.subtitle1!.merge(
                                                      TextStyle(
                                                       // fontWeight: FontWeight.w500,
                                                        // fontSize: 16.sp
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Text(
                                                    "${PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.tradeNameAr}",
                                                    style: Theme.of(context).textTheme.subtitle1!.merge(
                                                      TextStyle(
                                                        color: Colors.grey.shade700,

                                                        //  fontSize: 14.sp
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),


                                                  Text(
                                                    "${PharmacyHomeCubit.get(context).onePage.pharmacyMedicines![index].medicine!.commercialPrice}",
                                                    style: Theme.of(context).textTheme.subtitle2!.merge(
                                                      TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        // fontSize: 16.sp
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
                                          height: 30,
                                          width: 60,
                                          decoration: BoxDecoration(

                                            borderRadius: BorderRadius.only(topLeft:Radius.circular(16.0) ,bottomRight:Radius.circular(16.0) ),
                                            color: greentheem
                                            ,
                                          ),
                                          child:  Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ), )
                                    ],
                                  )
                              );
                          },


                        ),
                        fallback: (context) =>Center(child: CircularProgressIndicator(color: HexColor(green),)) ,)
                    ],
                  ),
                ),
              )

            // CustomScrollView(
            //
            //   slivers: [
            // SliverAppBar(
            //
            //   title: Text('HealthStore'),
            //
            //   backgroundColor: fifthBackColor.withAlpha(10),
            //  // floating: true,
            //   pinned: true,
            //   automaticallyImplyLeading: false,
            //   expandedHeight: 140,
            //   toolbarHeight: 140,
            // ),
            //     ListView(
            //
            //   children: [
            //     GridView.count(crossAxisCount: 2,
            //       physics: ClampingScrollPhysics(),
            //       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            //       shrinkWrap: true,
            //       mainAxisSpacing: 20,
            //       crossAxisSpacing: 20,
            //      children: List.generate(10, (index) =>
            //          CategoryCard(width: 0,
            //              height: 0,
            //              text: 'Petroxine 32',
            //              ontap: (){},
            //              img:'assets/images/mi.jpg' ,
            //              pharmacyname: 'HealthStore',
            //              price: "3.50")
            //      ),
            //     )
            //   ],
            // )
            // ],
          )
          ,);
      },
    );

   // );

 }

}

final List<Map<String, dynamic>> gridMap = [
  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },
  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },
  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },
  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },
  {
    "title": 'Petroxine 32',
    "price": "\$25",
    "images":
    'images/mi.jpg',
  },




];

