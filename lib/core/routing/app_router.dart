import 'package:flutter/material.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/categories_screen.dart';
import 'package:solar/features/categories_details/categories_details.dart';
import 'package:solar/features/home/ui/home_screen.dart';
import 'package:solar/features/home/screens/price_offers/ui/price_offers_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/technical_offer_screen.dart';
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
      case Routes.priceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const PriceOffersScreen(),
        );
      case Routes.newPriceOffersScreen:
        return MaterialPageRoute(
          builder: (_) => const NewPriceOffers(),
        );
      case Routes.technicalOfferScreen:
        return MaterialPageRoute(
          builder: (_) => const TechnicalOfferScreen(),
        );
      case Routes.sectionsScreen:
        return MaterialPageRoute(
          builder: (_) => const NewPriceOffers(),
        );
      case Routes.lightingStationscategoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const LightingStationsCategoriesScreen(),
        );
      case Routes.categoriesDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CategoriesDetailsScreen(
            list: arguments as Map,
          ),
        );
      case Routes.categoriesDetailsScreen:
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
