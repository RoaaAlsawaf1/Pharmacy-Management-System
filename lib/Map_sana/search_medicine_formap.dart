

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Map_sana/cubit.dart';
import 'package:pharmacy/Map_sana/google_map_try.dart';
import 'package:pharmacy/Map_sana/state.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';



class SearchMedicineScreen extends StatelessWidget {
  Position position;
  SearchMedicineScreen ({
  required   this.position
});
  var searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener:(context,state) {

        if(state is MapNearbySuccessState){
          var nearbylist = MapCubit.get(context).nearby;
          if(nearbylist != {}) {
            navigateTo(context: context, widget: Maptry(position: position, nearbylist: nearbylist));
          }
        }
        if(state is MapNearbyErrorState){
          showToast(text:"There is no nearby pharmacy ." ,state: ToastStates.EROOR);
        }

      },
      builder:(context,state)  {
        var searchlist = MapCubit.get(context).SearchMedicines;



        return  Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            titleSpacing: 0.0,
            leadingWidth: 46,
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

          ),

          body: Container(
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



                  defaultSearch(
                    controller:searchController,label:"Search for medicine".tr ,
                    // width:MediaQuery.of(context).size.width,
                    // height:MediaQuery.of(context).size.height*0.06,
                  type:TextInputType.text ,prefix:Icons.search_rounded ,
                   onChange: (value){
                    print(value);
                    MapCubit.get(context).getSearch(value: value);
                    },
                    validator:( value)
                    {
                      if(value.isEmpty)
                      {
                        return 'Search for medicine';
                      }
                      else{
                        return null;
                      }
                    },
                  )
                   ,
                  //Text
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:
                    ConditionalBuilder(
                      condition: state is !MapNearbyLoadingState ,
                      builder: (context) =>
                      Container(
                      height: MediaQuery.of(context).size.height*0.7,
                      width: double.infinity,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder:(context, index) {
                            return
                                InkWell(

                                  onTap: () async{

                                    // navigateTo(context: context, widget: Maptry(position : position));
                                    print(searchlist[index]['id']);
                                    await   MapCubit.get(context).getnearby(lat: position.latitude.toString(),
                                        lon: position.longitude.toString(), medicinid: searchlist[index]['id'].toString());





                                  },
                                  child: Container(
                                    width: 220,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:HexColor("E5E4E2"),
                                    ),
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:  CrossAxisAlignment.center,
                                      children: [

                                        Icon(Icons.medication)
                                        ,
                                        SizedBox(width: 5),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children: [

                                            Text("${searchlist[index]['trade_name_en']}  ${searchlist[index]['trade_name_ar']}"
                                              ,style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                            SizedBox(height: 5,),


                                            Text("${searchlist[index]['description_en']}  ${searchlist[index]['description_ar']}",style: TextStyle(
                                                fontSize: 11
                                            ),),

                                          ],
                                        )
                                      ],
                                    ),

                                  ),
                                );


                          },
                          separatorBuilder: (context, index) => SizedBox(height: 12),
                          itemCount: searchlist.length
                      ),
                    ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                    )
                  ),//pharmacy




                ],
              ),


            ),
          ),

        );

      },
    );



  }



}
