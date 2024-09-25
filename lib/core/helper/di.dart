import 'package:get_it/get_it.dart';
import 'package:solar/core/database/database_factory.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/repo/lighting_load_calculation_repo.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final DbFactory dbFactory = DbFactory();
  await dbFactory.createDatabase(tableName: "lighting_items_table");

//* services
  getIt.registerLazySingleton<DbServices>(() => DbServices(dbFactory));

  //* repos
  getIt.registerLazySingleton<LightingRepo>(() => LightingRepo(getIt()));

  //* cubits
  getIt.registerFactory<LightingCalculationCubit>(
      () => LightingCalculationCubit(getIt()));
}
