import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:pharmacy/Pill_Reminder/Medicine.dart';
import 'package:pharmacy/Pill_Reminder/Medicine_type.dart';
import 'package:pharmacy/Pill_Reminder/pill_reminder.dart';
import 'package:pharmacy/Pill_Reminder/Success_Screen.dart';
import 'package:pharmacy/Pill_Reminder/global_bloc.dart';
import 'package:pharmacy/Pill_Reminder/new_entry_bloc.dart';
import 'package:pharmacy/shared/components/components.dart';
import 'package:pharmacy/shared/components/constant.dart';

class NewEntry extends StatefulWidget {
  NewEntry({Key? key}) : super(key: key);

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  var medicineController = TextEditingController();
  var dosageController = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  late GlobalKey<ScaffoldState> _scaffoldKey;
  late NewEnterBloc _newEnterBloc;



  @override
  void dispose() {
    super.dispose();
    medicineController.dispose();
    dosageController.dispose();
    _newEnterBloc.dispose();
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();

    super.initState();
    medicineController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    _newEnterBloc = NewEnterBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
        key: _scaffoldKey,
//         appBar: AppBar(
//           toolbarHeight: 80,
//           titleSpacing: 0.0,
//           leadingWidth: 70,
//           elevation: 0.0,
//           flexibleSpace: Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 end: Alignment.bottomLeft,
//                 colors: [
//                   HexColor('A8BEE7'),
//                   HexColor('AEC9DE'), //gray light
// //gray dark
//                   HexColor('BBC5CE'),
//                 ],
//                 tileMode: TileMode.clamp,
//               ),
//             ),
//           ),
//           title:  Text("73".tr, style: TextStyle(color: Colors.black87)),
//           leading: IconButton(
//               onPressed: () {
//                 navigateAndFinish(
//                     context: context, widget: const PillReminder());
//               },
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.black87,
//                 size: 14,
//               )),
//         ),
        extendBodyBehindAppBar: true,
        appBar:   AppBar(
          toolbarHeight: 80,
          titleSpacing: 0.0,
          leadingWidth: 70,
          elevation: 0.0,

          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Container(color: Colors.transparent,),
            ),
          ),

          backgroundColor:Colors.white.withAlpha(100) ,

          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child:  Text("73".tr,
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16, color: Colors.grey.shade800,
                )),
          ),
          leading:Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {
              navigateAndFinish(
                    context: context, widget: const PillReminder());

              }, icon: Icon(Icons.arrow_back_ios_new_outlined,color:HexColor(green),)),
          ),

        ),
        body: Provider<NewEnterBloc>.value(
          value: _newEnterBloc,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    HexColor('A8BEE7'),
                    HexColor('AEC9DE'), //gray light
//gray dark
                    HexColor('BBC5CE'),
                    HexColor('BDB9C7'), //
                    HexColor('D3C8CC'),
                    HexColor('D3CACF'),
                    HexColor('DBD9DE'),
                    HexColor('D7D2D8'),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),

                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, left: 16, top: 140),
                  child: Container(
                    height: 1500,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration
                            (borderRadius:
                          BorderRadius.all(Radius.circular(35)),

                              color: Colors.white.withOpacity(0.3)

                          ),
                          child: defaultTextFieldPharmacy(
                              controller: medicineController,
                              type: TextInputType.name,
                              hint: "74".tr,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "75".tr;
                                } else {
                                  return null;
                                }
                              },
                              prefix: Icons.local_pharmacy_outlined),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration
                            (borderRadius:
                          BorderRadius.all(Radius.circular(35)),

                              color: Colors.white.withOpacity(0.3)

                          ),
                          child: defaultTextFieldPharmacy(
                              controller: dosageController,
                              type: TextInputType.number,
                              hint: "76".tr,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return "77".tr;
                                } else {

                                  return null;
                                }
                              },
                              prefix: Icons.numbers),
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                         Text(
                          "78".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        StreamBuilder<MedicineType>(
                          stream: _newEnterBloc.selectedMedicineType,
                          builder: (context, snapshot) {
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),

                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MedicineTypeItem(
                                      text: "79".tr,
                                      image: "images/pills.png",
                                      medicineType: MedicineType.pill,
                                      isSelected:
                                          snapshot.data == MedicineType.pill
                                              ? true
                                              : false),
                                  MedicineTypeItem(
                                      text: "80".tr,
                                      image: "images/capsules.png",
                                      medicineType: MedicineType.bottle,
                                      isSelected:
                                          snapshot.data == MedicineType.bottle
                                              ? true
                                              : false),
                                  MedicineTypeItem(
                                      text: "81".tr,
                                      image: "images/tablets.png",
                                      medicineType: MedicineType.tablet,
                                      isSelected:
                                          snapshot.data == MedicineType.tablet
                                              ? true
                                              : false),
                                  MedicineTypeItem(
                                      text: "82".tr, //vaccine
                                      image: "images/vaccine.png",
                                      medicineType: MedicineType.syringe,
                                      isSelected:
                                          snapshot.data == MedicineType.syringe
                                              ? true
                                              : false),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        IntervalSelection(),
                        const SizedBox(
                          height: 32,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SelectTime(),

                        const SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: SizedBox(
                              width: 300,
                              child: Container(
                                height: 50,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      HexColor('56949a'),
                                      HexColor('3e8489'),
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    String? medicineName;
                                    int? dosage;
                                    //  name
                                    if (medicineController.text == "") {
                                      _newEnterBloc
                                          .submitError(EntryError.nameNull);
                                      print("medicennameempty");
                                    }
                                    if (medicineController.text != "") {
                                      medicineName = medicineController.text;
                                      print("medicennamenoempty");
                                    }
                                    //dosage
                                    if (dosageController.text == "") {
                                      dosage = 0;

                                      print("dosagenull");
                                    }
                                    if (dosageController.text != "") {
                                      dosage = int.parse(dosageController.text);
                                      print("dosage empty");
                                    }
                                    for (var medicine
                                        in globalBloc.medicineList!.value) {
                                      if (medicineName == medicine.medicineName) {
                                        _newEnterBloc.submitError(
                                            EntryError.nameDuplicate);
                                        print("medicennamedupicate");
                                        return;
                                      }
                                    }
                                    if (_newEnterBloc.selectInterval!.value ==
                                        0) {
                                      _newEnterBloc
                                          .submitError(EntryError.interVal);
                                      print("selectInterval==0");
                                      return;
                                    }
                                    if (_newEnterBloc.selectedTimeOfDay!.value ==
                                        'none') {
                                      _newEnterBloc
                                          .submitError(EntryError.startTime);
                                      print("selectedTimeOfDay==0");

                                      return;
                                    }
                                    String medicineType = _newEnterBloc
                                        .selectedMedicineType!.value
                                        .toString()
                                        .substring(13);

                                    int interval =
                                        _newEnterBloc.selectInterval!.value;
                                    String startTime =
                                        _newEnterBloc.selectedTimeOfDay!.value;
                                    List<int> intIDs = makeIDs(
                                        24 / _newEnterBloc.selectInterval!.value);
                                    // to continue
                                    List<String> notificationIDs =
                                        intIDs.map((i) => i.toString()).toList();
                                    Medicine newEntryMedicine = Medicine(
                                      notificationIDs: notificationIDs,
                                      medicineName: medicineName,
                                      dosage: dosage,
                                      medicineType: medicineType,
                                      interval: interval,
                                      startTime: startTime,
                                    );
                                    print("continue");
                                    // update medicine list via global bloc
                                    globalBloc
                                        .updateMedicineList(newEntryMedicine);
                                    print("updateMedicineList");
                                    print(startTime.toString());
                                    // schedule notification
                                   scheduleNotification(newEntryMedicine);
                                    //go to success screen
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SuccessScreen(),
                                        ));
                                  },
                                  child:  Text(
                                    "83".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }

  void initializeErrorListen() {
    _newEnterBloc.errorState!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("84".tr);
          break;
        case EntryError.nameDuplicate:
          displayError("85".tr);
          break;
        case EntryError.dosage:
          displayError("86".tr);
          break;
        case EntryError.interVal:
          displayError("87".tr);
          break;
        case EntryError.startTime:
          displayError("88".tr);
          break;
        default:
        //show snackBar
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(color: HexColor(green.toString())),
      ),
      backgroundColor: HexColor("E6E3E8"),
      duration: const Duration(milliseconds: 2000),
    ));
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }




  initializeNotifications() async {
    print("rrr");
    print("initializeNotifications");
    var initializeNotificationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializeNotificationSettingsIDs =
        const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializeNotificationSettingsAndroid,
      iOS: initializeNotificationSettingsIDs,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload :$payload');
    }
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PillReminder(),
        ));
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    print("notification");
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id', 'repeatDailyAtTime channel name',
        importance: Importance.max,
        ledColor: Colors.white.withOpacity(0.8),
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true);
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {

      if (hour + (medicine.interval! * i) > 23) {
        hour = hour + (medicine.interval! * i) - 24;
        print("hour $hour");
      }else{
        hour = hour + (medicine.interval! * i) ;
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(

          int.parse(medicine.notificationIDs![i]),

       '${"89".tr}${medicine.medicineName}',
          medicine.medicineType.toString()!=MedicineType.none.toString()
              ?'${"90".tr} ${medicine.medicineType!.toLowerCase()}'',${"91".tr}': "92".tr,
          Time(hour,minute,0),
          platformChannelSpecifics);
      print("show notification");
      hour=ogValue;
    }
  }




}
class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 00);
  bool clicked = false;

  Future<TimeOfDay> _selectTime() async {
    final NewEnterBloc newEnterBloc=Provider.of<NewEnterBloc>(context,listen: false);
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _timeOfDay);

    if (picked != null && picked != _timeOfDay) {
      setState(() {
        _timeOfDay = picked;
        clicked = true;
        newEnterBloc.updateTime(convertTime(_timeOfDay.hour.toString())+convertTime(_timeOfDay.minute.toString()));
      });
    }
    return picked!;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text("93".tr,
            style: TextStyle(fontSize: 18)),
        Text(
            clicked == false
                ? "00:00"
                : "${convertTime(_timeOfDay.hour.toString())}:${convertTime(_timeOfDay.minute.toString())}",
            style: const TextStyle(fontSize: 18)),
             InkWell(
    onTap: () {
    _selectTime();
    },
    child: Image.asset(
    'images/clock.png',
    fit: BoxFit.cover,
    height: 50,
    width: 50,
    )),

      ],
    );

  }
}

class MedicineTypeItem extends StatelessWidget {
  MedicineTypeItem(
      {Key? key,
      required this.text,
      required this.image,
      required this.medicineType,
      required this.isSelected})
      : super(key: key);
  final String text;
  final String image;
  GestureTapCallback? onTap;
  final MedicineType medicineType;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final NewEnterBloc newEnterBloc = Provider.of<NewEnterBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          newEnterBloc
              .updateSelectedMedicine(medicineType); //عند الضغطة بيتغير السليكت
        },
        child: Stack(alignment: AlignmentDirectional.topEnd, children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              color: isSelected
                  ? HexColor("E6E3E8")
                  : Colors.white.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                text,
                style: TextStyle(
                  color: HexColor("11110F"),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 3, top: 46),
            child: Image(
              image: AssetImage(image),
              width: 65,
              height: 65,
            ),
          ),
        ]),
      ),
    );
  }
}

class IntervalSelection extends StatefulWidget {
  IntervalSelection({Key? key}) : super(key: key);

  @override
  State<IntervalSelection> createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  final _intervals = [2,6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    final NewEnterBloc newEnterBloc = Provider.of<NewEnterBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          "94".tr,
          style: TextStyle(fontSize: 18),
        ),
        DropdownButton(
            iconEnabledColor: HexColor(green.toString()),
            dropdownColor: HexColor("E6E3E8"),
            value: _selected == 0 ? null : _selected,
            hint: _selected == 0
                ? Text(
              "95".tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: HexColor(green.toString()),
                    ),
                  )
                : null,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString(),
                      style: TextStyle(
                          fontSize: 14, color: HexColor(green.toString()))));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selected = newValue!;
                newEnterBloc.updateInterval(newValue);
              });
            }),
        Text(
          _selected == 1 ? "96".tr : "97".tr,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}

