import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/background_image.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class Cough extends StatelessWidget {

   ImageProvider  image1= AssetImage('images/malisaa.jpg');
   ImageProvider image2= AssetImage('images/chamomile.jpg');
   ImageProvider image3=AssetImage('images/flowers.jpg');




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
             navigateTo(widget:drawerScreen() ,context:context);
           }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        )
        ,
        title:Row(
          children: [
            Text("Cough",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.normal),),
          ],
        ) ,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
            child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(image:AssetImage("images/dry-cough.png"))

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
          child: ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowPadding: EdgeInsets.all(30),

            layout: ResponsiveBreakpoints.of(context).isDesktop
            ?ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN
            ,
            children:[
         ResponsiveRowColumnItem(
             child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: image1 ,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                  ),
                ),

              ),
              Text("Malisa",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                  color:Colors.white),)
            ],
          ),

        ),rowFlex: 1 )      ,
      ResponsiveRowColumnItem(child:    Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: AssetImage('images/chamomile.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                        ),
                      ),

                    ),
                    Text("Chamomile",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                        color:Colors.white),)
                  ],
                ),

              ),rowFlex: 1),
      ResponsiveRowColumnItem(child:    Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        image: DecorationImage(
                          image: image3,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.35),BlendMode.dstATop),

                        ),
                      ),

                    ),
                    Text("Flowers",style:GoogleFonts.abhayaLibre(fontSize:54,fontWeight: FontWeight.bold,
                        color:Colors.white),)
                  ],
                ),

              ),rowFlex: 1,),

            ],
          ),
        ),
      ),


    );
  }

}
