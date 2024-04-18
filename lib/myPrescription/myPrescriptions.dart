import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Prescription/prescription.dart';
import 'package:pharmacy/myPrescription/one_prescription.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class MyPrescription extends StatelessWidget {
  const MyPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        titleSpacing: 8,
        leadingWidth: 58,
        elevation: 0.0,
        flexibleSpace: Container(
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



              ],
              tileMode: TileMode.clamp,

            ),
          ) ,
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:Prescription() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("My Prescription",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.normal),),
          ],
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: LottieBuilder.asset("images/124405-prescription.json",width: 40,height: 40,),
          )
        ],

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder:(context, index) => pharma(),
              separatorBuilder:(context, index) => SizedBox(),
              itemCount: 10),
        ),
      ),


    );
  }
  Widget pharma()=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(

      onTap: () {



         Get.to(OnePrescription(), duration: Duration(seconds: 1));
      },
      child: AspectRatio(
        aspectRatio: 16/4.5,
        child: Container(
          // width: 360,
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:HexColor("E5E4E2").withOpacity(0.5),

          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(

                  child: Image(image:AssetImage("images/pharmacy.jpg")),
                  borderRadius:BorderRadius.all(Radius.circular(16) ) ,
                ),
              ),
              SizedBox(width: 34),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("10 April 21 || 5:00 am",style: TextStyle(
                      fontSize: 14,

                  ),),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      SizedBox(height: 5,),
                       Container(
                         width: 100,
                         height: 30,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                           color:HexColor(green.toString()),
                         ),
                         child: TextButton(onPressed:() {

                         }, child: Text("Submitted",style: TextStyle(color: Colors.white,fontSize: 12)),),
                       )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
