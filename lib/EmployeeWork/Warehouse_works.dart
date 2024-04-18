import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/EmployeeWork/WareHousModel.dart';

import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';

import '../shared/components/components.dart';
import '../shared/components/constant.dart';
import 'OrderWarehouseWork.dart';

class WareHouseWorks extends StatefulWidget {
  const WareHouseWorks({Key? key}) : super(key: key);

  @override
  State<WareHouseWorks> createState() => _WareHouseWorksState();
}

class _WareHouseWorksState extends State<WareHouseWorks> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return  Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child:  Text("Warehouse Where I Work",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateTo(context: context,widget: drawerScreen());
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
              physics:  BouncingScrollPhysics(),
              child: Column(

                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 4000,
                      child: ConditionalBuilder(
                        builder: (context) => ConditionalBuilder(
                          condition: PharmacyHomeCubit.get(context).jobwarehousesEmployee.jobwarehouses!.isNotEmpty,
                          builder: (context) => ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder:(context, index) => Pharma(context,PharmacyHomeCubit.get(context).jobwarehousesEmployee.jobwarehouses![index]),
                              separatorBuilder:(context, index) => const SizedBox(height: 10),
                              itemCount: PharmacyHomeCubit.get(context).jobwarehousesEmployee.jobwarehouses!.length),
                          fallback: (context) => Padding(
                            padding: const EdgeInsets.only(top:400.0),
                            child: Text("There are no Warehouse",style:TextStyle(color: Colors.grey,fontSize: 20) ,),
                          ),),
                        fallback: (context) =>Center(child: CircularProgressIndicator(color:  HexColor(green.toString()))),
                        condition:state is !WarehouseIWorksLoadingState  ,


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
  Widget Pharma(context,Jobwarehouses jobwarehouses) => InkWell(
    onTap: () {
      CacheHelper.saveData(key:"idWEmployee", value:   jobwarehouses.id);



      if(jobwarehouses.validated==0){
        showToast(text: "Waiting for verification", state: ToastStates.EROOR);
      }
      else{
        Get.to(() => OrderWarehouseWork(), arguments: [

       PharmacyHomeCubit.get(context).getDis(),
      PharmacyHomeCubit.get(context).getOrderWarehouse(id:jobwarehouses.id),

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

              color: Colors.white.withOpacity(0.1),
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

                                Text("Pharamcy :",overflow: TextOverflow.ellipsis),
                                Spacer(),
                                Text(" ${jobwarehouses.warehouseName!}",overflow: TextOverflow.ellipsis),

                               // Text("Pharamcy :${jobwarehouses.warehouseName!}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500),),


                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("Number :",overflow: TextOverflow.ellipsis,),
                                Spacer(),
                                Text("${jobwarehouses.number!}",overflow: TextOverflow.ellipsis,),

                               // Text("Number :${jobwarehouses.number!}",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500)),

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
              color:jobwarehouses.validated==0?Colors.grey[400] :HexColor(green.toString()),

              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)
              ),
            ),
            height: 30,
            width: 150,
            child:  Center(
              child: Text(jobwarehouses.validated==0?"Waiting for verification":"investigator",style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
              )),
            ),

          ),
        ]),
  );
}
