import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/cubit/cubit.dart';
import 'package:pharmacy/Home/cubit/status.dart';
import 'package:pharmacy/dashboard/cubit/Material.dart';
import 'package:pharmacy/dashboard/paymentDetailesList.dart';
import 'package:pharmacy/dashboard/responsive.dart';
import 'package:pharmacy/dashboard/sideMenu.dart';
import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/dashboard/style.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

import 'appBarActionItem.dart';
import 'cubit/createMedicine.dart';
import 'headers.dart';
import 'historyTable.dart';
import 'infoCard.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var emailController = TextEditingController();

  var materialController = TextEditingController();

  var companyController = TextEditingController();

  var materialArController = TextEditingController();

  var companyArController = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////////


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<PharmacyHomeCubit, PharmacyHomeStates>(
      listener: (context, state) {
        if (state is AddAdminSuccessDataState) {
          if (state.value == 200) {
            showToast(text: "Add Successfully", state: ToastStates.EROOR);

            emailController.clear();
          }
        }
        if (state is AddAdminErrorDataState) {
          if (state.error == 400) {
            showToast(text: "invalid email", state: ToastStates.EROOR);
          } else {
            showToast(text: "error", state: ToastStates.EROOR);
          }
        }

        if (state is MSuccessDataState) {
          if (state.value == 200) {
            showToast(
                text: "active material has been created",
                state: ToastStates.EROOR);
            materialArController.clear();
            materialController.clear();
          }
        }
        if (state is MErrorDataState) {
          if (state.error == 400) {
            showToast(text: "invalid name", state: ToastStates.EROOR);
          } else {
            showToast(text: "error", state: ToastStates.EROOR);
          }
        }

        if (state is CSuccessDataState) {
          if (state.value == 200) {
            showToast(
                text: "Company has been created", state: ToastStates.EROOR);
            companyArController.clear();
            companyController.clear();
          }
        }
        if (state is CErrorDataState) {
          if (state.error == 400) {
            showToast(text: "invalid name", state: ToastStates.EROOR);
          } else {
            showToast(text: "error", state: ToastStates.EROOR);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _drawerKey,
          drawer: SizedBox(width: 100, child: SideMenu()),
          appBar: !Responsive.isDesktop(context)
              ? AppBar(
                  elevation: 0,
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
                  leading: IconButton(
                      onPressed: () {
                        _drawerKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu, color: AppColors.black)),
                )
              : const PreferredSize(
                  preferredSize: Size.zero,
                  child: SizedBox(),
                ),
          body: SafeArea(
            child: Container(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 1,
                      child: SideMenu(),
                    ),
                  Expanded(
                      flex: 10,
                      child: SafeArea(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Header(),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 4,
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  alignment: WrapAlignment.spaceBetween,
                                  children: [
                                    //////////////////////////////////////////////////////////////////////////////////////////roaa
                                    InkWell(

                                      child: InfoCard(
                                        icon: const Icon(
                                            Icons.medical_services_outlined),
                                        label: 'Create Medicine',
                                      ),
                                      onTap: () {
                                        navigateTo(context: context,widget: CreateMedicine());

                                      },
                                    ),
                                    ////////////////////////////////////////////////////////////////////////////////////////roro
                                    InkWell(
                                      onTap: () {
                                        navigateTo(context: context,widget: MaterailScreen());
                                      },
                                      child: InfoCard(
                                        icon:
                                        const Icon(Icons.science_outlined),
                                        label: 'Create Material',
                                      ),
                                    ),
                                    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////roro
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 5,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PrimaryText(
                                          text: 'Add an employee',
                                          size: 20,
                                          fontWeight: FontWeight.w800),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only( topLeft: Radius.circular(35),bottomLeft: Radius.circular(35)),
                                        color: Colors.white.withOpacity(0.3),),
                                      child: defaultTextFieldPharmacyDashboard(
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validate: (value) {},
                                        prefix: Icons.email,
                                        hint: "email",
                                      ),
                                    ),
                                  ),
                                  ConditionalBuilder(
                                    builder: (context) => Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: HexColor(green.toString()),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(35),
                                              bottomRight: Radius.circular(35)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              HexColor('56949a'),
                                              HexColor('3e8489'),
                                            ],
                                          ),
                                        ),
                                        child: MaterialButton(
                                            splashColor:
                                                HexColor(green.toString()),
                                            onPressed: () {
                                              PharmacyHomeCubit.get(context)
                                                  .addAdmin(
                                                      email:
                                                          emailController.text);
                                            },
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ),
                                    condition: !Responsive.isDesktop(context),
                                    fallback: (context) => Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: HexColor(green.toString()),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(35),
                                              bottomRight: Radius.circular(35)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              HexColor('56949a'),
                                              HexColor('3e8489'),
                                            ],
                                          ),
                                        ),
                                        child: MaterialButton(
                                            splashColor:
                                                HexColor(green.toString()),
                                            onPressed: () {
                                              PharmacyHomeCubit.get(context)
                                                  .addAdmin(
                                                      email:
                                                          emailController.text);
                                            },
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical! * 5,
                              ),
                              if (!Responsive.isDesktop(context))
                                PaymentDetailList()
                            ],
                          ),
                        ),
                      )),
                  if (Responsive.isDesktop(context))
                    Expanded(
                      flex: 4,
                      child: SafeArea(
                        child: Container(
                          width: double.infinity,
                          height: SizeConfig.screenHeight,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 30),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Column(
                                children: [
                                  //   const AppBarActionItems(),
                                  PaymentDetailList(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
