import 'package:pharmacy/Model/Login_Model.dart';
import 'package:pharmacy/Model/Register_pharmacy.dart';
import 'package:pharmacy/Model/UserModel.dart';

import '../AreasModel/areas_model.dart';

abstract class PharmacyLoginStates {}

class PharmacyInitialState extends PharmacyLoginStates {}

class PharmacyLoadingState extends PharmacyLoginStates {}
class PharmacySuccessState extends PharmacyLoginStates {
  final LoginModel loginModel;
  var value;
  PharmacySuccessState(this.loginModel,this.value);

}
class PharmacyErrorState extends PharmacyLoginStates {
  var error;

  PharmacyErrorState(this.error);
}

class ChangePassWordVisibilityState extends PharmacyLoginStates{}
///////////////////////////////////////////////
class AreasLoadingState extends PharmacyLoginStates {}
class AreasSuccessState extends PharmacyLoginStates {
  final AreasModel areasModel;
  var value;
  AreasSuccessState(this.areasModel,this.value);

}
class AreasErrorState extends PharmacyLoginStates {
  var error;

  AreasErrorState(this.error);
}
class UserLoadingDataState extends PharmacyLoginStates {}
class UserSuccessDataState extends PharmacyLoginStates {
  final UserModel userModel;
  var value;
  UserSuccessDataState(this.value, this.userModel);
}
class UserErrorDataState extends PharmacyLoginStates {
  var error;

  UserErrorDataState(this.error);
}
///////////////////////////////////////////
class PharmacyWInitialState extends PharmacyLoginStates {}

class PharmacyWLoadingState extends PharmacyLoginStates {

}
class PharmacyWSuccessState extends PharmacyLoginStates {
  final ModelPharmacy modelPharmacy;
  var value;
  PharmacyWSuccessState(this.value, this.modelPharmacy);

}
class PharmacyWErrorState extends PharmacyLoginStates {
  var error;

  PharmacyWErrorState(this.error);
}