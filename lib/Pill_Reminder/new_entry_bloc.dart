import 'package:pharmacy/Pill_Reminder/Medicine_type.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

class NewEnterBloc{
  BehaviorSubject<MedicineType>?_selectMedicineType;//اسماء لانواع
  ValueStream<MedicineType>?get selectedMedicineType=>_selectMedicineType!.stream;

  BehaviorSubject<int>?_selectInterValue;// من شان لارقام تبعالتكرر
  BehaviorSubject<int>?get selectInterval=>_selectInterValue;

  BehaviorSubject<String>?_selectedTimeOfDay;
  BehaviorSubject<String>?get selectedTimeOfDay=>_selectedTimeOfDay;


  //errorState
  BehaviorSubject<EntryError>?_errorState;
  BehaviorSubject<EntryError>?get errorState=>_errorState;
NewEnterBloc(){
  _selectMedicineType=BehaviorSubject<MedicineType>.seeded(MedicineType.none);
  _selectedTimeOfDay=BehaviorSubject<String>.seeded("none");
  _selectInterValue=BehaviorSubject<int>.seeded(0);
  _errorState=BehaviorSubject<EntryError>();
}
void dispose(){
  _selectMedicineType!.close();
  _selectedTimeOfDay!.close();
  _selectInterValue!.close();
}
void submitError(EntryError error){
  _errorState!.add(error);
}
void updateInterval(int interval){
  _selectInterValue!.add(interval);
}
  void updateTime(String time){
    _selectedTimeOfDay!.add(time);
  }
  void updateSelectedMedicine(MedicineType type){
  MedicineType _tempType=_selectMedicineType!.value;
  if(type==_tempType){
    _selectMedicineType!.add(MedicineType.none);

  }
  else{
    _selectMedicineType!.add(type);
  }
  }
}