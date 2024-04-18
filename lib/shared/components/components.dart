import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/shared/components/constant.dart';

void navigateTo({context,widget})=>Navigator.push(//الصفحات لسا معي اذا عملت باك
    context
    , MaterialPageRoute(
  builder: (context)=>widget,
));
void navigateAndFinish({context,widget})=>Navigator.pushAndRemoveUntil(//هي ماعد ارجع ع صفحة متل تسجيل الدخول
    context
    , MaterialPageRoute(
  builder: (context)=>widget,
),
    ( Route<dynamic>route)=>false,//هاد الصفحة يلي فاتت بدي ياها ولا لا
);


      Widget defaultTextButton({
        required VoidCallback? function,
        required String text,
        required Color color,
      })=>TextButton(onPressed:function, child:Text(text,
        style:TextStyle(fontSize:14,color:color,fontWeight: FontWeight.bold)));
      //////////////////////////////////////

      void showToast({
  required String text,
  required ToastStates state,
})=>Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,//ظهور
          timeInSecForIosWeb: 5,
          backgroundColor: chooseToastColor(state),
          textColor: Colors.white,
          fontSize: 16.0,

      );
      enum ToastStates{
        SUCCESS,EROOR,WARNING
      }
      Color chooseToastColor(ToastStates state)
      {  Color color;
        switch(state){
          case ToastStates.SUCCESS:
            color= HexColor(green.toString());

            break;
          case ToastStates.EROOR:
            color=  Colors.grey;
            break;
          case ToastStates.WARNING:
            color=  Colors.amber;
            break;

        }
        return color;

      }
        Widget MyLine()=>Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width:double.infinity ,height: 1,color:Colors.black,),
        );

//..........................................................................................................
Widget healthCategory({required String text,required String image,GestureTapCallback? onTap,})=>Padding(
  padding: const EdgeInsets.all(10.0),

  child: InkWell(
  onTap:onTap ,
    child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children:[

          Container(
            height:100,
            width: 100,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color:HexColor("E6E3E8"),//EAF3FA
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text,style: TextStyle(
                color: HexColor("11110F"),
                fontSize: 11,

              ),

              ),
            ),

          ),

          Padding(
            padding: const EdgeInsets.only(right:3,top:46),
            child: Image(
              image: AssetImage(image),
              width: 65,
              height: 65,

            ),
          ),

        ]
    ),
  ),
);
Widget defaultSearch({
  required TextEditingController  controller,
  required TextInputType? type,
  required String label,
  required IconData prefix,
  required FormFieldValidator? validator,
  GestureTapCallback? onTap,
  bool isPassword=false,
  required Function? onChange(value),
  // required double height,
  // required double width,
})=>Padding(
  padding: const EdgeInsets.all(18.0),
  child:   Container(
//    height: height,
// width: width,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      color:HexColor("E5E4E2") ,

    ),
    child: TextFormField(
      validator:validator ,
      controller: controller,
      keyboardType:type ,
      onTap: onTap,
      obscureText: isPassword,
      onChanged: onChange,
      decoration:InputDecoration(
          hintText: label,

          hintStyle: const TextStyle(
            color: Colors.black38,
          ),
          border:InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14,right: 6),
          prefixIcon:Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Icon(
              prefix,
             size: 20,
              color:HexColor(green),
            ),
          ),


        // suffixIcon: Icon(
        //   suffix,
        // ),
      ),
    ),
  ),
);
Widget defaultButtonForPrescription({
  required GestureTapCallback?function,
  required String text,
  // required double height,
  // required double width,

})=>InkWell(
  onTap:function ,
  child:   Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(

      //  padding: const EdgeInsets.symmetric(vertical:5),
    // width: width,
    //    height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:HexColor("E5E4E2"),

      ),

      child:   Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [

            Icon(Icons.camera_alt,color:HexColor(green.toString()) ),
            SizedBox(width: 12,),
            Text(text
              ,style: TextStyle(
                fontSize: 16,
                color:HexColor(green.toString()),

              ),

            ),

            Spacer(),
            Icon(Icons.arrow_forward_ios,color:HexColor(green.toString()) ),
          ],
        ),
      ),
    ),
  ),
);
Widget background({required Widget? child })=>Container(
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
        HexColor('BDB9C7'),//
        HexColor('D3C8CC'),
        HexColor('D3CACF'),
        HexColor('DBD9DE'),
        HexColor('D7D2D8'),

      ],
      tileMode: TileMode.clamp,

    ),
  ),
  child: child,


);

Widget newDefaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 47,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(35),
        gradient:LinearGradient(

          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(
          isAppbar ? text.toUpperCase() : text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );

Widget defaultTextFieldPharmacy({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,

  String? label,
  String? hint,
  required IconData prefix,
  IconData? suffix,
  Function()?suffixPressed,
  required FormFieldValidator validate,
  FormFieldSetter? onSaved

}) =>
    TextFormField(
         //cursorColor: PharmacyColor,
         controller: controller,
         keyboardType: type,
         obscureText: isPassword,
         onSaved: onSaved,
         // onFieldSubmitted: onSubmit!(),
         //onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
       contentPadding: EdgeInsetsDirectional.zero,
      hintStyle: TextStyle(
        fontSize: 14,
        color: HexColor("6C6D72"),
        overflow: TextOverflow.visible,
),
      isDense: false,
      alignLabelWithHint: false,
      filled: true,
      fillColor: HexColor("E5E4E2"),
       labelText: label,
       hintText: hint,
       focusColor:HexColor(green.toString()),
       border: OutlineInputBorder(
borderSide: BorderSide.none,
borderRadius: BorderRadius.circular(35),

) ,
       prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 10.0,right:10),
        child:   Icon(prefix,color:HexColor(green.toString()),),
),
       suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)

));
Widget backgroundShow({required Widget? child })=>Container(
  height: 620,
  margin: const EdgeInsets.symmetric(horizontal: 16),
  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
  decoration: BoxDecoration(

    gradient:LinearGradient(

      begin:  Alignment.topRight,
      end:Alignment.bottomLeft ,

      colors: [
        HexColor('A8BEE7'),
        HexColor('AEC9DE'),
        HexColor('BBC5CE'),
        HexColor('BDB9C7'),//
        HexColor('D3C8CC'),
        HexColor('D3CACF'),
        HexColor('DBD9DE'),
        HexColor('D7D2D8'),

      ],
      tileMode: TileMode.clamp,

    ),
    borderRadius: BorderRadius.circular(40),

  ),
  child: child,
);
Widget backgroundShowIn()=>Container(

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
);
String convertTime(String minutes){
  if(minutes.length==1){
    return "0$minutes";
  }
  else{
    return minutes;
  }

}
Widget defaultTextFieldPharmacyDashboard({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  Function()?suffixPressed,


}) =>
    TextFormField(
//cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
// onFieldSubmitted: onSubmit!(),
//onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(

            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
//fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,

            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(

              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft:Radius.circular(35)),

            ) ,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:   Icon(prefix,color:HexColor(green.toString()),),
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)));
Widget newDefaulDashbordtButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 35,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(35),
        gradient:LinearGradient(

          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(
          isAppbar ? text.toUpperCase() : text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );



Widget newDefaultButtonAdd({
  double width = double.infinity,
 // Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 50,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10)),

        gradient:LinearGradient(

          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(
          isAppbar ? text.toUpperCase() : text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );


Widget buttonHealthy({required String text,GestureTapCallback? onTap,double width=100,double height=100})=>
    Padding(
  padding: const EdgeInsets.all(10.0),

  child: InkWell(
    splashColor: Colors.grey,
    focusColor: Colors.grey,
    onTap:onTap ,
    child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children:[

          Container(
            height:height,
            width: width,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              color:HexColor("E6E3E8"),//EAF3FA
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(text,style: TextStyle(
                  color: HexColor("11110F"),
                  fontSize: 20,

                ),

                ),
              ),
            ),

          ),

          // Padding(
          //   padding: const EdgeInsets.only(right:3,top:46),
          //   child: Image(
          //     image: AssetImage(image),
          //     width: 70,
          //     height: 70,
          //
          //   ),
          // ),

        ]
    ),
  ),
);

Widget defaultTextFieldPharmacyAmount({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  Function()?suffixPressed,


}) =>
    TextFormField(
//cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
// onFieldSubmitted: onSubmit!(),
//onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(


            hintStyle: TextStyle(
              height: 0.5,
              fontSize: 12,
              color: HexColor("6C6D72"),

            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
//fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),

            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),


            ) ,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:   Icon(prefix,size:20,color:HexColor(green.toString()),),
            ),
            suffixIcon: IconButton(icon: Icon(suffix,size:10,color:HexColor(green.toString()),), onPressed:suffixPressed)));



Widget defaultTextFieldPharmacyDashboard1({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required validate,
  String? label,
  String? hint,

  IconData? suffix,
  Function()?suffixPressed,


}) =>
    TextFormField(
//cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
// onFieldSubmitted: onSubmit!(),
//onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
//fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              //borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft:Radius.circular(35)),

            ) ,

            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)));
Widget newDefaultButton1({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 47,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,

        gradient:LinearGradient(

          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(
          isAppbar ? text.toUpperCase() : text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
Widget defaultTextFieldPharmacyFrom({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,

  String? label,
  String? hint,
  required IconData prefix,
  IconData? suffix,
  Function()?suffixPressed,
  required FormFieldValidator validate,
  FormFieldSetter? onSaved,
  VoidCallback? onPressed,
}) =>
    TextFormField(
      //cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onSaved: onSaved,
        // onFieldSubmitted: onSubmit!(),
        //onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
            fillColor: HexColor("E5E4E2"),
            labelText: label,
            labelStyle: TextStyle(fontSize: 12),
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft: Radius.circular(35))


            ) ,
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0,right:10),
                child:  IconButton(icon: Icon(prefix,color:HexColor(green.toString()),),
                    onPressed:onPressed)
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)

        ));
Widget defaultTextFieldPharmacyTo({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  VoidCallback? onPressed,
  String? label,
  String? hint,
  required IconData prefix,
  IconData? suffix,
  Function()?suffixPressed,
  required FormFieldValidator validate,
  FormFieldSetter? onSaved

}) =>
    TextFormField(
      //cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onSaved: onSaved,
        // onFieldSubmitted: onSubmit!(),
        //onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
            labelStyle: TextStyle(fontSize: 12),
            fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
             borderRadius: BorderRadius.only(bottomRight:Radius.circular(35),topRight:Radius.circular(35) )

            ) ,

            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:  IconButton(icon: Icon(prefix,color:HexColor(green.toString()),),
                  onPressed:onPressed)
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),),
                onPressed:suffixPressed)

        ));
Widget defaultTextFieldPharmacyUpdate({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  Function()?suffixPressed,


}) =>
    TextFormField(
//cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
// onFieldSubmitted: onSubmit!(),
//onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
//fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(35))
              ,

            ) ,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:   Icon(prefix,color:HexColor(green.toString()),),
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)));

Widget defaultTextFieldPharmacyDashboard2({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  required validate,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  Function()?suffixPressed,


}) =>
    TextFormField(
//cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
// onFieldSubmitted: onSubmit!(),
//onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
//fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(35)),


            ) ,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:   Icon(prefix,color:HexColor(green.toString()),),
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)));
Widget newDefaultButton3({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 40,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(35),
        gradient:LinearGradient(

          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );

Widget defaultTextFieldPharmacy3({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,

  String? label,
  String? hint,
  required IconData prefix,
  IconData? suffix,
  Function()?suffixPressed,
  required FormFieldValidator validate,
  FormFieldSetter? onSaved

}) =>
    TextFormField(
      //cursorColor: PharmacyColor,
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onSaved: onSaved,
        // onFieldSubmitted: onSubmit!(),
        //onChanged: onChange!(),
        validator: validate,
        decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintStyle: TextStyle(
              fontSize: 14,
              color: HexColor("6C6D72"),
              overflow: TextOverflow.visible,
            ),
            isDense: false,
            alignLabelWithHint: false,
            filled: true,
            //fillColor: HexColor("E5E4E2"),
            labelText: label,
            hintText: hint,
            focusColor:HexColor(green.toString()),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(35),

            ) ,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0,right:10),
              child:   Icon(prefix,color:HexColor(green.toString()),),
            ),
            suffixIcon: IconButton(icon: Icon(suffix,color:HexColor(green.toString()),), onPressed:suffixPressed)

        ));
Widget newDefaultButton6({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isAppbar = true,
  required Function function,
  required String text,

}) =>
    Container(
      height: 47,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background,
borderRadius: BorderRadius.all(Radius.circular(35)),

        gradient:LinearGradient(


          begin:  Alignment.topCenter,
          end:Alignment.bottomCenter ,

          colors: [
            HexColor('56949a'),
            HexColor('3e8489'),

          ],


        ),
      ),
      child: MaterialButton(
        splashColor: HexColor(green.toString()),
        onPressed: () {
          function();
        },
        child: Text(
          isAppbar ? text.toUpperCase() : text,
          style:const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.normal
          ),
        ),
      ),
    );

Widget defaultButtonForPrescriptionSearch({
  required GestureTapCallback?function,
  required String text,
  // required double height,
  // required double width,

})=>InkWell(
  onTap:function ,
  child:   Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(

      //  padding: const EdgeInsets.symmetric(vertical:5),
      // width: width,
      //    height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:HexColor("E5E4E2"),

      ),

      child:   Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [

            Icon(Icons.search_rounded,color:HexColor(green.toString()),size: 20, ),
            SizedBox(width: 12,),
            Text(text
              ,style: TextStyle(
                fontSize: 15,

                color: Colors.black38,

              ),

            ),

            Spacer(),
            Icon(Icons.arrow_forward_ios,color:HexColor(green.toString()),size: 14, ),
          ],
        ),
      ),
    ),
  ),
);