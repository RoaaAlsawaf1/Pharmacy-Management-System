import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy/Pill_Reminder/Medicine.dart';
import 'package:pharmacy/Pill_Reminder/global_bloc.dart';
import 'package:pharmacy/Pill_Reminder/medicine_detail.dart';
import 'package:pharmacy/Pill_Reminder/new_entry.dart';
import 'package:pharmacy/myOrder/My_Order.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

import '../Home/home.dart';

class PillReminder extends StatefulWidget {

  const PillReminder({Key? key}) : super(key: key);

  @override
  State<PillReminder> createState() => _PillReminderState();
}

class _PillReminderState extends State<PillReminder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         titleSpacing: 0.0,
//         leadingWidth: 70,
//         elevation: 0.0,
//         flexibleSpace: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//                 HexColor('A8BEE7'),
//                 HexColor('AEC9DE'), //gray light
// //gray dark
//                 HexColor('BBC5CE'),
//               ],
//               tileMode: TileMode.clamp,
//             ),
//           ),
//         ),
//         title: Text("68".tr,style: TextStyle( color: Colors.black87)),
//         leading:Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: IconButton(onPressed: () {
//             navigateTo(widget:drawerScreen() ,context:context);
//           }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
//         )
//         ,  ),
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
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child:  Text("68".tr,
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
              )),
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:drawerScreen() ,context:context);
            }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
        ),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              HexColor('BDB9C7'), //
              HexColor('D3C8CC'),
              HexColor('D3CACF'),
              HexColor('DBD9DE'),
              HexColor('D7D2D8'),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top:120),
            child: Container(
              height: 10000,
              child: Column(
                children: [
                  const Flexible(child: BottomContainer()),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewEntry(),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 32),
          child: Card(
            color: HexColor(green.toString()),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.add, size: 55, color: Colors.white),
          ),
        ),
      ),
    );
  }

}
class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    // return Center(child: Text("No Medicine",textAlign:TextAlign.center,style: Theme.of(context).textTheme.headline3,));
    return StreamBuilder(
      stream: globalBloc.medicineList!,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else if (snapshot.data!.isEmpty) {
          return  Padding(
            padding: const EdgeInsets.only(top:300.0),
            child: Text(
              "72".tr,style: TextStyle(fontSize: 14),
            ),
          );
        } else {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MedicineCard(
                medicine:   snapshot.data![index],
              );
            },
          );
        }
      },
    );
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({Key? key, required this.medicine}) : super(key: key);
  //for getting the current details of the save item
  final Medicine medicine;
  //lets make a function for image
  Hero makeIcon(){
    if(medicine.medicineType=='bottle'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/capsules.png", width: 100,
        height: 100,));

    }
    else if(medicine.medicineType=='pill'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/pills.png", width: 100,
        height: 100,));

    }
    else if(medicine.medicineType=='tablet'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/tablets.png", width: 100,
        height: 100,));

    }
    else if(medicine.medicineType=='syringe'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/vaccine.png", width: 100,
        height: 100,));

    }
    return Hero(tag: medicine.medicineName!+medicine.medicineType!, child: Image.asset( "images/error.png", width: 100,
      height: 100,));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder<void>(pageBuilder:(context, animation, secondaryAnimation) {
          return AnimatedBuilder(animation: animation, builder:(context, child) {
            return Opacity(opacity:animation.value,child: MedicineDetail(medicine),);
          },
          );
        },transitionDuration: const Duration(milliseconds: 500),));
        // navigateTo(context: context, widget: MedicineDetail());
      },
      child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            color: HexColor("E6E3E8"),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                // call the function here icon type
                makeIcon(),

                const Spacer(),
                Hero(
                  tag:medicine.medicineName!,
                  child: Text(medicine.medicineName!,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.w600)),
                ),
                Text(


                  medicine.interval==1?"${"98".tr} ${medicine.interval} ${"96".tr}":"${"98".tr} ${medicine.interval} ${"97".tr}",
                  style:  TextStyle(fontSize: 10),
                ),
              ],
            ),
          )),
    );
  }
}
