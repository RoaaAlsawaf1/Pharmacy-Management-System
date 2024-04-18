import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/AreasModel/cubit.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Map_sana/cubit.dart';
import 'package:pharmacy/chats/cubit.dart';

import 'package:pharmacy/dashboard/dashboard.dart';
import 'package:pharmacy/local/local.dart';
import 'package:pharmacy/local/local_controller.dart';
import 'package:pharmacy/make_order/button_screen.dart';
import 'package:pharmacy/make_order/next_screen.dart';
import 'package:pharmacy/make_order/updatePharmacyM.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';
import 'package:pharmacy/update_information_medicine/Medicine_WareHouse.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:pharmacy/Pill_Reminder/global_bloc.dart';
import 'package:pharmacy/Rigester_Warehouse/cubit.dart';
import 'package:pharmacy/Rigester_pharmacy/cubit.dart';
import 'package:pharmacy/Rigester_user/cubit.dart';
import 'package:pharmacy/login/cubit.dart';
import 'package:pharmacy/login/login_screen.dart';
import 'package:pharmacy/shared/components/constant.dart';

import 'Home/home.dart';
import 'Medicen/pharmace_medisants.dart';
import 'update_information_medicine/Medicine_WareHousee.dart';
import 'update_information_medicine/update.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  GlobalBloc?globalBloc;
  @override
  void initState(){
    globalBloc=GlobalBloc();
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: MultiBlocProvider(

        providers: [
          BlocProvider(

            create:(context) =>PharmacyHomeCubit()..getAllPharmacyInHome(),


          ),
          BlocProvider(

            create:(context) =>PharmacyRegisterCubit()..getDay()..getAllCity(),


          ),
          BlocProvider(

            create:(context) =>UserRegisterCubit()..getAllCity(),


          ),
          BlocProvider(

            create:(context) =>MapCubit(),


          ),
          BlocProvider(

            create:(context) => ChatsCubit(),


          ),
          BlocProvider(

            create:(context) =>WarehouseRegisterCubit()..getAllCity(),


          ),
          BlocProvider(

            create:(context) =>OrderWarehouseCubit(),


          ),

          BlocProvider(

            create:(context) =>PharmacyLoginCubit(),

//PharmacyRegisterCubit
          ),


        ],
        child: BlocConsumer<PharmacyHomeCubit,PharmacyHomeStates>(
         listener: (context, state) {

         },
          builder: (context, state) {
            MyLocalController controller= Get.put(MyLocalController());

            return GetMaterialApp(
              builder: (context, child) => ResponsiveBreakpoints.builder(

                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              ),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
               // scaffoldBackgroundColor: AppColors.primaryBg,
                colorScheme: ColorScheme(
                    brightness: Brightness.light,
                    primary:HexColor(green.toString()), onPrimary:
                Colors.black87, secondary: HexColor(green.toString()),
                    onSecondary:Colors.black87, error: HexColor(green.toString()),
                    onError: HexColor(green.toString()), background: HexColor(green.toString()),
                    onBackground:  HexColor("E6E3E8"), surface: HexColor(green.toString()),
                    onSurface: HexColor(green.toString())),

                timePickerTheme: TimePickerThemeData(
                  backgroundColor: HexColor("E6E3E8"),
                  dialHandColor:  HexColor(green.toString()),
                  hourMinuteColor: HexColor("E6E3E8"),
                  hourMinuteTextColor:HexColor(green.toString()),
                  dayPeriodColor:HexColor("E6E3E8"),
                  dayPeriodTextColor:HexColor(green.toString()),

                ),

              ),
              locale:controller.intiallang,
              translations: MyLocal(),
              home: Login (),
            );
          },
        ),
      ),
    );
  }
}

