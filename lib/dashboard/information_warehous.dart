import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

import 'Success_Screen_dashbord.dart';

class InformationWarehouses extends StatelessWidget {
   InformationWarehouses({Key? key}) : super(key: key);
   var data=Get.arguments;
   var PharmacyController = TextEditingController();
   var WarehouseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

        //////////////////////////////////////////////////////////////////
        if(state is WarehouseValidationSuccessState){
          if(state.value==200){
            PharmacyHomeCubit.get(context).getWarehouse();
            navigateAndFinish(context: context,widget: SuccessScreen());
          }
        }
        if(state is  WarehouseValidationErrorState){
          if(state.error==422){
            showToast(text: "The owner of  permission name field is required.", state:ToastStates.EROOR);
          }
          else{
            showToast(text: "error", state:ToastStates.EROOR);
          }
        }
        ////////////////////

        if(state is DeleteWarehouseSuccessDataState){
          if(state.value==200){
            PharmacyHomeCubit.get(context).getWarehouse();
            navigateAndFinish(context: context,widget: SuccessScreen());
          }
        }
        if(state is  DeleteWarehouseErrorDataState){
          if(state.error==422){
            showToast(text: "The owner of  permission name field is required.", state:ToastStates.EROOR);
          }
          else{
            showToast(text: "error", state:ToastStates.EROOR);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight:80,
            titleSpacing: 8,
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
                Navigator.pop(context);
              }, icon:  Icon(Icons.arrow_back,color: HexColor(green.toString()))),
            )
            ,
            title:  Row(
              children: [
                Text("Information",style: TextStyle(color:HexColor(green.toString()),fontSize: 18,fontWeight: FontWeight.normal),),
              ],
            ) ,
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.only(right: 24.0),
            //     child: LottieBuilder.asset("images/124405-prescription.json",width: 40,height: 40,),
            //   )
            // ],

          ),
          body:Container(
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

              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 300,
                    child: InkWell(

                      onTap: () {
                        Navigator.push(
                          context ,

                          MaterialPageRoute(

                              builder: (_) => Scaffold(

                                body: Center(
                                  child: ZoomableImage(
                                    imageUrl: data[0],
                                    maxScale: 3.0,
                                  ),
                                ),
                              )),

                        );
                      },
                      child:ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(image:NetworkImage( data[0]),fit: BoxFit.cover,)),
                    ),),



                  const SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.all( 10.0),
                    child: Expanded(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' -  Warehouse name : ',//${data[1]}
                            maxLines:2,

                            style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal
                                ,color:HexColor(green.toString()) ),),
                          Text( data[1],//${data[1]}
                            maxLines:2,

                            style: const TextStyle(fontSize: 16.0,fontWeight:
                            FontWeight.normal,color:Colors.black ),),
                        ],

                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all( 10.0),
                    child: Expanded(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' -  Warehouse number : ',//${data[1]}
                              maxLines:2,

                              style: TextStyle(fontSize: 16.0,
                                  fontWeight: FontWeight.normal,color:HexColor(green.toString()) )),
                          Text( data[2],//${data[1]}
                            maxLines:2,

                            style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal
                                ,color:Colors.black ),),
                        ],

                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all( 10.0),
                    child: Expanded(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' -  Warehouse location : ',//${data[1]}
                              maxLines:2,

                              style: TextStyle(fontSize: 16.0,fontWeight:
                              FontWeight.normal,color:HexColor(green.toString()) )),

                          const SizedBox(height: 4,),
                          Text( data[3],//${data[1]}
                            maxLines:2,

                            style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal,color:Colors.black),),

                        ],

                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all( 10.0),
                    child: Expanded(
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' - Enter Owner name :',//${data[1]}
                              maxLines:2,

                              style: TextStyle(fontSize: 16.0,fontWeight:
                              FontWeight.bold,color:HexColor(green.toString()) )),


                        ],

                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(

                      child: defaultTextFieldPharmacy(
                        controller: WarehouseController,
                        type: TextInputType.name,
                        hint: "owner_name",
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Your owner_of_Permission_name must not be empty";
                          } else {
                            return null;
                          }
                        }, prefix:Icons.text_fields_rounded,

                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        newDefaulDashbordtButton(width: 100,function: (){
                          if(WarehouseController.text.isEmpty){
                            showToast(text: "The owner of  permission name field is required.",
                                state:ToastStates.EROOR);
                          }if(WarehouseController.text.isNotEmpty){
                          PharmacyHomeCubit.get(context).validationWarehouse(id:data[4],
                              owner_of_Permission_name: WarehouseController.text);
                                }
                        }, text:'accept') ,
                        const SizedBox(width: 24,),
                        newDefaulDashbordtButton(width:100,function: (){
                          PharmacyHomeCubit.get(context).deleteWarehouse(id:data[4]);
                          PharmacyHomeCubit.get(context).getWarehouse();
                          navigateAndFinish(context: context,widget: SuccessScreen());                          //   PharmacyHomeCubit.get(context).getWarehouse();
                        }, text:'refuse'),
                      ],
                    ),
                  )
//Permission to open the pharmacy

                ],
              ),
            ) ,
          ),

        );
      },
    );
  }
}

class ZoomableImage extends StatefulWidget {
  final String imageUrl;
  final double maxScale;

  ZoomableImage({required this.imageUrl, this.maxScale = 5.0});

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, widget.maxScale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      child: Transform.scale(
        scale: _scale,
        child: Image.network(widget.imageUrl),
      ),
    );
  }
}
