import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/default_route_screen.dart';
import 'package:solar/features/home/screens/customer_base/customer_base.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/customer_screen.dart';
import 'package:solar/features/home/screens/price_management/price_management.dart';
import 'package:solar/features/new_offers_screens/new_price_offers/screens/car_battrey.dart';
import 'package:solar/features/stations_screens/lighting/price_offer/lighting_screen.dart';
import 'package:solar/features/stations_screens/lighting/price_offer/categories_screen/lighting_station_categories_screen.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/inverter_and_battery/inverter_and_battery_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/cubit/technical_offers_cubit.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/devices_screen.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/categories_screen/electrcity_load.dart/device_form_screen/device_calculation_screen.dart';
import 'package:solar/features/stations_screens/lighting/technical_offer/lighting_station_screen.dart';
import 'package:solar/features/new_offers_screens/new_technical_offer/new_technical_offers.dart';
import 'package:solar/features/home/home_screen.dart';
import 'package:solar/features/home/screens/price_offers/price_offers_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/technical_offer_screen.dart';
import 'package:solar/features/new_offers_screens/new_price_offers/new_price_offers_screen.dart';
import 'package:solar/features/price_issud_screens/price_offers/price_offers_issued.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.customerFormScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CustomerCubit(getIt()),
            child: const CustomerFormScreen(),
          ),
        );
      case Routes.priceManagement:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LightingCategoriesCalculationCubit(getIt(), getIt())
                  ..getPricesTableData(),
            child: const PriceManagement(),
          ),
        );

      //* New Price Offers
      case Routes.priceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const PriceOffersScreen(),
        );
      case Routes.newPriceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const NewPriceOffers(),
        );
      case Routes.priceOffersIssuedScreen:
        return MaterialPageRoute(
          builder: (_) => const PriceOffersIssuedScreen(),
        );
      //* ../new price offers screens
      case Routes.lightingStationsCategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LightingCategoriesCalculationCubit(getIt(), getIt()),
            child: const LightingStationsCategoriesScreen(),
          ),
        );
      case Routes.categoriesDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LightingCategoriesCalculationCubit(getIt(), getIt())
                  ..getDetailsDataFromDatabase(arguments),
            child: LightingStationCategoriesScreen(
              data: arguments as Map<String, dynamic>,
            ),
          ),
        );
      case Routes.carBatteryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                LightingCategoriesCalculationCubit(getIt(), getIt()),
            child: CarBattrey(),
          ),
        );
      //* Technical Offer
      case Routes.technicalOfferScreen:
        return MaterialPageRoute(
          builder: (_) => const TechnicalOfferScreen(),
        );
      case Routes.newTechnicalOffers:
        return MaterialPageRoute(
          builder: (_) => const NewTechnicalOffers(),
        );
      case Routes.technicalLightingStations:
        return MaterialPageRoute(
          builder: (_) => const TechLightingStationScreen(),
        );
      case Routes.inverterAndBatteryCalculation:
        return MaterialPageRoute(
          builder: (_) => const InverterAndBatteryScreen(),
        );
      case Routes.lightingLoadItem:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TechnicalOffersCubit(getIt()),
            child: const DevicesSceen(),
          ),
        );
      case Routes.lightingLoadCalculation:
        return MaterialPageRoute(
          builder: (_) => DeviceCalculationScreen(
            itemData: arguments as Map<String, dynamic>,
          ),
        );

      //* customer Base
      case Routes.customerBaseScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CustomerCubit(getIt()),
            child: CustomerBaseScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: DefaultRouteScreen()),
        );
    }
  }
}
