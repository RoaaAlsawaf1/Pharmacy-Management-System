import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/Home/drawer.dart';
import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/constant_sana.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'dart:ui';

import 'package:pharmacy/shared/components/constant.dart';
class Maptry extends StatefulWidget {

  @override
  State<Maptry> createState() {
    return _Maptry();
  }
}
class _Maptry extends State<Maptry>{
  var mymarkers = HashSet<Marker>();

 late BitmapDescriptor  customemarker ;
  getcustomMarker()async{
    customemarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,'images/gpsblack.png') ;

  }

  @override
  void initState() {
    getcustomMarker();
    super.initState();
  }

  GoogleMapController ? mapController;
  late GoogleMapController googleMapController;
  late Marker _origin;
  late Marker _destination;
  final LatLng _center = LatLng(33.5138,36.2765);
  void _onmapcreated (GoogleMapController controller){
    setState(() {
      mymarkers.add(
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(33.5138,36.2765),
          icon: customemarker ,
          infoWindow: InfoWindow(
          title :  'some pharmacy',
            snippet: 'some informations '
          ),
          onTap: (){

          }

        )
      );
      if(_origin != null) mymarkers.add(_origin);
      if(_destination != null) mymarkers.add(_destination);
    });

  }
  changeMapMode(){
    getJsonFile("images/light.json").then(setMapStyle);
  }
  Future<String>getJsonFile(String path)async{
    return await rootBundle.loadString(path);
  }
  void setMapStyle(String mapStyle){
    googleMapController.setMapStyle(mapStyle);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth:double.infinity,
        leading: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    navigateAndFinish(context: context,widget: drawerScreen());
                  }, icon:Icon(Icons.arrow_back_rounded,color: Colors.black38,size: 25,) ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(" Nearby Pharmacies",
                          style: GoogleFonts.alikeAngular(fontSize: 16,color:HexColor(green.toString()), ),
                        ),//
                        SizedBox(height: 10,),
                        Row(

                          children: [
                            Icon(Icons.place,color:HexColor(green.toString()),size: 15,),
                            SizedBox(width: 2,),
                            Text("Hemilton Road,New York,USA",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600
                              ),
                            ),
                          ],),
                      ],
                    ),
                  ),// location


                ]    ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: ClipRRect(

                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  child:   Image.asset('images/placeholder1.png' ,width: 50,height: 50,)
              ),
            ),
          ],
        ),// icon go back



        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: Container(color: Colors.transparent,),
          ),
        ),

        backgroundColor:Colors.white.withAlpha(120) ,
        toolbarHeight: 130,
        elevation: 0,

      ),



      body: GoogleMap(
        mapType: MapType.normal,


        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
          changeMapMode();
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0
        ),
        markers: mymarkers,

      ),

      floatingActionButton: FloatingActionButton(
        splashColor: HexColor(green.toString()),
        backgroundColor: Colors.white,
        child:Image.asset('images/gpsblack.png',height: 30,width: 30),
        onPressed: () async {
      Position position = await _determinePosition();

      googleMapController.animateCamera(CameraUpdate.
      newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


      mymarkers.clear();

      mymarkers.add(Marker(markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        icon: customemarker ,
        infoWindow: InfoWindow(
            title :  'you are here',
            snippet: 'some informations '
        ),
      ));

      setState(() {});

    },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

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


}