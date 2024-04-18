

import 'dart:async';
import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/make_order/button_screen.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQr_Pharmacy extends StatefulWidget{

  @override
  State<GenerateQr_Pharmacy> createState() {
    return _GenerateQr_Pharmacy();
  }
}

class _GenerateQr_Pharmacy extends State<GenerateQr_Pharmacy> {

@override
  void initState() {
  PharmacyHomeCubit.get(context).getQRCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener:(context,state) {
        

      },
      builder:(context,state)  {
      var qrcode = PharmacyHomeCubit.get(context).Qrcode;


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
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child:  Text("Phamacy QR Code",
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: Colors.black,
                  )),
            ),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {
                navigateAndFinish(context: context,widget: Button());
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
              physics: const BouncingScrollPhysics(),

              child: Container(
                height: 1000,
                child: Column(
                 children:[
                   SizedBox(height:300,),

                   Padding(
                     padding: const EdgeInsets.all(40.0),
                     child:   ConditionalBuilder(
                     condition: state is !generatePharmacy_QR_CubitLoadingState ,
                     builder: (context) => QrImageView(
                         data: qrcode,
                         version: QrVersions.auto,
                         size: 200.0,
                         backgroundColor: Colors.white,
                       ),

                     fallback: (context) =>
                     const Center(child: CircularProgressIndicator()),
                   )),
                 ]
                ),
              ),


            ),
          ),

        );

      },
    );



  }



}
