import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/di.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/core/widgets/default_route_screen.dart';
import 'package:solar/features/home/screens/customer_base/customer_base.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/customer_screen.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/categories_screen.dart';
import 'package:solar/features/categories_details/Lighting_categories_calculation_form_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/inverter_and_battery_calculation/inverter_and_battery_calculation.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/lighting_load_items.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/screens/lighting_load_calculation/ui/screens/lighting_load_calculation.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/screens/lighting_stations/ui/lighting_station_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/screens/new_technical_offer/ui/new_technical_offers.dart';
import 'package:solar/features/home/ui/home_screen.dart';
import 'package:solar/features/home/screens/price_offers/ui/price_offers_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/ui/technical_offer_screen.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/ui/new_price_offers_screen.dart';

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

      //* New Price Offers
      case Routes.priceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const PriceOffersScreen(),
        );
      case Routes.newPriceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const NewPriceOffers(),
        );
      case Routes.lightingStationsCategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const LightingStationsCategoriesScreen(),
        );
      case Routes.categoriesDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => LightingCategoriesCalculationFormScreen(
            list: arguments as Map,
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
          builder: (_) => const InverterAndBatteryCalculation(),
        );
      case Routes.lightingLoadItem:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LightingCalculationCubit(getIt()),
            child: const LightingLoadItems(),
          ),
        );
      case Routes.lightingLoadCalculation:
        return MaterialPageRoute(
          builder: (_) => LightingLoadCalculationScreen(
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
