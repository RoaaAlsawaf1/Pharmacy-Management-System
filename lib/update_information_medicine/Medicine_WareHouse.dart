import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/update_information_medicine/Search.dart';
import 'package:pharmacy/update_information_medicine/update.dart';

class MedicineWarehouse extends StatelessWidget {
   MedicineWarehouse({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0.0,
        leadingWidth: 46,
        elevation: 0.0,
        flexibleSpace: Container(
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
              ],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            // navigateTo(widget: drawerScreen() ,context:context);
          }, icon:Icon(Icons.arrow_back,)),
        ),
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Choose the medicine  " ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: IconButton(onPressed:(){
               navigateTo( context: context,widget: Search());
            }, icon: Icon(Icons.search)),
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
        child:Padding(

          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildMedicine(context),
              separatorBuilder: (context, index) => const SizedBox(
height: 20,
              ),
              itemCount: 15),
        ),
      ),

    );

  }
  Widget buildMedicine(context) =>  InkWell(
    onTap: () {
      navigateTo(widget: Update(),context: context);
    },
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(

             height: MediaQuery.of(context).size.height*0.1,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:Colors.white.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Medicine",style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            decoration: BoxDecoration(
              color:HexColor(green.toString()),

              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(16)
              ),
            ),
            height: 30,
            width: 150,
           child: Center(child: Text("Go to update",style: TextStyle(color: Colors.white,fontSize: 12),)),

          ),
        ),
      ],

    ),
  );
}
