import 'package:solar/core/routing/routes.dart';

String checkRoutNameNaviigation(String screenName) {
  switch (screenName) {
    //* Home Screen
    case 'Price offers-1':
      return Routes.priceOffersScreen;
    case 'Technical offer':
      return Routes.technicalOfferScreen;
    case 'Maintenance-1':
      return 'Routes.technicalOfferScreen';
    case 'customer Base':
      return 'Routes.technicalOfferScreen';
    //* Price offers screen
    case 'Price offers-2':
      return Routes.newPriceOffersScreen;
    case '"Price offers issued"':
      return 'Routes.categoriesScreen';
    case 'Maintenance-2':
      return 'Routes.categoriesScreen';
    case 'Lighting stations':
      return Routes.lightingStationsCategoriesScreen;
    case 'Surface irrigation stations':
      return 'Routes.technicalOfferScreen';
    case 'Deep irrigation stations':
      return 'Routes.technicalOfferScreen';

    //* Technical offer Screen
    case 'New Technical offer':
      return Routes.newTechnicalOffers;
    case 'Technical Lighting stations':
      return Routes.technicalLightingStations;
    case 'inverter and battery calculation':
      return Routes.inverterAndBatteryCalculation;
    case 'Lighting load calculation':
      return Routes.lightingLoadCalculation;

    default:
      return '';
  }
}
