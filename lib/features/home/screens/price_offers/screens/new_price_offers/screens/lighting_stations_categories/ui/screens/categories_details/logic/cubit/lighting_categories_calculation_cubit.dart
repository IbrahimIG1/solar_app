import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';

class LightingCategoriesCalculationCubit
    extends Cubit<LightingCategoriesCalculationState> {
  LightingCategoriesCalculationCubit()
      : super(LightingCategoriesCalculationInitial());

  static LightingCategoriesCalculationCubit get(context) =>
      BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  bool isDone = false;
  List<Map<String, dynamic>> data = [
    {
      'first_name': 'Panel Type',
      'second_name': "panel watt",
      'thired_name': "Number of panels",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات اللوح",
      'thired_choose': "عدد الالواح",
      'icon': 'assets/images/categories_icons/sun_electric.png',
      'width': 130.w,
      'height': 92.28.h,
      'is_done': false,
    },
    {
      'first_name': 'Inverter Type',
      'second_name': "Inverter capacity",
      'thired_name': "Inverter price",
      'forth_name': "panal Type",
      'first_choose': "الشاسيه",
      'second_choose': "معدن الشاسيه",
      'thired_choose': "سعر الانفرتر",
      'icon': 'assets/images/categories_icons/power_generator.png',
      'width': 96.w,
      'height': 112.h,
      'is_done': false,
    },
    {
      'first_name': 'Chassis type',
      'second_name': "Type of chassis metal",
      'thired_name': "Chassis price",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات",
      'thired_choose': "سعر الشاسية",
      'icon': 'assets/images/categories_icons/sun_battery.png',
      'width': 110.w,
      'height': 92.48.h,
      'is_done': false,
    },
    {
      'first_name': 'Panel Type',
      'second_name': "panel watt",
      'thired_name': "Number of panels",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات اللوح",
      'thired_choose': "عدد الالواح",
      'icon': 'assets/images/categories_icons/stand_sun.png',
      'width': 130.w,
      'height': 106.41.h,
      'is_done': false,
    },
    {
      'first_name': 'Panel Type',
      'second_name': "panel watt",
      'thired_name': "Number of panels",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات اللوح",
      'thired_choose': "عدد الالواح",
      'icon': 'assets/images/categories_icons/sun_system.png',
      'width': 120.w,
      'height': 115.12.h,
      'is_done': false,
    },
    {
      'first_name': 'Panel Type',
      'second_name': "panel watt",
      'thired_name': "Number of panels",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات اللوح",
      'thired_choose': "عدد الالواح",
      'icon': 'assets/images/categories_icons/car_electric.png',
      'width': 144.22.w,
      'height': 140.22.h,
      'is_done': false,
    },
    // {
    //   'first_name': 'Panel Type',
    //   'second_name': "panel watt",
    //   'thired_name': "Number of panels",
    //   'forth_name': "panal Type",
    //   'first_choose': "اللوح",
    //   'second_choose': "وات",
    //   'thired_choose': "عدد الالواح",
    //   'icon': 'assets/images/categories_icons/settings.png',
    //   'width': 100.w,
    //   'height': 100.h,
    // },
    {
      'first_name': 'Panel Type',
      'second_name': "panel watt",
      'thired_name': "Number of panels",
      'forth_name': "panal Type",
      'first_choose': "اللوح",
      'second_choose': "وات",
      'thired_choose': "عدد الالواح",
      'icon': 'assets/images/categories_icons/profile.png',
      'width': 95.22.w,
      'height': 100.h,
      'is_done': false,
    },
  ];

  bool savePdf() {
    print("before save in cubit  $isDone");

    isDone = true;
    emit(IsDoneLightingCategories(isDone));
    
    return isDone;

  }
}
