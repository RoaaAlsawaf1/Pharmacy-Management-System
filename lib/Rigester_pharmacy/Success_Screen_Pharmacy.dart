import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/login/cubit.dart';
import 'package:pharmacy/login/states.dart';

import 'package:pharmacy/shared/components/components.dart';

class SuccessScreen extends StatefulWidget {

  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}


class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState(){

    Timer(Duration(
      milliseconds: 3000
    ), () { navigateAndFinish(context: context,widget: drawerScreen());});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyLoginCubit,PharmacyLoginStates>(

     listener:(context, state) {
       if(state is PharmacyWSuccessState){
         if(state.value==200){
           PharmacyLoginCubit.get(context).getPharmacyAndWarehouse();

         }
       }
     },
      builder:(context, state) {
        return Scaffold(
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
            child: Center(
                child: LottieBuilder.asset('images/Success_check.json',fit:BoxFit.cover)
            ),
          ),
        );
      },
    );
  }
}
