//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:pharmacy/dashboard/cubit/createMedicine.dart';
// import 'package:pharmacy/shared/components/components.dart';
// import 'package:pharmacy/shared/components/constant.dart';
//
//
// class Medicine_Read_BarCode extends StatefulWidget {
//   @override
//   State<Medicine_Read_BarCode> createState() {
//     return _Medicine_Read_BarCode();
//   }
// }
//
// class _Medicine_Read_BarCode extends State<Medicine_Read_BarCode>{
//   String _scanBarcode = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         green, 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//          Scaffold(
//              extendBodyBehindAppBar: true,
//              appBar:   AppBar(
//                toolbarHeight: 80,
//                titleSpacing: 0.0,
//                leadingWidth: 70,
//                elevation: 0.0,
//
//                flexibleSpace: ClipRect(
//                  child: BackdropFilter(
//                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
//                    child: Container(color: Colors.transparent,),
//                  ),
//                ),
//
//                backgroundColor:Colors.white.withAlpha(100) ,
//
//                title: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
//                  child:  Text("Barcode scan",
//                      style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16, color: Colors.black,
//                      )),
//                ),
//                leading:Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: IconButton(onPressed: () {
//                    navigateAndFinish(context: context,widget: CreateMedicine());
//                  }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
//                ),
//
//              ),
//             body: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Builder(builder: (BuildContext context) {
//                 return Container(
//                     height: MediaQuery.of(
//                         context)
//                         .size
//                         .height,
//                     width: MediaQuery.of(
//                         context)
//                         .size
//                         .width,
//                     decoration:
//                     BoxDecoration(
//                       gradient:
//                       LinearGradient(
//                         begin: Alignment
//                             .topRight,
//                         end: Alignment
//                             .bottomLeft,
//                         colors: [
//                           HexColor(
//                               'A8BEE7'),
//                           HexColor(
//                               'AEC9DE'),
//                           //gray light
//                           //gray dark
//                           HexColor(
//                               'BBC5CE'),
//                           HexColor(
//                               'BDB9C7'),
//                           //
//                           HexColor(
//                               'D3C8CC'),
//                           HexColor(
//                               'D3CACF'),
//                           HexColor(
//                               'DBD9DE'),
//                           HexColor(
//                               'D7D2D8'),
//                         ],
//                         tileMode:
//                         TileMode.clamp,
//                       ),
//                     ),
//                     alignment: Alignment.center,
//                     child: Flex(
//                         direction: Axis.vertical,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           ElevatedButton(
//                               onPressed: () => scanBarcodeNormal(),
//                               child: Text('Start barcode scan')),
//
//                           Text('Scan result : $_scanBarcode\n',
//                               style: TextStyle(fontSize: 20))
//                         ]));
//               }),
//             ));
//   }
//
// }
