import 'package:get_it/get_it.dart';
import 'package:solar/core/database/database_factory.dart';
import 'package:solar/core/database/database_services.dart';
import 'package:solar/core/firebase/cloud_firestore.dart';
import 'package:solar/core/firebase/firebase_factory.dart';
import 'package:solar/core/helper/shared_prefrence.dart';
import 'package:solar/core/table/table_services.dart';
import 'package:solar/features/admin/cubit/admin_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/repo/customer_repo.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/firebase_repo.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/technical_offers_repo.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/cubit/inverter_and_battery_cubit.dart';
import '../../features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import '../../features/home/screens/price_offers/logic/repo/price_offers_repo.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  //* initial SharedPrefHelper
  await SharedPref.initSharedPreference();
  final DbFactory dbFactory = DbFactory();

  //* initial Database
  await dbFactory.createDatabase();

  //* initial Firebase
  final FirebaseFactory firebaseFactory = FirebaseFactoryImpl();
  firebaseFactory.initFirebase();

  //* get Firebase Factory
  getIt.registerLazySingleton<FirebaseFactory>(() => FirebaseFactoryImpl());

  //* services
  getIt.registerLazySingleton<DbServices>(() => DbServices(dbFactory));
  getIt.registerLazySingleton<TableSevices>(() => TableSevices());
  getIt.registerLazySingleton<PanalServices>(
      () => CloudFirestoreServicesImp(getIt()));

  //* repos
  getIt.registerLazySingleton<TechnicalOffersRepo>(
      () => TechnicalOffersRepo(getIt()));
  getIt.registerLazySingleton<CustomerRepo>(() => CustomerRepo(getIt()));
  getIt.registerLazySingleton<PriceOffersRepo>(() => PriceOffersRepo(getIt()));
  getIt.registerLazySingleton<FirebaseRepo>(() => FirebaseRepo(getIt()));

  //* cubits
  getIt.registerFactory<TechnicalOffersCubit>(
      () => TechnicalOffersCubit(getIt()));
  getIt.registerFactory<CustomerCubit>(() => CustomerCubit(getIt()));
  getIt.registerFactory<LightingCategoriesCalculationCubit>(
      () => LightingCategoriesCalculationCubit(getIt(), getIt()));
      getIt.registerFactory<InverterAndBatteryCubit>(() => InverterAndBatteryCubit(getIt()));
  getIt.registerFactory<AdminCubit>(() => AdminCubit(getIt()));
}
