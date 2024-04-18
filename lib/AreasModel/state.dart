import 'package:pharmacy/AreasModel/areas_model.dart';

abstract class PharmacyAreas {}

class PharmacyInitialState extends PharmacyAreas {}

class PharmacyLoadingState extends PharmacyAreas {}
class PharmacySuccessState extends PharmacyAreas {
  final AreasModel areasModel;
 var value;
  PharmacySuccessState(this.areasModel,this.value);

}
class PharmacyErrorState extends PharmacyAreas {
  var error;

  PharmacyErrorState(this.error);
}