import 'package:solar/core/routing/routes.dart';

String checkRoutNameNaviigation(String screenName) {
  switch (screenName) {
    case 'Price offers-1':
      return Routes.priceOffersScreen;
    case 'Technical offer':
      return Routes.technicalOfferScreen;
    case 'Maintenance-1':
      return Routes.technicalOfferScreen;
    case 'customer Base':
      return Routes.technicalOfferScreen;
    case 'Price offers-2':
      return Routes.newPriceOffersScreen;
    case '"Price offers issued"':
      return 'Routes.categoriesScreen';
    case 'Maintenance-2':
      return 'Routes.categoriesScreen';
    case 'Lighting stations':
      return Routes.lightingStationscategoriesScreen;
    case 'Surface irrigation stations':
      return 'Routes.technicalOfferScreen';
    case 'Deep irrigation stations':
      return 'Routes.technicalOfferScreen';
    default:
      return '';
  }
}
