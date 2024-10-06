import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/image_picker.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/technical_offers_repo.dart';

class TechnicalOffersCubit extends Cubit<TechnicalOffersState> {
  final TechnicalOffersRepo lightingRepo;
  TechnicalOffersCubit(this.lightingRepo) : super(LightingCalculationInitial());
  static TechnicalOffersCubit get(context) => BlocProvider.of(context);
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

  double calculation({required double capacity,required double wh}) {
    double result = 0;
    result = (capacity + wh) * 10;
    return result;
  }
}
