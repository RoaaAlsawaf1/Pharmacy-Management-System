import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/Rigester_user/states.dart';
import 'package:pharmacy/login/forgotPass.dart';
import 'package:pharmacy/login/password.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';


class VerificationScreen extends StatelessWidget {
 var verificationCodeController =TextEditingController();
 var formKey=GlobalKey<FormState>();
 var data=Get.arguments;
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegisterCubit,UserRegisterStates>(
      listener: (context, state) {
        if(state is UserSuccessState)//نجاح او فشل التسجيل
            {

          if(state.value==200) {
            CacheHelper.saveData(
                key: 'accessToken', value: state.registerUser.accessToken).
            then((value) {
              accessToken = state.registerUser.accessToken;
              UserRegisterCubit.get(context).getUser();

  }


            );
            CacheHelper.saveData(key: 'refreshToken', value: state.registerUser.refreshToken).
            then((value){
              refreshToken=state.registerUser.refreshToken;});
            navigateAndFinish(context: context, widget: drawerScreen());
          }



        }
        if(state is UserErrorState){
          if(state.error==400){
            showToast(text:"the code is invalid" ,state: ToastStates.EROOR);

          }
else{
            showToast(text:"he code is invalid ,must be 6 digits or the code is invalid  " ,state: ToastStates.EROOR);

          }
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Verification",style: TextStyle(
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
                    Text("Enter verification code we've sent on given number",style: TextStyle(
                      color: Colors.black,
                    ),),
                    SizedBox(height: 16,),
                    defaultTextFieldPharmacy(
                        controller: verificationCodeController,
                        type: TextInputType.emailAddress,
                        validate: ( value) {
                          if (value!.isEmpty) {
                            return "Email  Address must not be empty";
                          }
                          return null;
                        },
                        onSubmit: (value) {},
                        hint: "Enter Verification Code",
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
                  //  Text("0:10 min"),

                    defaultTextButton(
                        color: HexColor(green.toString()),

                        function:(){
                          UserRegisterCubit.get(context).sendEmail(email: data[1], type:'register')    ;  // navigateTo(context: context,widget:ForgotPasswordScreen());
                        }, text:'Resend'),

                  ],
                ),
                SizedBox(height: 30,),
                ConditionalBuilder(

                  condition:state is !UserLoadingState ,
                  builder:(context)=>  newDefaultButton(
                      text: "Continue",
                      background: HexColor(green.toString()),

                      function: (){
                        UserRegisterCubit.get(context).userRegister
                          (email: data[1], password:data[2], name:data[0], userName: data[1],
                            phoneNumber:data[4] ,
                            age: data[3],
                            code:verificationCodeController.text,
                             area_id: data[5]

                        );

print(data[2]);

                      },
                      width: double.infinity,
                      isAppbar: false
                  ),
                  fallback:(context)=>const Center(child:  CircularProgressIndicator()) ,


                ),
                // newDefaultButton(
                //     background: HexColor(green),
                //     text: "Continue",
                //
                //
                //     //  background: HexColor(green.toString()),
                //     function: (){
                //
                //       navigateTo(widget: PasswordScreen(),context: context);
                //     },
                //
                //     width: double.infinity,
                //     isAppbar: false
                // ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },

    );
  }
}
