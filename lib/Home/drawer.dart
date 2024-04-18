import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/EmployeeWork/Warehouse_works.dart';

import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';

import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/InvoicesOrder/invoices_Show_order.dart';
import 'package:pharmacy/MyPharmacy/my_pharmacy.dart';
import 'package:pharmacy/MyWarehouse/my_warehous.dart';
import 'package:pharmacy/Rigester_Warehouse/Register_WarehouseScreen.dart';
import 'package:pharmacy/Rigester_Warehouse/cubit.dart';
import 'package:pharmacy/Rigester_Warehouse/states.dart';
import 'package:pharmacy/Rigester_pharmacy/Register_Pharmacy_Screen.dart';
import 'package:pharmacy/Rigester_pharmacy/cubit.dart';
import 'package:pharmacy/Rigester_pharmacy/states.dart';
import 'package:pharmacy/dashboard/dashboard.dart';
import 'package:pharmacy/local/local_controller.dart';
import 'package:pharmacy/login/login_screen.dart';
import 'package:pharmacy/map/google_map_try.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
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
class drawerScreen extends StatefulWidget {
   drawerScreen({  Key? key}) : super(key: key);

  @override
  State<drawerScreen> createState() => _drawerScreenState();

}

class _drawerScreenState extends State<drawerScreen> {
  var advancedDrawerController = AdvancedDrawerController();

  int _selectPage=0;

  String _pageTitel="1".tr;

  final List<Widget>_pages=[

    HomeScreen(),
    const PillReminder(),
    Setting(),
    RegisterPharmacyScreen(),
    MyPharmacy(),
    RegisterWarehouseScreen(),
    MyWarehouse(),
    Dashboard(),
    InvoicesOrder(),
    WareHouseWorks()
  ];

  void _onPageSelected(int index){
    setState(() {
      _selectPage=index;
      if(index==0){
        _pageTitel="1".tr;

      }
      else if(index==1){
        _pageTitel='My Order';
      }
      else if(index==2){
        _pageTitel='Pill Reminder';
      }
      else if(index==3){
        _pageTitel='Setting';
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    MyLocalController controller =Get.find();
    return BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
      listener: (context, state) {
        if(state is PharmacySuccessState){
          if(state.value==200){
            showToast(text:"Logout Successfully" ,state: ToastStates.EROOR);
            signOut(context);

            print(CacheHelper.getData(key: 'accessToken'));


            navigateAndFinish(context: context,widget: Login());
          }
        }
        if(state is PharmacyErrorState){
          if(state.error==401){
            showToast(text:"Unauthenticated" ,state: ToastStates.EROOR);

          }
          else{
            showToast(text:"error " ,state: ToastStates.EROOR);

          }
        }
      },
      builder: (context, state) {
        return Container(

          child: AdvancedDrawer(

              childDecoration: BoxDecoration(
                gradient:  LinearGradient(
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

              openRatio:MediaQuery.of(context).devicePixelRatio*0.43,
              openScale: 0.97,
              controller: advancedDrawerController,
              backdropColor: Colors.grey[200],
              rtlOpening: controller.intiallang=='lang',

              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              drawer: Container(

                decoration:const BoxDecoration(
                  // color: Colors.grey[300],
                ),
                child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only( top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.only(
                                left: 20
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  CacheHelper.getData(
                                      key: 'name'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                               // Text("CacheHelper.getData(key: 'number')"),
                                SizedBox(height: 4,),
                                Text(CacheHelper.getData(key: 'email')),
                              ],
                            ),
                          ),//معلومات البروفايل
                          const  SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 5,
                            width: double.infinity,
                            color: Colors.grey[350],
                          ),//الخط بين القسمين
                          const SizedBox(height: 16,),
                          Expanded(
                            child: ListView(
                              physics:const BouncingScrollPhysics(),
                              children: [
                                ListTile(
                                  onTap: (){
                                    _onPageSelected(0);
                                  },
                                  leading: Icon(Icons.home,
                                    color:HexColor(green.toString()),),
                                  title:  Text("319".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  selected: _selectPage==0,

                                ),
                                ListTile(
                                  onTap: (){
                                    _onPageSelected(1);
                                  },
                                  leading: Icon(Icons.watch_later,
                                    color: HexColor(green.toString()),),
                                  title:  Text("322".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  selected: _selectPage==1,

                                ),
                                ListTile(
                                  onTap: (){
                                    _onPageSelected(4);
                                    PharmacyHomeCubit.get(context).getPharmacyAndWarehouse();
                                    PharmacyHomeCubit.get(context).getShowWarehouse();
                                  },
                                  leading: Icon(Icons.my_library_add,
                                    color: HexColor(green.toString()),),
                                  title:  Text("323".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  selected: _selectPage==4,

                                ),
                                ListTile(
                                  onTap: (){
                                    _onPageSelected(6);
                                    PharmacyHomeCubit.get(context).getPharmacyAndWarehouse();
                                  },
                                  leading: Icon(Icons.my_library_add,
                                    color: HexColor(green.toString()),),
                                  title:  Text("324".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  selected: _selectPage==6,

                                ),
                                ListTile(
                                  onTap: (){
                                    _onPageSelected(2);
                                  },
                                  leading: Icon(Icons.language,
                                    color: HexColor(green.toString()),),
                                  title:  Text("325".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,

                                  ),
                                  ),
                                  selected: _selectPage==2,
                                ),
                                BlocConsumer<PharmacyRegisterCubit,PharmacyRegisterStates>(
                                  listener: (context, state) {

                                  },
                                  builder: (context, state) {
                                    return ListTile(
                                      onTap: (){
                                        _onPageSelected(3);
                                        PharmacyRegisterCubit.get(context).getDay();
                                        PharmacyRegisterCubit.get(context).getAllCity();
                                      },
                                      leading: Icon(Icons.local_pharmacy,
                                        color: HexColor(green.toString()),),
                                      title:  Text("326".tr,style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      selected: _selectPage==3,

                                    );
                                  },
                                ),
                                BlocConsumer<WarehouseRegisterCubit,WarehouseRegisterStates>(
                                  listener: (context, state) {

                                  },
                                  builder: (context, state) {
                                    return ListTile(
                                      onTap: (){
                                        _onPageSelected(5);
                                        WarehouseRegisterCubit.get(context).getAllCity();
                                      },
                                      leading: Icon(Icons.warehouse,
                                        color: HexColor(green.toString()),),
                                      title:  Text("327".tr,style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      selected: _selectPage==5,

                                    );
                                  },
                                ),

                                ConditionalBuilder(
                                  builder:(context) =>  ListTile(
                                    onTap: (){
                                      _onPageSelected(7);
                                      PharmacyHomeCubit.get(context).getPharmacy();
                                      //  PharmacyHomeCubit.get(context).getWarehouse();
                                    },
                                    leading: Icon(Icons.dashboard_customize,
                                      color: HexColor(green.toString()),),
                                    title:  Text("371".tr,style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    selected: _selectPage==7,

                                  ) ,
                                  fallback:(context) => SizedBox() ,
                                  condition: CacheHelper.getData(key: "adminLevel")==2,
                                ),
                                BlocConsumer<OrderWarehouseCubit,OrderWarehouseStates>(
                                  listener: (context, state) {

                                  },
                                  builder:(context, state) {
                                    return ConditionalBuilder(
                                      builder:(context) =>  ListTile(
                                        onTap: (){
                                          _onPageSelected(8);
                                          OrderWarehouseCubit.get(context).getInvoicesWarehouse();
                                        },
                                        leading: Icon(Icons.inventory_outlined,
                                          color: HexColor(green.toString()),),
                                        title:  Text("337".tr,style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        selected: _selectPage==8,

                                      ) ,
                                      fallback:(context) => SizedBox() ,
                                      condition: CacheHelper.getData(key: "adminLevel")==-2,
                                    );
                                  },
                                ),
                                ConditionalBuilder(
                                  builder:(context) =>  ListTile(
                                    onTap: (){
                                      _onPageSelected(9);
                                      PharmacyHomeCubit.get(context).getWarehouseWork();
                                    },
                                    leading: Icon(Icons.inventory_outlined,
                                      color: HexColor(green.toString()),),
                                    title: const Text("My Work",style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    selected: _selectPage==9,

                                  ) ,
                                  fallback:(context) => SizedBox() ,
                                  condition: CacheHelper.getData(key: "adminLevel")==-1,
                                ),
                                ListTile(
                                  onTap: (){
                                     print(CacheHelper.getData(key: 'accessToken'));
                                    PharmacyHomeCubit.get(context).singOut();

                                  },
                                  leading: Icon(Icons.logout,
                                    color: HexColor(green.toString()),),
                                  title:  Text("328".tr,style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),),

                                ),

                              ],

                            ),
                          )
                        ],
                      ),
                    )),
              ),
              child: _pages[_selectPage]
          ),
        );
      },
    );
  }
  void  drawerControl() {
    advancedDrawerController.showDrawer();
  }


}
