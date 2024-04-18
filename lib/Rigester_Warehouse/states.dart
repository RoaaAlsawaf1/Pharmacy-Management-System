//warehouse
abstract class WarehouseRegisterStates {}

class WarehouseInitialState extends WarehouseRegisterStates {}

class WarehouseLoadingState extends WarehouseRegisterStates {}
class WarehouseSuccessState extends WarehouseRegisterStates {
  var value;
  WarehouseSuccessState(this.value);
}
class WarehouseErrorState extends WarehouseRegisterStates {
  var error;

  WarehouseErrorState(this.error);
}
class WarehouseChangeDropGenderState extends WarehouseRegisterStates {
}

class WarehouseChangeDropCityState extends WarehouseRegisterStates {
}
class ChangePassWordVisibilityState extends WarehouseRegisterStates{}