import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/image_picker.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/repo/lighting_load_calculation_repo.dart';

class LightingCalculationCubit extends Cubit<LightingCalculationState> {
  final LightingRepo lightingRepo;
  LightingCalculationCubit(this.lightingRepo)
      : super(LightingCalculationInitial());
  static LightingCalculationCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();

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

  List<Map<String, dynamic>> itemsList = [];
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

  void deleteData({required int id}) {
    final response = lightingRepo.deleteLightingData(id);
    response.when(success: (value) {
      getLightingData();
    }, failure: (error) {
      emit(DeleteDatabaseStateError(error));
    });
  }

  String? imagePath;
  Future<String> getImage() async {
    GetImageFromGallery getImageFromGallery = GetImageFromGallery();
    imagePath = await getImageFromGallery.getImage();
    return imagePath!;
  }
}
