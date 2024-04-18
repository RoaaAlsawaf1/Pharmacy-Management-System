import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/Model/UserModel.dart';
import 'package:pharmacy/dashboard/cubit/ModelDshBordWarehouse.dart';
import 'package:pharmacy/make_order/Model.dart';

import '../../dashboard/cubit/ModelDashBordPharmacy.dart';

abstract class PharmacyHomeStates {}

class PharmacyInitialState extends PharmacyHomeStates {}

class PharmacyLoadingState extends PharmacyHomeStates {}
class PharmacySuccessState extends PharmacyHomeStates {
  var value;
  PharmacySuccessState(this.value);
}
class PharmacyErrorState extends PharmacyHomeStates {
  var error;

  PharmacyErrorState(this.error);
}
////////////////////////////////////////////mypharmacy
class PharmacyWInitialState extends PharmacyHomeStates {}

class PharmacyWLoadingState extends PharmacyHomeStates {

}
class PharmacyWSuccessState extends PharmacyHomeStates {
  final ModelPharmacy modelPharmacy;
  var value;
  PharmacyWSuccessState(this.value, this.modelPharmacy);

}
class PharmacyWErrorState extends PharmacyHomeStates {
  var error;

  PharmacyWErrorState(this.error);
}
//////////////////////////////////////////////////////dash
class PharmacyDashBordInitialState extends PharmacyHomeStates {}

class PharmacyDashBordLoadingState extends PharmacyHomeStates {}
class PharmacyDashBordSuccessState extends PharmacyHomeStates {
  final DashBordPharmacy dashBordPharmacy;
  var value;
  PharmacyDashBordSuccessState(this.dashBordPharmacy,this.value);

}
class PharmacyDashBordErrorState extends PharmacyHomeStates {
  var error;

  PharmacyDashBordErrorState(this.error);
}
/////////////////////////////////////////////////////validation


class ValidationLoadingState extends PharmacyHomeStates {}
class ValidationSuccessState extends PharmacyHomeStates {

  var value;
  ValidationSuccessState(this.value);

}
class ValidationErrorState extends PharmacyHomeStates {
  var error;

  ValidationErrorState(this.error);
}






////////////////////////////////////////////////////////////////
class WarehouseDashBordInitialState extends PharmacyHomeStates {}

class WarehouseDashBordLoadingState extends PharmacyHomeStates {}
class WarehouseDashBordSuccessState extends PharmacyHomeStates {
  final DashBordWarehouse dashBordWarehouse;
  var value;
  WarehouseDashBordSuccessState(this.dashBordWarehouse,this.value);

}
class WarehouseDashBordErrorState extends PharmacyHomeStates {
  var error;

  WarehouseDashBordErrorState(this.error);
}
/////////////////////////////////////////////////////validation


class WarehouseValidationLoadingState extends PharmacyHomeStates {}
class WarehouseValidationSuccessState extends PharmacyHomeStates {

  var value;
  WarehouseValidationSuccessState(this.value);

}
class WarehouseValidationErrorState extends PharmacyHomeStates {
  var error;

  WarehouseValidationErrorState(this.error);
}
class UserLoadingDataState extends PharmacyHomeStates {}
class UserSuccessDataState extends PharmacyHomeStates {
  final UserModel userModel;
  var value;
  UserSuccessDataState(this.value, this.userModel);
}
class UserErrorDataState extends PharmacyHomeStates {
  var error;

  UserErrorDataState(this.error);
}

class DeletePharmacyLoadingDataState extends PharmacyHomeStates {}
class DeletePharmacySuccessDataState extends PharmacyHomeStates {

  var value;
  DeletePharmacySuccessDataState(this.value);
}
class DeletePharmacyErrorDataState extends PharmacyHomeStates {
  var error;

  DeletePharmacyErrorDataState(this.error);
}

class DeleteWarehouseLoadingDataState extends PharmacyHomeStates {}
class DeleteWarehouseSuccessDataState extends PharmacyHomeStates {

  var value;
  DeleteWarehouseSuccessDataState(this.value);
}
class DeleteWarehouseErrorDataState extends PharmacyHomeStates {
  var error;

  DeleteWarehouseErrorDataState(this.error);
}

class AddAdminLoadingDataState extends PharmacyHomeStates {}
class AddAdminSuccessDataState extends PharmacyHomeStates {

  var value;
  AddAdminSuccessDataState(this.value);
}
class AddAdminErrorDataState extends PharmacyHomeStates {
  var error;

  AddAdminErrorDataState(this.error);
}


class MLoadingDataState extends PharmacyHomeStates {}
class MSuccessDataState extends PharmacyHomeStates {

  var value;
  MSuccessDataState(this.value);
}
class MErrorDataState extends PharmacyHomeStates {
  var error;

  MErrorDataState(this.error);
}

class CLoadingDataState extends PharmacyHomeStates {}
class CSuccessDataState extends PharmacyHomeStates {

  var value;
  CSuccessDataState(this.value);
}
class CErrorDataState extends PharmacyHomeStates {
  var error;

  CErrorDataState(this.error);
}
class MapInitialState extends PharmacyHomeStates {}

class MapSearchLoadingState extends PharmacyHomeStates {}
class MapSearchSuccessState extends PharmacyHomeStates {
}
class MapSearchErrorState extends PharmacyHomeStates {
  var error;

  MapSearchErrorState(this.error);
}
class UpdateLoadingState extends PharmacyHomeStates {}
class  UpdateSuccessState extends PharmacyHomeStates {
  var value;
  UpdateSuccessState(this.value);
}
class  UpdateErrorState extends PharmacyHomeStates {
  var error;

  UpdateErrorState(this.error);
}
class PharmacySearchLoadingState extends PharmacyHomeStates {}
class PharmacySearchSuccessState extends PharmacyHomeStates {
}
class PharmacySearchErrorState extends PharmacyHomeStates {


  PharmacySearchErrorState();
}
class PhUpdateLoadingState extends PharmacyHomeStates {}
class  PhUpdateSuccessState extends PharmacyHomeStates {
  var value;
  PhUpdateSuccessState(this.value);
}
class  PhUpdateErrorState extends PharmacyHomeStates {
  var error;

  PhUpdateErrorState(this.error);
}

class AddOffersLoadingState extends PharmacyHomeStates {}
class  AddOffersSuccessState extends PharmacyHomeStates {
  var value;
  AddOffersSuccessState(this.value);
}
class  AddOffersErrorState extends PharmacyHomeStates {
  var error;

  AddOffersErrorState(this.error);
}

class DeleteOffersLoadingState extends PharmacyHomeStates {}
class  DeleteOffersSuccessState extends PharmacyHomeStates {
  var value;
  DeleteOffersSuccessState(this.value);
}
class  DeleteOffersErrorState extends PharmacyHomeStates {
  var error;

  DeleteOffersErrorState(this.error);
}

class DeleteLoadsLoadingState extends PharmacyHomeStates {}
class  DeleteLoadsSuccessState extends PharmacyHomeStates {
  var value;
  DeleteLoadsSuccessState(this.value);
}
class  DeleteLoadsErrorState extends PharmacyHomeStates {
  var error;

  DeleteLoadsErrorState(this.error);
}

class AddLoadsLoadingState extends PharmacyHomeStates {}
class  AddLoadsSuccessState extends PharmacyHomeStates {
  var value;
  AddLoadsSuccessState(this.value);
}
class  AddLoadsErrorState extends PharmacyHomeStates {
  var error;

  AddLoadsErrorState(this.error);
}
class GetOffersLoadingState extends PharmacyHomeStates {}
class  GetOffersSuccessState extends PharmacyHomeStates {
  var value;
  GetOffersSuccessState(this.value);
}
class  GetOffersErrorState extends PharmacyHomeStates {
  var error;

  GetOffersErrorState(this.error);
}
////////////////////////////////////////////////////////////////////////////////
class GetLoadsLoadingState extends PharmacyHomeStates {}
class  GetLoadsSuccessState extends PharmacyHomeStates {
  var value;
  GetLoadsSuccessState(this.value);
}
class  GetLoadsErrorState extends PharmacyHomeStates {
  var error;

  GetLoadsErrorState(this.error);
}
///////////////////////////////////////////////////////////////////////////////////
class GetWarehouseMedicineAndOffersLoadingState extends PharmacyHomeStates {}
class GetWarehouseMedicineAndOffersSuccessState extends PharmacyHomeStates {
  var value;

  GetWarehouseMedicineAndOffersSuccessState(this.value);
}
class  GetWarehouseMedicineAndOffersErrorState extends PharmacyHomeStates {
  var error;

  GetWarehouseMedicineAndOffersErrorState(this.error);
}


class CreateOrderLoadingState extends PharmacyHomeStates {}
class CreateOrderSuccessState extends PharmacyHomeStates {
  var value;

  CreateOrderSuccessState(this.value);
}
class  CreateOrderErrorState extends PharmacyHomeStates {
  var error;

  CreateOrderErrorState(this.error);
}
class WarehouseAddEmpAndDisInitialState extends PharmacyHomeStates {}

class WarehouseAddEmpLoadingState extends PharmacyHomeStates {}
class WarehouseAddEmpSuccessState extends PharmacyHomeStates {
  var value;
  WarehouseAddEmpSuccessState(this.value);
}
class WarehouseAddEmpErrorState extends PharmacyHomeStates {
  var error;

  WarehouseAddEmpErrorState(this.error);
}


//createMedicine
class WarehouseAddDisLoadingState extends PharmacyHomeStates {}
class WarehouseAddDisSuccessState extends PharmacyHomeStates {
  var value;
  WarehouseAddDisSuccessState(this.value);
}
class WarehouseAddDisErrorState extends PharmacyHomeStates {
  var error;

  WarehouseAddDisErrorState(this.error);
}

class CreateMedicineWarehouseAddDisLoadingState extends PharmacyHomeStates {}
class CreateMedicineWarehouseAddDisSuccessState extends PharmacyHomeStates {
  var value;
  CreateMedicineWarehouseAddDisSuccessState(this.value);
}
class CreateMedicineWarehouseAddDisErrorState extends PharmacyHomeStates {
  var error;

  CreateMedicineWarehouseAddDisErrorState(this.error);
}


class GetPharmacyInHomeLoadingState extends PharmacyHomeStates {}
class GetPharmacyInHomeSuccessState extends PharmacyHomeStates {
  var value;
  GetPharmacyInHomeSuccessState(this.value);
}
class GetPharmacyInHomeErrorState extends PharmacyHomeStates {
  var error;

  GetPharmacyInHomeErrorState(this.error);
}

class GetPharmacyMedicineInHomeLoadingState extends PharmacyHomeStates {}
class GetPharmacyMedicineInHomeSuccessState extends PharmacyHomeStates {
  var value;
  GetPharmacyMedicineInHomeSuccessState(this.value);
}
class GetPharmacyMedicineInHomeErrorState extends PharmacyHomeStates {
  var error;

  GetPharmacyMedicineInHomeErrorState(this.error);
}


class GetPharmacyMedicineSemilarInHomeLoadingState extends PharmacyHomeStates {}
class GetPharmacyMedicineSemilarInHomeSuccessState extends PharmacyHomeStates {
  var value;
  GetPharmacyMedicineSemilarInHomeSuccessState(this.value);
}
class GetPharmacyMedicineSemilarInHomeErrorState extends PharmacyHomeStates {
  var error;

  GetPharmacyMedicineSemilarInHomeErrorState(this.error);
}

class GetSearchHomeInHomeLoadingState extends PharmacyHomeStates {}
class GetSearchHomeInHomeSuccessState extends PharmacyHomeStates {
  var value;
  GetSearchHomeInHomeSuccessState(this.value);
}
class GetSearchHomeInHomeErrorState extends PharmacyHomeStates {
  var error;

  GetSearchHomeInHomeErrorState(this.error);
}
class WarehouseIWorksLoadingState extends PharmacyHomeStates {}
class WarehouseIWorksSuccessState extends PharmacyHomeStates {
  var value;
  WarehouseIWorksSuccessState(this.value);
}
class WarehouseIWorksErrorState extends PharmacyHomeStates {
  var error;

  WarehouseIWorksErrorState(this.error);
}

class OrderWarehouseLoadingState extends PharmacyHomeStates {

}
class OrderWarehouseSuccessState extends PharmacyHomeStates {

  var value;
  OrderWarehouseSuccessState(this.value);

}
class OrderWarehouseErrorState extends PharmacyHomeStates {
  var error;

  OrderWarehouseErrorState(this.error);
}



class DetailsLoadingState extends PharmacyHomeStates {

}
class DetailsWarehouseSuccessState extends PharmacyHomeStates {

  var value;
  DetailsWarehouseSuccessState(this.value);

}
class DetailsWarehouseErrorState extends PharmacyHomeStates {
  var error;

  DetailsWarehouseErrorState(this.error);
}


class InvoiceLoadingState extends PharmacyHomeStates {

}
class InvoiceWarehouseSuccessState extends PharmacyHomeStates {

  var value;
  InvoiceWarehouseSuccessState(this.value);

}
class InvoiceWarehouseErrorState extends PharmacyHomeStates {
  var error;

  InvoiceWarehouseErrorState(this.error);
}
class generatePharmacy_QR_CubitLoadingState extends PharmacyHomeStates {}
class generatePharmacy_QR_CubitSuccessState extends PharmacyHomeStates {

  var value;
  generatePharmacy_QR_CubitSuccessState(this.value);
}
class generatePharmacy_QR_CubitErrorState extends PharmacyHomeStates {
  var error;

  generatePharmacy_QR_CubitErrorState(this.error);
}

