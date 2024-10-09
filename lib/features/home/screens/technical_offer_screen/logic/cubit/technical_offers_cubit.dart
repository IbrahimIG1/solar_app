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

  //* Firebase Functions


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
