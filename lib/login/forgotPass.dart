import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/login/Verification.dart';
import 'package:pharmacy/login/VerificationForgetPassword.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';


class ForgotPasswordScreen extends StatelessWidget {
  var emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
      listener: (context, state) {
        if(state is UserSuccessSendEmailForgetState)//نجاح او فشل التسجيل
            {

          if(state.value==200) {

            Get.to(() => VerificationScreenForgetPassword(), arguments: [

              emailController.text,
            ]);

                 }
          //roaaalsawaf1@

        }
        if(state is UserErrorSendEmailForgetState){
          if(state.error==422){
            showToast(text:"Email not found!" ,state: ToastStates.EROOR);
          }
          else{
            showToast(text:"error" ,state: ToastStates.EROOR);
          }
        }


//                    navigateTo(widget: VerificationScreenForgetPassword(),context: context);
      },
      builder:  (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Text("21".tr,style: TextStyle(
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
            child:Padding(
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
                  Text("22".tr,style: TextStyle(
                      color: Colors.black
                  ),),
                  SizedBox(height: 16,),
                  defaultTextFieldPharmacy(
                      controller:emailController,
                      type: TextInputType.emailAddress,
                      hint: "14".tr,
                      validate:(value){
                        if(value.isEmpty)
                        {
                          return "Your email must not be empty";
                        }
                        else{
                          return null;
                        }
                      },
                      prefix:Icons.email_outlined),

                ],
              ),
            ),
          ),
          floatingActionButton:  Padding(
            padding: const EdgeInsets.only(right: 24.0,left:24,),
            child:   ConditionalBuilder(

              condition:state is !UserLoadingSendEmailForgetState ,
              builder:(context)=>   newDefaultButton(

                  background: HexColor(green),
                  text: "17".tr,

                  //  background: HexColor(green.toString()),
                  function: (){
                    UserRegisterCubit.get(context).sendEmailForget(email: emailController.text, type:'forgot');
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
