//pharmacy
import 'package:pharmacy/Model/Register_pharmacy.dart';

abstract class PharmacyRegisterStates {}

class PharmacyAddInitialState extends PharmacyRegisterStates {}

class PharmacyAddLoadingState extends PharmacyRegisterStates {

}
class PharmacyAddSuccessState extends PharmacyRegisterStates {

  var value;
  PharmacyAddSuccessState(this.value);

}
class PharmacyAddErrorState extends PharmacyRegisterStates {
  var error;

  PharmacyAddErrorState(this.error);
}
class PharmacyAddChangeDropGenderState extends PharmacyRegisterStates {
}

class PharmacyChangeDropCityState extends PharmacyRegisterStates {
}
class ChangePassWordVisibilityState extends PharmacyRegisterStates{}