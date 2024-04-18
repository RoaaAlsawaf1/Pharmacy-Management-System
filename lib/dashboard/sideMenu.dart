

import 'package:flutter/material.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/shared/components/constant.dart';

class SideMenu extends StatelessWidget {
   SideMenu({
    Key? key,
  }) : super(key: key);
   int _selectPage=0;
  final List<Widget>_pages=[

    HomeScreen(),



  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(color:Colors.grey[200]),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  //child: SvgPicture.asset('assets/mac-action.svg'),
                ),
              ),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                  color: AppColors.iconGray,),
                  onPressed: () {

                  }),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                    color: AppColors.iconGray,),
                  onPressed: () {

                  }),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                    color: AppColors.iconGray,),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                    color: AppColors.iconGray,),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                    color: AppColors.iconGray,),
                  onPressed: () {}),
              IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  icon: Icon(Icons.home,
                    color: AppColors.iconGray,),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
