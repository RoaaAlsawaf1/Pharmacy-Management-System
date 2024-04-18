import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/orderWarehouse/cubit.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'Success_Screen_Invoise_barcode.dart';


class Pharmacy_Read_QRCode extends StatefulWidget
{
  const Pharmacy_Read_QRCode({Key? key}) : super(key: key);

  @override
  State<Pharmacy_Read_QRCode> createState() => _Pharmacy_Read_QRCodeState();
}

class _Pharmacy_Read_QRCodeState extends State<Pharmacy_Read_QRCode> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble()async {
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<OrderWarehouseCubit,OrderWarehouseStates>(
        listener: (context, state) {
          if(state is qr_codeDetailsWarehouseSuccessState){
            if(state.value==200){
              navigateAndFinish(context: context,widget: SuccessScreen_bar());

              OrderWarehouseCubit.get(context).getInvoicesWarehouse();
            }
          }
        },
      builder: (context, state) {
         return SafeArea(child: Scaffold(


       body: Stack(
  alignment: Alignment.center,

      children: [
      buildQrview(context),
  Positioned(bottom: 10,child: buildresult()),

  ],




  ),
         ) );
},



        );





  }

  Widget buildQrview(BuildContext context) => QRView(key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width*0.8,
      borderWidth: 10,
      borderLength: 20,
      borderRadius: 10,
      borderColor: HexColor(green.toString()),
    ),
  );

  Widget buildresult()=>
      Container(
          padding: EdgeInsets.all(12),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white24
          ),
          child:   Text(
            barcode != null ?  barcode!.code.toString() : 'Scan a code!',
            maxLines: 3,
          )
      )
  ;

  void onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((val)=>
        setState(() {
          this.barcode = val;
          print("llll   ${barcode!.code}");
          OrderWarehouseCubit.get(context).confirmPaymentAndReceipt(invoice_id:CacheHelper.getData(key: "invoices_id_"), qr_code:barcode!.code);
        })
    );
  }



}

