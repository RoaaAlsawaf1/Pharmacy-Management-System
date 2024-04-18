
import 'package:pharmacy/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController{
  Locale intiallang =CacheHelper.getData(key: "lang")==null?Get.deviceLocale!: Locale(CacheHelper.getData(key: "lang"));
  void changeLang(String code){
    Locale local=Locale(code);
    CacheHelper.saveData(key: "lang", value: code);
    Get.updateLocale(local);
  }
}