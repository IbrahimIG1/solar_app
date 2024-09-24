import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/features/price_offers/screens/new_price_offers_Categories_screen/screens/lighting_stations_screen/lighting_station_cards_screen.dart';
import 'package:solar/features/categories_details/categories_details.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/inverter_and_battery_calculation_screen/inverter_and_battery_calculation_screen.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/logic/cubit/lighting_calculation_cubit.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/ui/lighting_load_items_screens.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/screens/lighting_load_calculation_screen/ui/screens/lighting_load_calculation_form_screen.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/screens/lighting_stations_screen/ui/lighting_station_screen.dart';
import 'package:solar/features/technical_offer_screen/screens/new_technical_offer_screens/ui/new_technical_offers_screen.dart';
import 'package:solar/features/home_screen/home_screen.dart';
import 'package:solar/features/price_offers/ui/price_offers_screen.dart';
import 'package:solar/features/technical_offer_screen/ui/technical_offer_screen.dart';
import 'package:solar/features/price_offers/screens/new_price_offers_Categories_screen/ui/new_price_offers_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
    
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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
          builder: (_) => CategoriesDetailsScreen(
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
            create: (context) => LightingCalculationCubit()..createDatabase(),
            child: const LightingLoadItems(),
          ),
        );
      case Routes.lightingLoadCalculation:
        return MaterialPageRoute(
          builder: (_) => LightingLoadCalculationScreen(
            itemData: arguments as Map<String, dynamic>,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Screen Yet'),
            ),
          ),
        );
    }
  }
}
