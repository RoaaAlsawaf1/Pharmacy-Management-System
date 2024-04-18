import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/shared/components/constant.dart';




class AppBarActionItems extends StatelessWidget {
  const AppBarActionItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: const Icon(Icons.home,
              color: AppColors.iconGray,
            weight: 10,),
            onPressed: () {}),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            icon: const Icon(Icons.notification_add_outlined,
              color: AppColors.iconGray,
              weight: 10,),
            onPressed: () {}),
        const SizedBox(
          width: 20,
        ),

        const Row(children: [
          CircleAvatar(
            radius: 17,
            // backgroundImage: NetworkImage(
            //   'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
            // ),
          ),
          Icon(Icons.arrow_drop_down_outlined, color: AppColors.black)
        ]),
      ],
    );
  }
}