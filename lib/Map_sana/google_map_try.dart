import 'dart:collection';

import 'package:pharmacy/Home/home.dart';
import 'package:pharmacy/chats/chat_screen.dart';
import 'package:pharmacy/constant_sana.dart';

import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:ui';
class Maptry extends StatefulWidget {
  Position position;
  var nearbylist ;
  Maptry({
   required  this.position,
    required this.nearbylist,
});
  @override
  State<Maptry> createState() {
    return _Maptry(position: position , nearbylist: nearbylist);
  }
}
class _Maptry extends State<Maptry>{

  Position position;
  var nearbylist ;
  _Maptry({
    required this.position,
    required this.nearbylist,
});

 late BitmapDescriptor  customemarker ;
  getcustomMarker()async{
    customemarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'images/gpsblack.png' ) ;
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
  void initState() {
    print(nearbylist.toString());
    getcustomMarker();
    super.initState();
    getJsonData();
    setMarkers();
  }

 setPolyLines() {
   Polyline polyline = Polyline(
     polylineId: PolylineId("polyline"),
     color: Colors.lightBlue,
     points: polyPoints,
   );
 //  polyLines.add(polyline);

   polyLines.add(Polyline(
     polylineId: PolylineId("polyline1"),
     visible: true,
     width: 5, //width of polyline
     points: [
       LatLng(position.latitude, position.longitude) , //start point
       LatLng(double.parse(nearbylist['pharmacy']['latitude']),double.parse( nearbylist['pharmacy']['longitude'])), //end point
     ],
     color: Colors.deepPurpleAccent, //color of polyline
   ));

   setState(() {});
 }

    String distance = " ";
  String time =" ";


  late GoogleMapController googleMapController;
 var mymarkers = HashSet<Marker>();


 // For holding Co-ordinates as LatLng
 final List<LatLng> polyPoints = [];

//For holding instance of Polyline
  final Set<Polyline> polyLines = {};
// For holding instance of Marker
  final Set<Marker> markers = {};
  var data;

// Dummy Start and Destination Points
//homs lat 34.732427
  //homs lon 36.713696



   LatLng _center = LatLng(34.732427,36.713696);


  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
    changeMapMode();

  }
  setMarkers() {
    markers.add(Marker(
      markerId: MarkerId("Home"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
     // position: LatLng(startLat, startLng),
      position:LatLng(position.latitude, position.longitude) ,
      infoWindow: InfoWindow(
        title: "your location",
        snippet: "Home Sweet Home",
      ),
      onTap: (){


      }
    ),
    );
    markers.add(Marker(
      markerId: MarkerId("Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(double.parse(nearbylist['pharmacy']['latitude']),double.parse( nearbylist['pharmacy']['longitude'])),
      infoWindow: InfoWindow(
        title: nearbylist['pharmacy']['pharmacyName'].toString(),
        snippet: nearbylist['pharmacy']['number'].toString(),
      ),
      onTap: (){
        navigateTo(context: context, widget: Chat_screen(otherId: nearbylist['pharmacy']['user_id'].toString(), othername:nearbylist['pharmacy']['pharmacyName'].toString() ,));
      }
    ));
    setState(() {});
  }


  @override
  void dispose(){
    googleMapController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth:double.infinity

        ,leading: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    navigateAndFinish(context: context,widget: HomeScreen());
                  }, icon:Icon(Icons.arrow_back_rounded,color: Colors.black,size: 25,) ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Nearby Pharmacy",
                          style: GoogleFonts.alikeAngular(fontSize: 16,color:HexColor(green.toString()), ),
                        ),//
                        SizedBox(height: 10,),
                        Row(

                          children: [
                            Icon(Icons.place,color:HexColor(green.toString()),size: 15,),
                            SizedBox(width: 2,),
                            Text(nearbylist['pharmacy']['pharmacyName'].toString(),
                              style: TextStyle(
                                  fontSize: 14,
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
                  child:   Image.asset('images/placeholder1.png' ,width: 70,height: 70,)
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

        backgroundColor:thirdBackColor.withAlpha(150) ,
        toolbarHeight: 130,
        elevation: 0,



      ),



      body:
      Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 17
            ),

           markers: markers,

            polylines: polyLines,

          ),

            Positioned(
              top: 170.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: HexColor(green.toString()),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child:
                  Row (
                    children: [
                          TextButton(
                            onPressed: () => googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(position.latitude, position.longitude),
                                  zoom: 20.5,
                                  tilt: 50.0,
                                ),
                              ),
                            ),

                            child: const Text('ORIGIN' , style: TextStyle(fontWeight: FontWeight.w400,
                                color:  Colors.white),),
                          ),
                          TextButton(
                            onPressed: () => googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(double.parse(nearbylist['pharmacy']['latitude']),double.parse( nearbylist['pharmacy']['longitude'])),
                                  zoom: 20.5,
                                  tilt: 50.0,
                                ),
                              ),
                            ),
                            child: const Text('DEST' , style: TextStyle(fontWeight: FontWeight.w400,
                                color:  Colors.white),),
                          )
                    ],
                  )
              ),
            ),
        ],
      ),



    );
  }

  // to get current position

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


  void getJsonData() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    // NetworkHelper network = NetworkHelper(
    //   startLat: position.latitude,
    //   startLng: position.longitude,
    //   endLat: double.parse(nearbylist['pharmacy']['latitude']),
    //   endLng: double.parse( nearbylist['pharmacy']['longitude']),
    // );

   // try {
     //  getData() returns a json Decoded data
    //  data = await network.getData();

     // distanceandtime dt = distanceandtime(nearbylist['features']['properties']['segments']['distance'],data['features']['properties']['segments']['duration']);

   //   distance = dt.distanse;
    //  time = dt.time;
      // We can reach to our desired JSON data manually as following
      LineString ls = LineString(
          nearbylist['coordinates']);
      polyPoints.add(LatLng(position.latitude, position.longitude));

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }
      polyPoints.add( LatLng(double.parse(nearbylist['pharmacy']['latitude']),double.parse( nearbylist['pharmacy']['longitude'])));
      setPolyLines();


  // }
  // catch(e){
   //   print(e);
  // }
  }


}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}

class distanceandtime {
  distanceandtime(this.distanse,this.time);
  String distanse;
  String time ;
}