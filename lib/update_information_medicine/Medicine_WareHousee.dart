import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/update_information_medicine/update.dart';

class MedicineWarehousee extends StatelessWidget {
   MedicineWarehousee({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
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
        child: Padding(
          padding: const EdgeInsets.only(top:40),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(

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
                clipBehavior: Clip.none,
                shape: const StadiumBorder(),
                scrolledUnderElevation: 0.0,
                titleSpacing: 0.0,
                backgroundColor: Colors.white,
                floating:
                true, // We can also uncomment this line and set `pinned` to true to see a pinned search bar.
                title: SearchAnchor.bar(

                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<Widget>.generate(
                      5,
                          (int index) {
                        return ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Text('Initial list item $index'),
                        );
                      },
                    );
                  },
                ),
              ),
              // The listed items below are just for filling the screen
              // so we can see the scrolling effect.
              SliverToBoxAdapter(
                child: Container(

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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                      height:10000,
                      child: ListView.separated(

                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => buildMedicine(context),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: 4),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );

  }
  Widget buildMedicine(context) =>  InkWell(
    onTap: () {
      navigateTo(widget: Update(),context: context);
    },
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(

             height: MediaQuery.of(context).size.height*0.1,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:Colors.white.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Medicine",style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(
            decoration: BoxDecoration(
              color:HexColor(green.toString()),

              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(16)
              ),
            ),
            height: 30,
            width: 150,
           child: Center(child: Text("Go to update",style: TextStyle(color: Colors.white,fontSize: 12),)),

          ),
        ),
      ],

    ),
  );
}
