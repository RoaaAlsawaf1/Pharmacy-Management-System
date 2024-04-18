import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy/Pill_Reminder/Medicine.dart';
import 'package:pharmacy/Pill_Reminder/pill_reminder.dart';
import 'package:pharmacy/Pill_Reminder/global_bloc.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class MedicineDetail extends StatelessWidget {
  const MedicineDetail(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc=Provider.of<GlobalBloc>(context);
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
//         title:  Text("99".tr,
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.black87)),
//         leading: IconButton(
//             onPressed: () {
//               navigateAndFinish(context: context, widget: const PillReminder());
//             },
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black87,
//               size: 14,
//             )),
//       ),
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
          child:  Text("99".tr,
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
              )),
        ),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateAndFinish(context: context, widget: const PillReminder());
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
          child: Padding(
            padding: const EdgeInsets.only(top: 160.0,left: 16,right: 16),
            child: Container(
              height: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   MainSection(medicine: medicine,),
                   ExtendedSection(
                    medicine: medicine,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  newDefaultButton(
                      function: () {
                        openAlterBox(context,_globalBloc);
                      },
                      text: "100".tr,
                      isAppbar: false)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // delete
  openAlterBox(BuildContext context,GlobalBloc _globalBloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text(
            "101".tr,
            textAlign: TextAlign.center,
            style: TextStyle(color: HexColor(green.toString())),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child:  Text(
                "102".tr,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                _globalBloc.removeMedicine(medicine);
                navigateAndFinish(context: context,widget: PillReminder());              },
              child:  Text(
                "103".tr,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        );
      },
    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  Hero makeIcon(){
    if(medicine.medicineType=='bottle'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/capsules.png", width: 200,
        height: 200,));

    }
    else if(medicine.medicineType=='pill'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/pills.png", width: 200,
        height: 200,));

    }
    else if(medicine.medicineType=='tablet'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/tablets.png", width: 200,
        height: 200,));

    }
    else if(medicine.medicineType=='syringe'){
      return Hero(tag: medicine.medicineName!+medicine.medicineType!, child:Image.asset( "images/vaccine.png", width: 200,
        height: 200,));

    }
    return Hero(tag: medicine.medicineName!+medicine.medicineType!, child: Image.asset( "images/error.png", width: 200,
      height: 200,));
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        makeIcon(),
      ],
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ExtendedInfoTap(
              fieldTitle: "104".tr, fieldInfo: medicine.medicineName!),
          ExtendedInfoTap(
              fieldTitle: "105".tr,
              fieldInfo: medicine.dosage == 0
                  ? "106".tr
                  : "${medicine.dosage!} ${"107".tr}"),
          ExtendedInfoTap(
              fieldTitle: "108".tr, fieldInfo: medicine.medicineType=="109".tr?"110".tr:medicine.medicineType!),
           ExtendedInfoTap(

              fieldTitle: "111".tr, fieldInfo:medicine.interval==1?
           "  ${"98".tr}${medicine.interval}${"112".tr}": "${"98".tr} ${medicine.interval} ${"113".tr}"
               " ${medicine.interval==24?"114".tr:"${(24/medicine.interval!).floor() } ${"115".tr}"}" ),
           ExtendedInfoTap(fieldTitle: "116".tr,
               fieldInfo:'${medicine.startTime![0]}${medicine.startTime![1]}:${medicine.startTime![2]}${medicine.startTime![3]}'),
        ],
      ),
    );
  }
}

class MainInfoTap extends StatelessWidget {
  const MainInfoTap(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: GoogleFonts.poppins(
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedInfoTap extends StatelessWidget {
  const ExtendedInfoTap(
      {Key? key, required this.fieldTitle, required this.fieldInfo})
      : super(key: key);
  final String fieldTitle;
  final String fieldInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            fieldInfo,
            style: const TextStyle(fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
