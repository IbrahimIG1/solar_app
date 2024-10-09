import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/models/inverter_model/inverter_data_model.dart';
import 'package:solar/core/models/panal_model/panal_data_model.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/firebase_repo.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_state.dart';

class InverterAndBatteryCubit extends Cubit<InverterAndBatteryState> {
  final FirebaseRepo firebaseRepo;
  InverterAndBatteryCubit(this.firebaseRepo)
      : super(InverterAndBatteryInitial());
  static InverterAndBatteryCubit get(context) => BlocProvider.of(context);

  //* Controllers
  TextEditingController pmaxController = TextEditingController();
  //* inverter and batery controllers
  TextEditingController loadWHController = TextEditingController();
  TextEditingController sccfController = TextEditingController();
  TextEditingController vnipController = TextEditingController();
  TextEditingController vocController = TextEditingController();
  TextEditingController impController = TextEditingController();
  String panalTypeDropdownValue = "";
  String inverterTypeDropdownValue = "";

  List<String> inverterTypeList = [
    "Veichi",
    "Huawai",
    "Yaskawa",
    "Invt",
    "Delixi",
  ];
  List<String> panalTypeList = [
    "Jinko",
    "Trina",
    "Longi",
    "JA",
    "Canadian",
    "Suntech",
    "Ameri",
    "Risen",
    "Twinsel",
    "YinGli",
    "Solar Fabrik",
    "Lesso",
  ];
  //* Lists to save all values on the same panal type
  // List pmax = [];
  // List isc = [];
  // List vmp = [];
  // List voc = [];
  // List imp = [];
  //* this list hase all data about specific panal from firebase
  List<PanalDataModel> panals = [];
  List<InverterDataModel> inverters = [];
  //* Lists to save all values on the same panal type
  // List modelInverter = [];
  // List input1DC = [];
  // List input2DC = [];
  // List maxInputDC = [];
  // List ratedOutputCurrent = [];

  void changeRadioButtonValue(String value) {
    panalTypeDropdownValue = "";
    emit(ChangeRadioButtonsSuccess());
  }

  //* Get Data From Firebase and save it in [invertes] list
  Future<void> getPanalsData(
      {required String collection,
      required String collectionName,
      required String docUid}) async {
    if (!panals.isNullOrEmpty()) {
      panals = [];
    }

    print("GetPanalData Start");
    emit(GetPanalDataLoading());
    final response = await firebaseRepo.getAllpanals(
        collection: collection, collectionName: collectionName, docUid: docUid);
    response.when(success: (data) {
      print("GetPanalDataSuccess $data");
      for (var doc in data.docs) {
        print("Docs data is >>>>>> ${doc.data()}");
        panals.add(PanalDataModel.fromMap(doc.data()));
      }
      print("panals is >>>>>>> ${panals[0].pmax}");
      // getPanalsSpecificData();

      emit(GetPanalDataSuccess());
    }, failure: (error) {
      print("GetPanalDataError >> $error");
      emit(GetPanalDataError(error));
    });
  }

  //* Get Data From Firebase and save it in [invertes] list
  Future<void> getInvertersData(
      {required String collection,
      required String collectionName,
      required String docUid}) async {
    if (!inverters.isNullOrEmpty()) {
      inverters = [];
    }
    print("GetPanalData Start");
    emit(GetInvertersDataLoading());
    final response = await firebaseRepo.getAllpanals(
        collection: collection, collectionName: collectionName, docUid: docUid);
    response.when(success: (data) {
      print("GetPanalDataSuccess $data");
      for (var doc in data.docs) {
        print("Docs data is >>>>>> ${doc.data()}");
        inverters.add(InverterDataModel.fromMap(doc.data()));
      }
      print("panals is >>>>>>> ${inverters[0].maxInputDC}");
      // getInverterSpecificData();
      emit(GetInvertersDataSuccess());
    }, failure: (error) {
      print("GetInvertersDataError >> $error");
      emit(GetInvertersDataError(error));
    });
  }

  //* get Data From [inverters] list and save every tyle value in specific list.
  // void getInverterSpecificData() {
  //   for (int i = 0; i < panals.length; i++) {
  //     maxInputDC = inverters[i].maxInputDC;
  //     input1DC = inverters[i].input1DC;
  //     input2DC = inverters[i].input2DC;
  //     modelInverter = inverters[i].modelInverter;
  //     ratedOutputCurrent = inverters[i].ratedOutputCurrent;
  //     print(
  //         "pmax is >>> $pmax /n imp is >>> $imp /n imp is >>> $vmp/n imp is >>> $isc/n imp is >>> $voc");
  //   }
  // }

  //* get Data From [panals] list and save every tyle value in specific list.
  // void getPanalsSpecificData() {
  //   for (int i = 0; i < panals.length; i++) {
  //     pmax = panals[i].pmax;
  //     imp = panals[i].imp;
  //     isc = panals[i].isc;
  //     vmp = panals[i].vmp;
  //     voc = panals[i].voc;
  //     print(
  //         "pmax is >>> $pmax /n imp is >>> $imp /n imp is >>> $vmp/n imp is >>> $isc/n imp is >>> $voc");
  //   }
  // }

  //* reset all controllers after add done
  void resetCotrollersData() {
    pmaxController.text = "";
    sccfController.text = "";
    vnipController.text = "";
    vocController.text = "";
    impController.text = "";
  }

  //* reset all lists after add done
  // void resetPanalsListsData() {
  //   panals = [];
  //   pmax = [];
  //   isc = [];
  //   vmp = [];
  //   voc = [];
  //   imp = [];
  // }

  //* reset all lists after add done
  // void resetInertersListsData() {
  //   modelInverter = [];
  //   input1DC = [];
  //   input2DC = [];
  //   maxInputDC = [];
  //   ratedOutputCurrent = [];
  // }

  //* >>>>>>>>>>>>>> MATHMATICAL OPERATIONS <<<<<<<<<<<<<<<<<<

  //* Calculation inverterCapacity (قدرة الانفرتر )
  double inverterCapacity({required double ph}) {
    /*
        * قدرة الانفرتر (Inverter Capacity)
        - ph >> (Inverter excel sheet)
        (Inverter Capacity) = (ph * 746) / 1000 = result (KW)
    */
    double result = 0;
    const int wToPh = 746;
    // convert wToPh from in to double to can use it in operation
    double wToPhDouble = double.parse(wToPh.toString());
    result = (wToPhDouble * ph) / 1000;
    print("قدرة الانفرتر (Inverter Capacity) >>> $result KW");

    return result;
  }

  //* Calculation OV av (متوسط جهد الانفرتر)
  double ovAv({required double input1DC, required double input2DC}) {
    /*
        * OV av (متوسط جهد الانفرتر)
        - input 1 DC >> (Inverter excel sheet)
        - input 2 DC >> (Inverter excel sheet)
        (OV av) = (input 1 DC + input 2 DC) / 2 = result (V)
    */
    double result = 0;
    result = (input1DC + input2DC) / 2;
    print("Calculation OV av >>> $result V");

    return result;
  }

  //* Calculation pv Modules In Series Numbers (عدد الالواح فى الاسترنج الواحد)
  double pvModulesInSeries({required double vmp, required double ovAv}) {
    /*
        * PV Modules in Series (عدد الالواح فى الاسترنج الواحد)
        - vmp >> (panal excel sheet)
        - OV av >> Result From (ovAv) func
        PV Modules in Series = (ovAv / vmp) = result (PV Modules in series)
    */
    double result = 0;
    result = ovAv / vmp;
    print(
        "PV Modules in Series (عدد الالواح فى الاسترنج الواحد) >>> $result (PV Modules in series)");

    // convert wToPh from in to double to can use it in operation
    return result;
  }

  //* check On Series Numbers if less than 790 >> true
  bool checkOnSeriasNumbees(
      {required double voc, required double seriasNumbees}) {
    /*
        * check On Series Numbers
        - voc >> (panal excel sheet)
        - seriasNumbees >> result from (pvModulesInSeries) function
        operation = voc * seriasNumbees (if <= 790 true)
    */
    double result = 0;
    result = voc * seriasNumbees;
    if (result <= 790) {
      print("check On Series Numbers >>> $result continue");

      return true;
    } else {
      print("check On Series Numbers >>> $result not continue");

      return false;
    }
  }

  //* Calculation Series Numbers (عدد الاسترنجات)
  int numberOfSeries({required double ioc, required double imp}) {
    /*
        * Series Number (عدد الاسترنجات)
        - IOC >> (inverter excel sheet ).
        - IMP >> (Panal excel sheet ).
          1- IOC : 
            if(IOC <= 25 ) {IOC - 2 }
            if(IOC > 25 ) {IOC - 5 }
          2- عدد الاسترنجات = (IOC / IMB ) * 1.2 = int result series
    */
    double result = 0;
    //* check on IOC value witch get from Inverter excel sheet
    if (ioc <= 25) {
      ioc = ioc - 2;
    } else if (ioc > 25) {
      ioc = ioc - 5;
    }
    result = (ioc / imp) * 1.2;
    print(
        "check on IOC value witch get from Inverter excel sheet >>> $result series");
    print("IOC In CHECK func IS>>> $ioc");

    return result.ceil();
  }

  //* calculation Total number of panels Station (عدد الالواح الكلي)
  int totalNumberOfPanelsStation(
      {required int pvInSeries, required int stringsNumber}) {
    /*
    * Total number of panels Station (عدد الالواح الكلي)
      - عدد الالواح فى الاسترنج الواحد >> result from (pvModulesInSeries) 
      - عدد الاسترنجات >> result from (numberOfSeries)
      - عدد الالواح الكلي  = عدد الاسترنجات * عدد الالواح فى الاسترنج الواحد
      totalNumberOfPanelsStation = pvModulesInSeries * numberOfSeries
    */
    int result = 0;
    result = stringsNumber * pvInSeries;
    print(
        "calculation Total number of panels Station (عدد الالواح الكلي) >>> $result");

    return result;
  }

  //* calculation Total watts of the station (ال وات الكلي للمحطة)
  int totalWattsOfTheStation(
      {required int totalPanelsStationNumber, required int wattSinglePanal}) {
    /*
        * Total watts of the station (ال وات الكلي للمحطة)
          - وات اللوح الواحد >> تم اختياره حسب نوع اللوح الى اختاره اليوزر فى الاول خالص (wattSinglePanal)
          -عدد الالواح الكلي >> result from (totalNumberOfPanelsStation)
          (الوات الكلي للمحطة) = (عدد الالواح الكلي * وات اللوح الواحد) / 1000 = result KW
        */

    double result = 0;
    result = (totalPanelsStationNumber * wattSinglePanal) / 1000;
    print(
        "calculation Total watts of the station (ال وات الكلي للمحطة) >>> $result KW");

    return result.ceil();
  }

  //* calculation Watt per one Series (ال وات للاسترينج الواحد)
  double wattPerOneSeries(
      {required double pvInSeries, required double wattSinglePanal}) {
    /*
      * Watt per one string (ال وات للاسترينج الواحد)
      - عدد الالواح فى الاسترينج = pvInSeries from (pvModulesInSeries)
      (الوات للاسترينج الواحد) =  (عدد الالواح فى الاسترينج * وات اللوح) = result W
    */
    double result = 0;
    result = pvInSeries * wattSinglePanal;
    print(
        "calculation Watt per one string (ال وات للاسترينج الواحد) $result W");
    return result;
  }

  //* calculation Total Ampere (الامبير الكلي)
  double totalAmpere({required int numberOfSeries, required double imp}) {
    double result = 0;
    /*
      * Total Ampere (الامبير الكلي)
      -عدد الاسترنجات  >> result from  (numberOfSeries)
      - IMP >> (panal excel sheet)
        (الامبير الكلي) = عدد الاسترنجات * IMP = result A
    */
    result = imp * numberOfSeries;
    print("calculation Total Ampere (الامبير الكلي) >>> $result A");
    return result;
  }

  //* calculation Ampere per Series (الامبير للاسترينج الواحد)
  double amperePerSeries(
      {required int seriesNumbers, required double totalAmpere}) {
    /*
      * Ampere per string (الامبير للاسترينج الواحد)
      - عدد الاسترنجات  >> result from  (numberOfSeries)
      - (الامبير الكلي) >> result from  (totalAmpere)
      (الامبير للاسترينج الواحد) = (الامبير الكلي) / عدد الاسترنجات  = result A
    */
    double result = 0;
    result = seriesNumbers / totalAmpere;
    print("calculation Ampere per string >>> $result A");

    return result;
  }

  //* calculation Total Voltage(الفولت الكلى)
  double totalVoltage({required int pvInSeries, required double voc}) {
    /*
      * Total Voltage(الفولت الكلى)
      - VOC >> (panal excel sheet)
      - (عدد الالواح فى الاسترنج الواحد) >> result from (pvModulesInSeries)
      (الفولت الكلى) = (عدد الالواح فى الاسترنج الواحد) * VOC = result V
    */
    double result = 0;
    result = pvInSeries * voc;
    print("calculation Total Voltage(الفولت الكلى) >>> $result V");

    return result;
  }

  //* calculation Volt Per Series (الفولت للاسترينج الواحد)
  double voltPerString({required double totalVoltage}) {
    /*
      * Volt Per Series (الفولت للاسترينج الواحد)
      -(الفولت للاسترينج الواحد) >> from (totalVoltage)
      (الفولت للاسترينج الواحد) = (الفولت الكلى) 
    */
    double result = 0;
    result = totalVoltage;
    print(
        "calculation Volt Per Series (الفولت للاسترينج الواحد) >>> $result V");

    return result;
  }

  //* calculation MC4 numbers
  int mC4Numbers({required int numberOfSeries}) {
    /*
      * MC4 numbers
      - عدد الاسترنجات >> from result (numberOfSeries)
      (MC4 numbers) = عدد الاسترنجات
    */
    int result = 0;
    result = numberOfSeries;
    print("calculation MC4 numbers >>> $result");

    return result;
  }

  //* calculation PV fuse + fuse holder
  int pvFuseAndFuseHolder({required int numberOfSeries}) {
    /*

    - (PV fuse + fuse holder) = عدد الاسترنجات * 2 
    */
    int result = 0;
    result = numberOfSeries * 2;
    print("calculation fuse + fuse holder numbers >>> $result");

    return result;
  }

  void allCalculation() {
    inverterCapacity(ph: 50);
    double ovA = ovAv(input1DC: 350, input2DC: 780);
    double pvModule = pvModulesInSeries(vmp: 41.32, ovAv: ovA);

    checkOnSeriasNumbees(voc: 49.92, seriasNumbees: pvModule);
    int numberOfStrings = numberOfSeries(ioc: (75 - 5), imp: 13.19);

    int totalNumberofPanal = totalNumberOfPanelsStation(
        pvInSeries: pvModule.ceil(),
        stringsNumber: numberOfSeries(ioc: (75 - 5), imp: 13.19));
    totalWattsOfTheStation(
        totalPanelsStationNumber: totalNumberofPanal, wattSinglePanal: 545);

    wattPerOneSeries(pvInSeries: pvModule, wattSinglePanal: 49.92);
    double tAmbir = totalAmpere(numberOfSeries: numberOfStrings, imp: 13.19);

    amperePerSeries(seriesNumbers: numberOfStrings, totalAmpere: tAmbir);
    double tVolt = totalVoltage(pvInSeries: pvModule.ceil(), voc: 49.92);
    voltPerString(totalVoltage: tVolt);
    mC4Numbers(numberOfSeries: numberOfStrings);
    pvFuseAndFuseHolder(numberOfSeries: numberOfStrings);
  }
}
