import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/Pharmacy_Model.dart';
import 'package:pharmacy/Home/SearchMedicineD.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Map_sana/search_medicine_formap.dart';
import 'package:pharmacy/chats/contacts_screen.dart';
import 'package:pharmacy/combonants.dart';
import 'package:pharmacy/map/google_map_try.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:pharmacy/Categores/cough.dart';
import 'package:pharmacy/Categores/fever.dart';
import 'package:pharmacy/Categores/headache.dart';
import 'package:pharmacy/Categores/pain_relief.dart';
import 'package:pharmacy/Categores/skin_care.dart';
import 'package:pharmacy/Categores/weakness.dart';
import 'package:pharmacy/Medicen/pharmace_medisants.dart';
import 'package:pharmacy/Pill_Reminder/pill_reminder.dart';
import 'package:pharmacy/Prescription/prescription.dart';
import 'package:pharmacy/myOrder/My_Order.dart';
import 'package:pharmacy/setting/setting.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class HomeScreen extends StatefulWidget  {

  HomeScreen( {Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//#419490
  var searchController = TextEditingController();

  bool isSearching = false;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {

      },
      builder:(context, state) {

        return  Scaffold(
          appBar: AppBar(
            toolbarHeight:80,
            titleSpacing: 0.0,
            leadingWidth: 46,
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
              child: IconButton(
                icon:Icon(
                  Icons.menu,
                  size: 27,
                  color:Colors.black87,
                ),
                onPressed:() {
                },
              ),
            )
            ,
            title:Row(
              children: [
                IconButton(
                  icon:Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color:Colors.black87,
                  ),
                  onPressed:() async{

                    print("iam the problem its me : ${CacheHelper.getData(key: 'accessToken')}");
                    Position position = await _determinePosition();
                    print(position.toString());

                    navigateTo(context: context, widget: SearchMedicineScreen( position: position));

                  },
                ),

                Text("1".tr,style: TextStyle(color: Colors.black87,fontSize: 14,fontWeight: FontWeight.normal),),
              ],
            ) ,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                        icon:Icon(
                          Icons.chat,
                          size: 30,
                          color:HexColor(green),
                        ),
                        onPressed:() {
                          navigateTo(context: context, widget: Contacts_Screen());
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0,top:3),
                        child: CircleAvatar(
                            backgroundColor: HexColor(green.toString()),
                            radius: 8,

                            child:Text("2",style: TextStyle(fontSize:12),)),
                      )
                    ]
                ),
              )
            ],

          ),

          body:Column(
            children: [

              Expanded(

                child: Container(
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
                        HexColor('BDB9C7'),//
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

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        Container(

                          child: defaultButtonForPrescriptionSearch
                            (function: () {
                            navigateTo(widget:SearchMedicine(),context: context );

                            }, text: "Search ")
                        ),

                            Container(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("3".tr, style: TextStyle(fontSize: 16)),



                          ]
                        ),
                            ),//Text
                            Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          child: ConditionalBuilder(
                            condition:state is! GetPharmacyInHomeLoadingState ,
                            builder:(context) =>  ConditionalBuilder(
                              condition: PharmacyHomeCubit.get(context).pharmacyMedicineHome.pharmacies!.isNotEmpty,
                              builder: (context) => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder:(context, index) =>pharma(context,PharmacyHomeCubit.get(context).pharmacyMedicineHome.pharmacies![index]) ,
                                separatorBuilder: (context, index) => SizedBox(width: 12),
                                itemCount: PharmacyHomeCubit.get(context).pharmacyMedicineHome.pharmacies!.length,
                              ),
                              fallback: (context) => Center(child: Text("There are no pharmacies ",style: TextStyle(
                                  color: Colors.grey
                              ),)),) ,
                            fallback:  (context) => Center(child: CircularProgressIndicator(color:  HexColor(green),)),

                          ),
                        ),
                            ),//pharmacy


                            Container(
                        // padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(24),
                              child: Text("10".tr, style: TextStyle(fontSize: 16)),
                            ),
                            ConditionalBuilder(
                              condition:ResponsiveBreakpoints.of(context).isDesktop ,
                              builder:(context) =>Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  healthCategory(image:"images/dry-cough.png" ,text:"4".tr,onTap:() {
                                    Get.to(()=>Cough(),
                                      duration: Duration(seconds: 1),);
                                  }, ),
                                  healthCategory(image:"images/fever.png" ,text:"5".tr ,onTap: () {
                                    Get.to(()=>Fever(),
                                      duration: Duration(seconds: 1),);

                                  },),
                                  healthCategory(image:"images/skin-rash.png" ,text:"6".tr,onTap: () {
                                    Get.to(()=>SkinCare(),
                                      duration: Duration(seconds: 1),);
                                  }, ),
                                  healthCategory(image:"images/headache.png" ,text:"7".tr ,onTap: () {
                                    Get.to(()=>Headache(),
                                      duration: Duration(seconds: 1),);
                                  },),
                                  healthCategory(image:"images/chest-pain-or-pressure.png" ,text:"8".tr ,onTap: () {
                                    Get.to(()=>PainRelief(),
                                      duration: Duration(seconds: 1),);
                                  },),
                                  healthCategory(image:"images/weakness.png" ,text:"9".tr,onTap: () {
                                    Get.to(()=>Weakness(),
                                      duration: Duration(seconds: 1),);
                                  }, )

                                ],
                              ) ,
                              fallback:(context) => Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      healthCategory(image:"images/dry-cough.png" ,text:"4".tr,onTap:() {
                                        Get.to(()=>Cough(),
                                          duration: Duration(seconds: 1),);
                                      }, ),
                                      healthCategory(image:"images/fever.png" ,text:"5".tr ,onTap: () {
                                        Get.to(()=>Fever(),
                                          duration: Duration(seconds: 1),);

                                      },),
                                      healthCategory(image:"images/skin-rash.png" ,text:"6".tr,onTap: () {
                                        Get.to(()=>SkinCare(),
                                          duration: Duration(seconds: 1),);
                                      }, )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      healthCategory(image:"images/headache.png" ,text:"7".tr ,onTap: () {
                                        Get.to(()=>Headache(),
                                          duration: Duration(seconds: 1),);
                                      },),
                                      healthCategory(image:"images/chest-pain-or-pressure.png" ,text:"8".tr ,onTap: () {
                                        Get.to(()=>PainRelief(),
                                          duration: Duration(seconds: 1),);
                                      },),
                                      healthCategory(image:"images/weakness.png" ,text:"9".tr,onTap: () {
                                        Get.to(()=>Weakness(),
                                          duration: Duration(seconds: 1),);
                                      }, )
                                    ],
                                  ),
                                ],
                              ) ,
                            ),

                          ],
                        ),
                            ),//category
                            SizedBox(height: 16,),
                            defaultButtonForPrescription(
                        // width:MediaQuery.of(context).size.width,
                        // height:MediaQuery.of(context).size.height*0.065,
                          text: "11".tr,function:(){
                        Get.to(()=>Prescription(),
                          duration: Duration(seconds: 1),);
                            }),

                      ],
                    ),


                  ),
                ),
              ),
            ],
          )

        );
      },
    );

  }

  Widget pharma(context,Pharmacies pharmacies)=>InkWell(

    onTap: () {
      CacheHelper.saveData(key: "pharmacies_id_home", value: pharmacies.id);
      CacheHelper.saveData(key: "name_pharmacy_home", value: pharmacies.pharmacyName);
      CacheHelper.saveData(key: "number_pharmacy_home", value: pharmacies.number);



      PharmacyHomeCubit.get(context).getAllMedicineInHome(id: pharmacies.id);
      navigateTo(widget: PharmacyPage(),context: context);

    },
    child: Container(
      width: 220,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:HexColor("E5E4E2"),
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image(image:AssetImage("images/pharmacy.jpg")),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(16) ,bottomLeft:Radius.circular(15)  ) ,
          ),
          SizedBox(width: 34),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("${pharmacies.pharmacyName}",style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5,),
              // Row(
              //   children: [
              //     Icon(Icons.location_on,color: HexColor(green.toString()),size: 13),
              //     SizedBox(width: 3,),
              //     Text("2.0 km",style: TextStyle(
              //         fontSize: 11
              //     ),),
              //   ],
              // )
            ],
          )
        ],
      ),
    ),
  );

}
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error('Location services are disabled');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error("Location permission denied");
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied');
  }

  Position position = await Geolocator.getCurrentPosition();

  return position;
}