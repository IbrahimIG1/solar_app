import 'package:flutter/material.dart';
import 'package:solar/core/routing/routes.dart';
import 'package:solar/features/categories/categories_screen.dart';
import 'package:solar/features/categories_details/categories_details.dart';
import 'package:solar/features/home/home_screen.dart';
import 'package:solar/features/home/screens/price_offer_screen/price_offers_screen.dart';
import 'package:solar/features/home/screens/technical_offer_screen/technical_offer_screen.dart';
import 'package:solar/features/sections_screen/sections_screen.dart';

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
         case Routes.technicalOfferScreen:
        return MaterialPageRoute(
          builder: (_) => const TechnicalOfferScreen(),
        );
      case Routes.sectionsScreen:
        return MaterialPageRoute(
          builder: (_) => const SectionsScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );
      case Routes.categoriesDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CategoriesDetailsScreen(
            list: arguments as Map,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('OnBording Screen'),
            ),
          ),
        );
    }
  }
}
