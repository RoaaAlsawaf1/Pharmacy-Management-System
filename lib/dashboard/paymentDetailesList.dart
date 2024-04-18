
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/dashboard/cubit/ModelDashBordPharmacy.dart';
import 'package:pharmacy/dashboard/cubit/ModelDshBordWarehouse.dart';
import 'package:pharmacy/dashboard/informatin.dart';
import 'package:pharmacy/dashboard/information_warehous.dart';


import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

import 'data.dart';

class PaymentDetailList extends StatelessWidget {

   PaymentDetailList({
    Key? key,
  }) : super(key: key);
  var PharmacyController = TextEditingController();
  var WarehouseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {
       // if(state is PharmacyDashBordSuccessState){
       //   if(state.value==200){
       //
       //   }
       // }
       // if(state is PharmacyDashBordErrorState){
       //   if(state.error==422){
       //  showToast(text: "The owner of  permission name field is required.", state:ToastStates.EROOR);
       //   }
       //   else{
       //     showToast(text: "error", state:ToastStates.EROOR);
       //   }
       // }
       // if(state is WarehouseDashBordSuccessState){
       //   if(state.value==200){
       //
       //   }
       // }
       // if(state is  WarehouseDashBordErrorState){
       //   if(state.error==422){
       //     showToast(text: "The owner of  permission name field is required.", state:ToastStates.EROOR);
       //   }
       //   else{
       //     showToast(text: "error", state:ToastStates.EROOR);
       //   }
       // }
      },
      builder: (context, state) {
        return  Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          const Text('Inactive pharmacies',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 6,
          ),

          Column(
            children: [
              ConditionalBuilder(
                builder: (context) => ConditionalBuilder(
                    condition:PharmacyHomeCubit.get(context).dashBordPharmacy.pharmacies!.isNotEmpty ,
                    builder: (context) => ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            BuildPharmacyItem(context,PharmacyHomeCubit.get(context).dashBordPharmacy.pharmacies![index]),
                        //BuildCounselingTypeItem(),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 50,
                        ),
                        itemCount: PharmacyHomeCubit.get(context).dashBordPharmacy.pharmacies!.length),
                    fallback: (context) => Center(child: Text("There are not Invactive pharmacy",style: TextStyle(color: Colors.grey),)),),
                condition:state is!PharmacyDashBordLoadingState ,
                fallback: (context) => Center(child: CircularProgressIndicator(color:  HexColor(green.toString()))),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 5,
          ),
          const Text('Inactive warehouse',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800
          )),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 6,
          ),
          Column(
            children: [
              ConditionalBuilder(

                condition:state is!WarehouseDashBordLoadingState ,
                fallback: (context) => Center(child: CircularProgressIndicator(color:  HexColor(green.toString()))),
                builder:(context) => ConditionalBuilder(
                    condition: PharmacyHomeCubit.get(context).dashBordWarehouse.warehouses!.isNotEmpty,
                    builder: (context) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            BuildWarehouseItem(context,PharmacyHomeCubit.get(context).dashBordWarehouse.warehouses![index]),

                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 50,
                        ),
                        itemCount:PharmacyHomeCubit.get(context).dashBordWarehouse.warehouses!.length),
                    fallback: (context) => Center(child: Text("There are not Inactive warehouse",style: TextStyle(color: Colors.grey))),)
              ),
            ],
          ),
          // Column(

        ]);

      },
    );
  }
  Widget BuildPharmacyItem(context,Pharmacies pharmacy)=>Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //هي الصورة تبع الصيدلية
      Row(
        children: [
          Container(
            // height: 100,
            width: 50,
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context ,

                    MaterialPageRoute(

                    builder: (_) => Scaffold(

                  body: Center(
                    child: ZoomableImage(
                      imageUrl: "http://192.168.43.142:8000/${pharmacy.pathOfPhoto}",
                      maxScale: 3.0,
                    ),
                  ),
                )));
              },
              child:Image(image:NetworkImage("http://192.168.43.142:8000/${pharmacy.pathOfPhoto}"),),
            ),),
          const SizedBox(
            width: 20,
          ),
          //هي اسم الصيدلية ورقمها
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text( pharmacy.pharmacyName!,overflow:TextOverflow.ellipsis,style: const TextStyle(
                 fontWeight: FontWeight.w400,
                fontSize: 14

              ),),
              const SizedBox(
                height: 16,
              ),
              Text(pharmacy.number!,overflow:TextOverflow.ellipsis,style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14

              ),),

            ],
          ),
         const Spacer(),
          //هاد زر القبول
          Container(
            height: 30,
            width: 140,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(70),
              color: HexColor(green),
            ),

              child: Center(child: TextButton(onPressed: (){
                Get.to(() => Information(), arguments: [
                  "http://192.168.43.142:8000/${pharmacy.pathOfPhoto}",//0
                  pharmacy.pharmacyName!,//1
                  pharmacy.number!,//2
                  "${pharmacy.location!.area!.city!.nameEn}/ ${pharmacy.location!.area!.nameEn} ",//3
                  pharmacy.id!

                ]);


              }, child: const Text("go for verification",style: TextStyle(color: Colors.white,fontSize: 12),)))),
          const SizedBox(
            width: 10,
          ),
          //هاد زر الرفض

          const SizedBox(
            height: 20,
          ),
          // Container(
          //   height: 20,
          //   width: 200,
          //   child: defaultTextFieldPharmacy(
          //     controller: PharmacyController,
          //     type: TextInputType.name,
          //     hint: "owner_of_Permission_name",
          //     validate: (value) {
          //       if (value.isEmpty) {
          //         return "Your owner_of_Permission_name must not be empty";
          //       } else {
          //         return null;
          //       }
          //     }, prefix:Icons.text_fields_rounded,
          //   ),
          // ),
        ],
      ),
    ],

  );

  Widget BuildWarehouseItem(context,Warehouses warehouses)=>Column(
    children: [
      //هي الصورة تبع المستودع
      Row(
        children: [
          Container(
            // height: 100,
              width: 50,
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context ,
                    MaterialPageRoute(builder: (_) => Center(
                      child: ZoomableImage(
                        imageUrl:"http://192.168.43.142:8000/${warehouses.pathOfPhoto}",
                        maxScale: 3.0,
                      ),
                    ) ),
                  );
                },
                child: Image(image:NetworkImage("http://192.168.43.142:8000/${warehouses.pathOfPhoto}"),),
              ),),
          const SizedBox(
            width: 20,
          ),
          //هي اسم المستودع ورقمها
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(warehouses.warehouseName!,style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14

              ),),
              const SizedBox(
                height: 16,
              ),
              Text(warehouses.number!,style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14

              ),),

            ],
          ),
          const Spacer(),
          //هاد زر القبول
          Container(
              height: 30,
              width: 140,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(70),
                color: HexColor(green),
              ),

              child: Center(child: TextButton(onPressed: (){
                Get.to(() => InformationWarehouses(), arguments: [
                  "http://192.168.43.142:8000/${warehouses.pathOfPhoto}",//0
                  warehouses.warehouseName!,//1
                  warehouses.number!,//2
                  "${warehouses.location!.area!.city!.nameEn}/ ${warehouses.location!.area!.nameEn} ",//3
                  warehouses.id!//4

                ]);


              }, child: const Text("go for verification",style: TextStyle(color: Colors.white,fontSize: 12),)))),

          //هاد زر الرفض

          // Container(
          //   height: 20,
          //   width: 200,
          //   child: defaultTextFieldPharmacy(
          //     controller: WarehouseController,
          //     type: TextInputType.name,
          //     hint: "email",
          //     validate: (value) {
          //       if (value.isEmpty) {
          //         return "Your email must not be empty";
          //       } else {
          //         return null;
          //       }
          //     }, prefix: Icons.text_fields_rounded,
          //
          //   ),
          // ),
        ],
      ),
    ],

  );
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