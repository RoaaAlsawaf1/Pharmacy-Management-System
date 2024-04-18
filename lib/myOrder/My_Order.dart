import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class MyOrderScreen extends StatelessWidget {
   MyOrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        titleSpacing: 0.0,
        leadingWidth: 70,
        elevation: 0.0,
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
        title: Text("My Order",style: TextStyle( color: Colors.black87)),
        leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: () {
            navigateTo(widget:drawerScreen() ,context:context);
          }, icon:Icon(Icons.arrow_back,color: Colors.black87,)),
        ),

         ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child:  ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildOrderItem(context),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              itemCount: 10),
        ),
      ),
    );
  }

  Widget buildOrderItem(context) => Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [

      Container(
        // height: MediaQuery.of(context).size.height*0.2,
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor("E5E4E2"),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                      height: 40,
                      width: 40,
                      image:AssetImage("images/logo3.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("pharmacy Name"),
                        SizedBox(
                          height: 5,
                        ),

                        Row(
                          children: [
                            Text("20 jun,11:35 am",style: TextStyle(
                              color: Colors.grey,

                            )),
                            SizedBox(
                              width: 44,
                            ),
                            Text("\$ 18.00|COD",style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey,
                            ))

                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 40,
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => buildOrderItem1(), separatorBuilder: (context, index) => SizedBox(
                            height: 4,
                          ), itemCount: 3),
                        )
                      ],
                    ),
                  ),



                ],
              ),
            )
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color:HexColor(green.toString()),

          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          ),
        ),
        height: 20,
        width: 100,
        child: Center(
          child: Text("out of Delivery",style: TextStyle(
            color: Colors.white,
            fontSize: 12
          )),
        ),

      ),
    ],

  );
  Widget buildOrderItem1() => Row(
    children:const [
      Text("parmacyName"),
      SizedBox(width: 8,),
      Text("quantity",style: TextStyle(
        color: Colors.grey
      ),),
      SizedBox(width: 4,),
      Text("titer",style: TextStyle(
          color: Colors.grey
      ),),
    ],

  );

}
