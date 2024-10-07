import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/image_picker.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/technical_offers_repo.dart';

class TechnicalOffersCubit extends Cubit<TechnicalOffersState> {
  final TechnicalOffersRepo lightingRepo;
  TechnicalOffersCubit(this.lightingRepo) : super(LightingCalculationInitial());
  static TechnicalOffersCubit get(context) => BlocProvider.of(context);

  //* light load calculation controllers
  TextEditingController nameController = TextEditingController();

  //* inverter and batery controllers
  TextEditingController loadWHController = TextEditingController();

  //* add device to database
  void addLightingData({
    required String itemName,
    required String itemImage,
  }) async {
    final response = await lightingRepo.addLightingData(itemName, itemImage);
    response.when(success: (value) {
      getLightingData();
      emit(AddDatabaseStateSuccess());
    }, failure: (error) {
      emit(AddDatabaseStateError(error));
    });
  }

  //* this list has all electrecity devices which added by user
  List<Map<String, dynamic>> itemsList = [];
  //* get all device to database
  void getLightingData() async {
    itemsList = [];
    final response = await lightingRepo.getLightingData();
    response.when(success: (data) {
      itemsList = data;
      emit(GetDatabaseStateSuccess(data));
    }, failure: (error) {
      emit(GetDatabaseStateError(error));
    });
  }

  //* delete any electrecity device from database
  void deleteData({required int id}) {
    final response = lightingRepo.deleteLightingData(id);
    response.when(success: (value) {
      getLightingData();
    }, failure: (error) {
      emit(DeleteDatabaseStateError(error));
    });
  }

  //* this string will has the device image path which selected by user
  String? imagePath;
  Future<String> getImage() async {
    GetImageFromGallery getImageFromGallery = GetImageFromGallery();
    imagePath = await getImageFromGallery.getImage();
    return imagePath!;
  }

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
    result = wToPhDouble * ph;
    print("قدرة الانفرتر (Inverter Capacity) >>> $result KW");

    return result;
  }

  //* Calculation OV av
  double ovAv({required double input1DC, required double input2DC}) {
    /*
        * OV av
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
  int pvModulesInSeries({required double vmp, required double ovAv}) {
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
    return int.parse(result.toString());
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

    return int.parse(result.toString());
  }

  //* calculation Total number of panels Station (عدد الالواح الكلي)
  int totalNumberOfPanelsStation(int pvInSeries, int stringsNumber) {
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

    return int.parse(result.toString());
  }

  //* calculation Watt per one Series (ال وات للاسترينج الواحد)
  int wattPerOneSeries(
      {required int pvInSeries, required int wattSinglePanal}) {
    /*
      * Watt per one string (ال وات للاسترينج الواحد)
      (الوات للاسترينج الواحد) =  (عدد الالواح فى الاسترينج * وات اللوح) = result W
    */
    int result = 0;
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

  //* calculation Ampere per Series
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
    int result = 0;
    result = numberOfSeries;
    return result;
  }
















//* 1-  قدرة الانفرتر
    //* 2-  (ph * 746) / 1000 = result KW
    //* 3-  choose the number from inverter model excel sheet.
    // ------------------------ (OV av) ----------------------------- //
/*
      OV av
      - input 1 DC (From excel).
      - input 2 DC (From excel).
        OV av = (input 1DC + input 2DC) / 2 = result Vol
      */
// ----------------------- (PV Modules in series  عدد الالواح فى الاسترنج الواحد) ------------------------------ //
/*
        * PV Modules in series
        - VMP (panal excel sheet)
        - Ov av from previos step
        عدد الالواح فى الاسترنج = (Ov av / VMP ) = int result PV Modules in series
        
        */
// ----------------------- (CHECK) ------------------------------ //
/*
  - VOC للوح الواحد (panal excel sheet)
  check >> عدد الالواح فى الاسترنج  * VOC للوح الواحد == result 
  - if(result < 800) { print("continue")}
  - else  {
   print("choose another panal");
   and will start again.
  }
  */
// ----------------------- (عدد الاسترنجات  serias ) ------------------------------ //
/*
- IOC >> (inverter excel sheet ).
- IMP >> (Panal excel sheet ).
1- IOC : 
  if(IOC <= 25 ) {IOC - 2 }
  if(IOC > 25 ) {IOC - 5 }
2- عدد الاسترنجات = (IOC / IMB ) * 1.2 = int result serias
*/
// ----------------------- (عدد الالواح الكلي  Station ) ------------------------------ //
/*
- عدد الالواح فى الاسترنج الواحد >> result from (PV Modules in Station) 
- عدد الاسترنجات >> result from (عدد الاسترنجات  serias)
  عدد الالواح الكلي  = عدد الاسترنجات * عدد الالواح فى الاسترنج الواحد
*/
// ----------------------- (الوات الكلي للمحطة) ------------------------------ //
/*
- وات اللوح الواحد >> تم اختياره حسب نوع اللوح الى اختاره اليوزر فى الاول خالص
-عدد الالواح الكلي >> result from serias
  (الوات الكلي للمحطة) = (عدد الالواح الكلي * وات اللوح الواحد) / 1000 = result KW
 */
// ----------------------- (الوات للاسترينج الواحد) ------------------------------ //
/*
(الوات للاسترينج الواحد) =  (عدد الالواح فى الاسترينج * وات اللوح) = result W
*/
// ----------------------- (الامبير الكلي) ------------------------------ //
/*
-عدد الاسترنجات  >> result from  عدد الاسترنجات 
- IMP >> (panal excel sheet)
  (الامبير الكلي) = عدد الاسترنجات * IMP = result A
*/
// ----------------------- (الامبير للاسترينج الواحد) ------------------------------ //
/*
-عدد الاسترنجات  >> result from  عدد الاسترنجات 
- (الامبير الكلي) >> result from  (الامبير الكلي)
(الامبير للاسترينج الواحد) = (الامبير الكلي) / عدد الاسترنجات  = result A
*/
// ----------------------- (الفولت الكلى) ------------------------------ //
/*
- VOC >> (panal excel sheet)
- (عدد الالواح فى الاسترنج الواحد) >> result from (عدد الالواح فى الاسترنج الواحد) PV Modules in serias
(الفولت الكلى) = (عدد الالواح فى الاسترنج الواحد) * VOC = result V
 */
// ----------------------- (الفولت للاسترينج الواحد) ------------------------------ //
/*
(الفولت للاسترينج الواحد) = (الفولت الكلى) 
*/
// ----------------------- (MC4 numbers) ------------------------------ //
/*
  - عدد الاسترنجات >> from result (عدد الاسترنجات  serias )
  (MC4 numbers) = عدد الاسترنجات
*/
// ----------------------- (PV fuse + fuse holder) ------------------------------ //
/*
  (PV fuse + fuse holder) = عدد الاسترنجات * 2 
*/


  
}
