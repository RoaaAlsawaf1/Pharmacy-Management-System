import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Prescription/prescription.dart';
import 'package:pharmacy/myPrescription/myPrescriptions.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class OnePrescription extends StatelessWidget {
  const OnePrescription({Key? key}) : super(key: key);

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
            navigateTo(widget:MyPrescription() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("My Prescription",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.normal),),
          ],
        ) ,

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
        child:Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: ClipRRect(
                  child: Image(image: AssetImage("images/pharmacy.jpg")),
                borderRadius: BorderRadius.all(Radius.circular(8)),

              )),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: 370,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color:HexColor("E5E4E2").withOpacity(0.5),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text("Order Status",style: TextStyle(
                        fontSize: 18,


                      ),),
                        Spacer(),
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
                  ),
                ),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
