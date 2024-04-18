import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/dashboard/responsive.dart';
import 'package:pharmacy/dashboard/size_config.dart';
import 'package:pharmacy/dashboard/style.dart';
import 'package:pharmacy/shared/components/constant.dart';




class InfoCard extends StatelessWidget {
  final Icon? icon;
  final String? label;


  InfoCard({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: Responsive.isDesktop(context) ? 200 : SizeConfig.screenWidth!/2 - 40),
      padding: EdgeInsets.only(
          top: 20, bottom: 20, left: 20, right: Responsive.isMobile(context) ? 20 : 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white.withOpacity(0.2),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon!,
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          PrimaryText(
              text: label!,
              color: AppColors.secondary,
              size: 16),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),

        ],
      ),);
  }
}