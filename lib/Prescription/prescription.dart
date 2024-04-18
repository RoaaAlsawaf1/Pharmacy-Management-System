import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/myPrescription/myPrescriptions.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class Prescription extends StatefulWidget {
   Prescription({Key? key}) : super(key: key);

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  File? imageFileCamera;
  var cameraController=TextEditingController();
  var galleryController=TextEditingController();
  var prescriptionController=TextEditingController();



  //صورة
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:80,
        titleSpacing: 4,
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
                HexColor('AEC9DE'),
                HexColor('BBC5CE'),
 ],
              tileMode: TileMode.clamp,

            ),
          ) ,
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:drawerScreen() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("Upload Prescription",style: TextStyle(color: Colors.black87,fontSize: 18),),
          ],
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:36,top: 24),
            child: ConditionalBuilder(condition:imageFileCamera!=null, builder:(context) =>imageProfile(context) , fallback:(context) =>  SizedBox()),
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
              HexColor('AEC9DE'),
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
          child: Column(
            children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {

                      _getFromCamera();




                    },
                    child: Container(
                      width:double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color:HexColor("E5E4E2") ,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:16 ,),
                          Icon(Icons.camera_alt,color: HexColor(green.toString()),
                            ),
                          SizedBox(width:16 ,),
                          Text("Camera",style: TextStyle(
                            color: HexColor(green.toString()),
                            fontSize: 16,
                          ),),
                          Spacer(),
                          // ConditionalBuilder(
                          //   builder:(context) =>ClipRRect(
                          //       borderRadius:BorderRadius.circular(12) ,
                          //
                          //       child: Image(image:FileImage(imageFileCamera!) as ImageProvider,
                          //         color: Colors.white.withOpacity(0.4),colorBlendMode: BlendMode.dstATop,
                          //         width: 90,
                          //
                          //       )) ,
                          //   fallback:(context) => Spacer()
                          //   ,
                          //   condition: imageFileCamera != null,
                          // ),



                          
                        ],
                      ),
                    ),
                  ),
                ),//camera
                Padding(
                  padding: const EdgeInsets.only(right:18,left: 18,bottom: 5 ),
                  child: InkWell(

                    onTap: () {

                _getFromGallery();



                    },
                    child: Container(
                      width:double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color:HexColor("E5E4E2") ,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:16 ,),
                          Icon(Icons.photo,color: HexColor(green.toString()),
                          ),
                          SizedBox(width:16 ,),
                          Text("From Gallery",style: TextStyle(
                            color: HexColor(green.toString()),
                            fontSize: 16,
                          ),),
                          Spacer(),
                          // ConditionalBuilder(
                          //   builder:(context) =>ClipRRect(
                          //       borderRadius:BorderRadius.circular(12) ,
                          //
                          //       child: Image(image:FileImage(imageFileGallery!) as ImageProvider,
                          //         color: Colors.white.withOpacity(0.4),colorBlendMode: BlendMode.dstATop,
                          //         width: 90,
                          //
                          //       )) ,
                          //   fallback:(context) => Spacer()
                          //   ,
                          //   condition:imageFileGallery != null   ,
                          // ),

                        ],
                      ),
                    ),
                  ),
                ),//from Gallery
                Padding(
                  padding: const EdgeInsets.only(right:18,left: 18,bottom: 5,top:13 ),
                  child: InkWell(
                    onTap: () {
                      Get.to(()=>MyPrescription(),
                        duration: Duration(seconds: 1),);
                    },
                    child: Container(
                      width:double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color:HexColor("E5E4E2") ,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:16 ,),
                          Icon(Icons.file_copy,color: HexColor(green.toString()),
                          ),
                          SizedBox(width:16 ,),
                          Text("My Prescription",style: TextStyle(
                            color: HexColor(green.toString()),
                            fontSize: 16,
                          ),),
                          Spacer()      ,
                          // ClipRRect(
                          //     borderRadius:BorderRadius.circular(12) ,
                          //
                          //     child: Image(image:AssetImage("images/tea.jpg",),
                          //       color: Colors.white.withOpacity(0.4),colorBlendMode: BlendMode.dstATop,
                          //       width: 90,
                          //
                          //     ))

                        ],
                      ),
                    ),
                  ),
                ),//my Prescription
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Prescription Guide",style: TextStyle(
                    fontSize: 16,


                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:24.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: HexColor(green.toString()),size: 16),
                      SizedBox(width: 10,),
                      Text("Do not crop out any part of prescription",style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey


                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:24.0,top: 12,bottom: 12),
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: HexColor(green.toString()),size: 16),
                      SizedBox(width: 10,),
                      Text("Avoid blurred images",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey


                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:24.0),
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: HexColor(green.toString()),size: 16),
                      SizedBox(width: 10,),
                      Text("include detail of doctor & patient",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey


                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:24.0,top: 12),
                  child: Row(
                    children: [
                      Icon(Icons.settings,color: HexColor(green.toString()),size: 16),
                      SizedBox(width: 10,),
                      Text("Medicine will deliver as per prescription",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey


                      ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0,top: 24),
                  child: Container(height: 200,width: 200 ,child: LottieBuilder.asset('images/124405-prescription.json',fit:BoxFit.cover)),
                ),//image

              ],
            )
             // Container(height: 150,width: 500 ,child: LottieBuilder.asset('images/prescription.json',)),

            ],
          ),
        ),
      ),


    );
  }

  Widget imageProfile(context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[//confirmation
          CircleAvatar(
            radius: 20.0,
            backgroundImage: imageFileCamera != null
                ? FileImage(imageFileCamera!) as ImageProvider
                : AssetImage("images/p.jpeg"),
          ),
          SizedBox(height:60,
              child: LottieBuilder.asset('images/confirmation.json',fit:BoxFit.cover,width: 40,height: 40,)),

        ],
      ),
    );
  }

  _getFromGallery() async {
    var picker=ImagePicker();
    PickedFile?image;
    image=await picker.getImage(source: ImageSource.gallery);

    if (image!.path.isEmpty==false) {
      setState(() {
        imageFileCamera = File(image!.path);

      });
      // bytes=File(image!.path).readAsBytesSync();
      // img64=base64Encode(bytes!);

    }

  }

  /// Get from Camera
  _getFromCamera() async {
    var picker=ImagePicker();
    PickedFile?image;
    image=await picker.getImage(source: ImageSource.camera);

    if (image!.path.isEmpty==false) {
      setState(() {
        imageFileCamera = File(image!.path);

      });
      // bytes=File(image!.path).readAsBytesSync();
      // img64=base64Encode(bytes!);

    }
  }
}
