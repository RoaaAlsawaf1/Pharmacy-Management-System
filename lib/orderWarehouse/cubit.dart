import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharmacy/InvoicesOrder/ModelShowOrder.dart';
import 'package:pharmacy/InvoicesOrder/ModelShowdetail.dart';
import 'package:pharmacy/InvoicesOrder/getDisModel.dart';
import 'package:pharmacy/orderWarehouse/ModelDetails.dart';
import 'package:pharmacy/orderWarehouse/ModelForOrderWare.dart';
import 'package:pharmacy/orderWarehouse/statue.dart';
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:pharmacy/shared/network/remote/dio_helper.dart';

class OrderWarehouseCubit extends Cubit<OrderWarehouseStates> {
  OrderWarehouseCubit() : super(OrderWarehouseInitialState());

  static OrderWarehouseCubit get(context) => BlocProvider.of(context);

 late OrderWarehouse orderWarehouse;

  Future<void>getOrderWarehouse({
  required id
})async {
    emit(OrderWarehouseLoadingState());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    DioHelper.getData(url: "warehouse/orders/${id}", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      print(value.data);
      orderWarehouse=OrderWarehouse.fromJson(value.data);
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");

      emit(OrderWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;

      print(statusCode);
      emit(OrderWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }

  late Details details;
  Map<dynamic, dynamic>invoiceMedicine={};
  Future<void>postDetails({
  required order_id,
    required warehouse_id,
})async {

    emit(DetailsLoadingState());
    DioHelper.postData(
      url: "order/showDetails",
      data:{
        "order_id":order_id,
        "warehouse_id":warehouse_id
      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
        print(value.data);
      details=Details.fromJson(value.data);

            details.orderDetails!.forEach((element) {
              invoiceMedicine.addAll(
               {
                 element.warehouseMedicineId .toString():{
                   "quantity":element.warehouseMedicine!.maxQuantity,
                   "offer_id":element.offerId,
                   "load_id": element.loadId,

                 }
               }
              );
            }) ;
            print(invoiceMedicine);

        print(details.orderDetails![0].quantity);
      emit(DetailsWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(DetailsWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }
  late GetDispenser getDispenser;
  late String? selectedDispensers = getDispenser.dispensers![0].user!.name; // تعريف متغير لتخزين اسم الدواء المختار
  late int? selectedDispensersId = getDispenser.dispensers![0].id; // تعريف متغير لتخزين id الدواء المختار

  List<DropdownMenuItem<String>> dispensersDropDownItems = []; // تعريف قائمة الادوية

  void getDDropDownItems() {
    dispensersDropDownItems = getDispenser.dispensers!.map((day) {
      return DropdownMenuItem<String>(
        value: day.user!.name,
        child: Text("${day.user!.name}",style: TextStyle(color: HexColor("6C6D72"),
            fontSize: 14)),
      );
    }).toList();

  }
  changeSelectedDispensers(String days) {
    getDDropDownItems();
    selectedDispensers = days;
    selectedDispensersId = getDispenser.dispensers!.firstWhere((day) => day.user!.name== days).id;
    return  selectedDispensers;
  }


  Future<void>getDis(

      )async {
print("getDis");
    DioHelper.getData(url: "warehouse/getDispensers/${CacheHelper.getData(key: "idW")}",
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print("getDis");

      print(value.data);

     getDispenser=GetDispenser.fromJson(value.data);


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);

      print(statusCode);
    });
  }










  Future<void>postCreateInvoice({
    required date_of_invoice,
    required order_id,

  })async {

    emit(InvoiceLoadingState());
    DioHelper.postData(
      url: "order/createInvoice",
      data:{
        "date_of_invoice":date_of_invoice,
        "order_id":order_id,
        "warehouseDispenser_id":selectedDispensersId,
        "invoice_medicines":invoiceMedicine,
      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {


      emit(InvoiceWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print("error.response.toString()");
      print(selectedDispensersId);
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(InvoiceWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }


  late invoicesModel invoices;

  Future<void>getInvoicesWarehouse(

  )async {
    emit(InvoicesShowWarehouseLoadingState());
print(InvoicesShowWarehouseLoadingState);
    DioHelper.getData(url: "order/showDispenserInvoices", token:CacheHelper.getData(key: 'accessToken'), ).then((value) {

      print(value.data);
      invoices=invoicesModel.fromJson(value.data);

print("bsfdghjklk");
      emit(InvoicesShowWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;
      print(error.response);
      emit(InvoicesShowWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }
  late InvoicesDetails invoicesDetails;

  Future<void>postDetailsInvoices({
    required invoice_id,

  })async {

    emit(InvoicesDetailsWarehouseLoadingState());
    DioHelper.postData(
      url: "order/showDispenserInvoicesDetails",
      data:{
        "invoice_id":invoice_id,

      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {
      print(value.data);
      invoicesDetails=InvoicesDetails.fromJson(value.data);



      emit(InvoicesDetailsWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(InvoicesDetailsWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }

  Future<void>confirmPaymentAndReceipt({
    required invoice_id,
    required qr_code,

  })async {

    emit(qr_codeDetailsWarehouseLoadingState());
    DioHelper.postData(
      url: "order/ConfirmPaymentAndReceipt",
      data:{
       "invoice_id":invoice_id,
        "qr_code":qr_code
      },
      token:CacheHelper.getData(key: 'accessToken'), ).then((value) {


      emit(qr_codeDetailsWarehouseSuccessState(value.statusCode));


    }).catchError((error){
      print(error.response.toString());
      int statusCode = error.response?.statusCode ?? -1;


      emit(qr_codeDetailsWarehouseErrorState(statusCode));
      print(statusCode);
    });
  }

}