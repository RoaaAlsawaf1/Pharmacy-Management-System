import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/login/password.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';


class VerificationScreenForgetPassword extends StatelessWidget {
 var verificationCodeController =TextEditingController();
 var formKey=GlobalKey<FormState>();
 var data=Get.arguments;
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
      listener: (context, state) {
        if(state is UserSuccessCheckForgetState)//نجاح او فشل التسجيل
            {

          if(state.value==200) {
            Get.to(() => PasswordScreen(), arguments: [
              data[0],
              verificationCodeController.text

            ]);

          }


        }
        if(state is UserErrorCheckForgetState){
          if(state.error==400) {
            showToast(text:"code is invalid" ,state: ToastStates.EROOR);
          }
          else{
          showToast(text:"error" ,state: ToastStates.EROOR);}
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("23".tr,style: TextStyle(
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
          body: Container(
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
                  key:formKey ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("24".tr,style: TextStyle(
                      color: Colors.black,
                    ),),
                    SizedBox(height: 16,),
                    defaultTextFieldPharmacy(
                        controller: verificationCodeController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "Email  Address must not be empty";
                          }
                          return null;
                        },
                        onSubmit: (value) {},
                        hint: "25".tr,
                        prefix: Icons.email_outlined),


                  ],
                ),
              )
          ),

          floatingActionButton:Padding(
            padding: const EdgeInsets.only(right: 24.0,left:24 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    defaultTextButton(
                        color: HexColor(green.toString()),

                        function:(){
                          UserRegisterCubit.get(context).sendEmailForget(email: data[0], type:'forgot')    ;  // navigateTo(context: context,widget:ForgotPasswordScreen());
                        }, text:"26".tr),

                  ],
                ),
                SizedBox(height: 30,),
                ConditionalBuilder(

                  condition:state is !UserLoadingCheckForgetState ,
                  builder:(context)=>  newDefaultButton(
                      text: "17".tr,
                      background: HexColor(green.toString()),

                      function: (){
                       UserRegisterCubit.get(context).checkCode(email:data[0], code:int.parse(verificationCodeController.text));
                         print(data[0]);
                      },
                      width: double.infinity,//janakh3456@
                      isAppbar: false
                  ),
                  fallback:(context)=>const Center(child:  CircularProgressIndicator()) ,


                ),

              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },

    );
  }
}
