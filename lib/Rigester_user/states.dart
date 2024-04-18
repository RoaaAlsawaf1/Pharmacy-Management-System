//user
import 'package:pharmacy/Model/RigesterUser_Model.dart';
import 'package:pharmacy/Model/UserModel.dart';

abstract class UserRegisterStates {}

class UserInitialState extends UserRegisterStates {}
class UserLoadingState extends UserRegisterStates {}
class UserSuccessState extends UserRegisterStates {
  final RegisterUser registerUser;
  var value;
  UserSuccessState(this.registerUser,this.value);
}
class UserErrorState extends UserRegisterStates {
  var error;


  UserErrorState(this.error);
}
class UserChangeDropGenderState extends UserRegisterStates {
}

class UserChangeDropCityState extends UserRegisterStates {
}
class ChangePassWordVisibilityState extends UserRegisterStates{}
//                     send email
class UserLoadingSendEmailState extends UserRegisterStates {}
class UserSuccessSendEmailState extends UserRegisterStates {
var value;
UserSuccessSendEmailState(this.value);
}
class UserErrorSendEmailState extends UserRegisterStates {
   var error;

  UserErrorSendEmailState(this.error);
}
//                     send email forget
class UserLoadingSendEmailForgetState extends UserRegisterStates {}
class UserSuccessSendEmailForgetState extends UserRegisterStates {
  var value;
  UserSuccessSendEmailForgetState(this.value);
}
class UserErrorSendEmailForgetState extends UserRegisterStates {
  var error;

  UserErrorSendEmailForgetState(this.error);
}
//                     check email
class UserLoadingCheckForgetState extends UserRegisterStates {}
class UserSuccessCheckForgetState extends UserRegisterStates {
  var value;
  UserSuccessCheckForgetState(this.value);
}
class UserErrorCheckForgetState extends UserRegisterStates {
  var error;

  UserErrorCheckForgetState(this.error);
}



//                     patch
class UserLoadingPatchForgetState extends UserRegisterStates {}
class UserSuccessPatchForgetState extends UserRegisterStates {
  var value;
  UserSuccessPatchForgetState(this.value);
}
class UserErrorPatchForgetState extends UserRegisterStates {
  var error;

  UserErrorPatchForgetState(this.error);
}
////////////////////////////////////////
class UserLoadingDataState extends UserRegisterStates {}
class UserSuccessDataState extends UserRegisterStates {
  final UserModel userModel;
  var value;
  UserSuccessDataState(this.value, this.userModel);
}
class UserErrorDataState extends UserRegisterStates {
  var error;

  UserErrorDataState(this.error);
}