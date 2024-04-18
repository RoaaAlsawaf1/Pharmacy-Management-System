import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/shared/components/components.dart';

class PainRelief extends StatelessWidget {
  const PainRelief({Key? key}) : super(key: key);

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
          }, icon:const Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("8".tr,style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.normal),),
          ],
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
            child: Stack(
                alignment: Alignment.topRight,
                children:const [
                  Image(image:AssetImage("images/chest-pain-or-pressure.png"))

                ]
            ),
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
        child: SingleChildScrollView(
          child: ConditionalBuilder(
              condition: ResponsiveBreakpoints.of(context).isDesktop,
              builder: (context) => Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width*0.55,
                          height: MediaQuery.of(context).size.width*0.25,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/saffron.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("127".tr,style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width*0.55,
                          height: MediaQuery.of(context).size.width*0.25,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/Fenugreek.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("128".tr,style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width*0.55,
                          height: MediaQuery.of(context).size.width*0.25,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/basil.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("Basil",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),

                ],
              ),
              fallback:(context) => Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/saffron.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("127".tr,style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/Fenugreek.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("128".tr,style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image:const AssetImage('images/basil.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                            ),
                          ),

                        ),
                        Text("129".tr,style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                            color:Colors.white),)
                      ],
                    ),

                  ),

                ],
              ),
          )
        ),
      ),


    );
  }
}
