import 'package:get_it/get_it.dart';
import 'package:solar/core/database/database_factory.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/repo/customer_repo.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/repo/lighting_load_calculation_repo.dart';

import '../../features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/repo/lighting_categories_calculation_repo.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final DbFactory dbFactory = DbFactory();
  await dbFactory.createDatabase();

//* services
  getIt.registerLazySingleton<DbServices>(() => DbServices(dbFactory));

  //* repos
  getIt.registerLazySingleton<LightingRepo>(() => LightingRepo(getIt()));
  getIt.registerLazySingleton<CustomerRepo>(() => CustomerRepo(getIt()));
  getIt.registerLazySingleton<LightingCategoriesCalculationRepo>(() => LightingCategoriesCalculationRepo(getIt()));

  //* cubits
  getIt.registerFactory<LightingCalculationCubit>(
      () => LightingCalculationCubit(getIt()));
  getIt.registerFactory<CustomerCubit>(() => CustomerCubit(getIt()));
  getIt.registerFactory<LightingCategoriesCalculationCubit>(() => LightingCategoriesCalculationCubit(getIt()));
}
