import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/login/cubit.dart';
import 'package:pharmacy/login/login_screen.dart';
import 'package:pharmacy/login/states.dart';
import 'package:pharmacy/shared/components/constant.dart';


import '../../../shared/components/components.dart';

class PasswordScreen extends StatelessWidget {
 var passwordController =TextEditingController();

 var confirmPasswordController =TextEditingController();

 var formKey=GlobalKey<FormState>();
 var data=Get.arguments;
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
      listener: (context, state) {
        if(state is UserSuccessPatchForgetState)//نجاح او فشل التسجيل
            {

          if(state.value==200) {

            navigateTo(widget: Login(),context: context);
          }


        }
        if(state is UserErrorPatchForgetState){
          if(state.error==422) {
            showToast(text:"The confirm password field must match password" ,state: ToastStates.EROOR);

          }
          showToast(text:"error" ,state: ToastStates.EROOR);
        }

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title:  Text("27".tr,style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400
              ),),
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

            ),
            body:  Container(
              height:MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
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
              child:SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Forgot passwors?",style: TextStyle(
                      //    fontWeight: FontWeight.w400,
                      //    fontSize: 24,
                      //    color: HexColor(green),
                      //  ),),
                      SizedBox(
                        height: 16,
                      ),
                      Text("28".tr
                        ,style: TextStyle(
                          color: Colors.black
                      ),),
                      SizedBox(height: 16,),
                      defaultTextFieldPharmacy(
                        controller: passwordController,
                        type: TextInputType.number,
                        hint: "29".tr,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Your password must not be empty";
                          }
                          return null;
                        },
                        prefix:Icons.lock_outline,
                        suffixPressed:() {

                          PharmacyLoginCubit.get(context).changePasswordVisibility();
                        },
                        suffix: PharmacyLoginCubit.get(context).suffix,
                        isPassword: PharmacyLoginCubit.get(context).isPasswordShown,

                      ),
                      SizedBox(
                        height: 24,
                      ),
                      defaultTextFieldPharmacy(
                        controller: confirmPasswordController,
                        type: TextInputType.number,
                        hint: "30".tr,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Your password must not be empty";
                          }
                          return null;
                        },
                        prefix:Icons.lock_outline,
                        suffixPressed:() {

                          PharmacyLoginCubit.get(context).changePasswordVisibility();
                        },
                        suffix: PharmacyLoginCubit.get(context).suffix,
                        isPassword: PharmacyLoginCubit.get(context).isPasswordShown,

                      ),


                    ],
                  ),
                ),
              ),
            ),
          floatingActionButton:  Padding(
            padding: const EdgeInsets.only(right: 24.0,left:24,),
            child:  ConditionalBuilder(

              condition:state is !UserLoadingPatchForgetState ,
              builder:(context)=>   newDefaultButton(

                  background: HexColor(green),
                  text: "17".tr,

                  //  background: HexColor(green.toString()),
                  function: (){
                    UserRegisterCubit.get(context).patchForgotPassword
                      (confirmPassword:confirmPasswordController.text, password: passwordController.text,
                        email: data[0], code:int.parse( data[1]));
                        print(data[0]);
                         print(data[1]);
                  },

                  width: double.infinity,
                  isAppbar: false
              ),
              fallback:(context)=>const Center(child:  CircularProgressIndicator()) ,


            ),

          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },

    );
  }
}
