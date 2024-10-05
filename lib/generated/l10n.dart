// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Price Offers`
  String get price_offers {
    return Intl.message(
      'Price Offers',
      name: 'price_offers',
      desc: '',
      args: [],
    );
  }

  /// `Technical Offer`
  String get technical_offer {
    return Intl.message(
      'Technical Offer',
      name: 'technical_offer',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get maintenance {
    return Intl.message(
      'Maintenance',
      name: 'maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Customer Base`
  String get customer_base {
    return Intl.message(
      'Customer Base',
      name: 'customer_base',
      desc: '',
      args: [],
    );
  }

  /// `Price Management`
  String get price_management {
    return Intl.message(
      'Price Management',
      name: 'price_management',
      desc: '',
      args: [],
    );
  }

  /// `New Price Offers`
  String get new_price_offers {
    return Intl.message(
      'New Price Offers',
      name: 'new_price_offers',
      desc: '',
      args: [],
    );
  }

  /// `New Technical Offers`
  String get new_technical_offers {
    return Intl.message(
      'New Technical Offers',
      name: 'new_technical_offers',
      desc: '',
      args: [],
    );
  }

  /// `Price Offers Issued`
  String get price_offers_issued {
    return Intl.message(
      'Price Offers Issued',
      name: 'price_offers_issued',
      desc: '',
      args: [],
    );
  }

  /// `Technical Offers Issued`
  String get technical_offers_issued {
    return Intl.message(
      'Technical Offers Issued',
      name: 'technical_offers_issued',
      desc: '',
      args: [],
    );
  }

  /// `store management`
  String get store_management {
    return Intl.message(
      'store management',
      name: 'store_management',
      desc: '',
      args: [],
    );
  }

  /// `lighting stations`
  String get lighting_stations {
    return Intl.message(
      'lighting stations',
      name: 'lighting_stations',
      desc: '',
      args: [],
    );
  }

  /// `irrigation stations`
  String get irrigation_stations {
    return Intl.message(
      'irrigation stations',
      name: 'irrigation_stations',
      desc: '',
      args: [],
    );
  }

  /// `surface irrigation station`
  String get surface_irrigation_station {
    return Intl.message(
      'surface irrigation station',
      name: 'surface_irrigation_station',
      desc: '',
      args: [],
    );
  }

  /// `deep irrigation station`
  String get deep_irrigation_station {
    return Intl.message(
      'deep irrigation station',
      name: 'deep_irrigation_station',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get categories {
    return Intl.message(
      'categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `lighting load calculation`
  String get lighting_load_calculation {
    return Intl.message(
      'lighting load calculation',
      name: 'lighting_load_calculation',
      desc: '',
      args: [],
    );
  }

  /// `calculation inverter and batteries`
  String get calculation_inverter_and_batteries {
    return Intl.message(
      'calculation inverter and batteries',
      name: 'calculation_inverter_and_batteries',
      desc: '',
      args: [],
    );
  }

  /// `add item`
  String get add_item {
    return Intl.message(
      'add item',
      name: 'add_item',
      desc: '',
      args: [],
    );
  }

  /// `add image`
  String get add_image {
    return Intl.message(
      'add image',
      name: 'add_image',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `cancle`
  String get cancle {
    return Intl.message(
      'cancle',
      name: 'cancle',
      desc: '',
      args: [],
    );
  }

  /// `customers data`
  String get customers_data {
    return Intl.message(
      'customers data',
      name: 'customers_data',
      desc: '',
      args: [],
    );
  }

  /// `table information`
  String get table_info {
    return Intl.message(
      'table information',
      name: 'table_info',
      desc: '',
      args: [],
    );
  }

  /// `customer name`
  String get customer_name {
    return Intl.message(
      'customer name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `customer address`
  String get customer_address {
    return Intl.message(
      'customer address',
      name: 'customer_address',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phone_number {
    return Intl.message(
      'phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `station type`
  String get station_type {
    return Intl.message(
      'station type',
      name: 'station_type',
      desc: '',
      args: [],
    );
  }

  /// `offer expiry date`
  String get offer_expiry_date {
    return Intl.message(
      'offer expiry date',
      name: 'offer_expiry_date',
      desc: '',
      args: [],
    );
  }

  /// `No Data Yet!, Please Add Data`
  String get no_data_yet {
    return Intl.message(
      'No Data Yet!, Please Add Data',
      name: 'no_data_yet',
      desc: '',
      args: [],
    );
  }

  /// `Extract Pdf`
  String get extract_pdf {
    return Intl.message(
      'Extract Pdf',
      name: 'extract_pdf',
      desc: '',
      args: [],
    );
  }

  /// `Prices Database`
  String get prices_database {
    return Intl.message(
      'Prices Database',
      name: 'prices_database',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `addredd`
  String get address {
    return Intl.message(
      'addredd',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Enter the motor's horsepower`
  String get enter_hourse_power {
    return Intl.message(
      'Enter the motor\'s horsepower',
      name: 'enter_hourse_power',
      desc: '',
      args: [],
    );
  }

  /// `Units Number`
  String get units_number {
    return Intl.message(
      'Units Number',
      name: 'units_number',
      desc: '',
      args: [],
    );
  }

  /// `Unit power`
  String get unit_power {
    return Intl.message(
      'Unit power',
      name: 'unit_power',
      desc: '',
      args: [],
    );
  }

  /// `Number of operating hours`
  String get number_of_operating_hours {
    return Intl.message(
      'Number of operating hours',
      name: 'number_of_operating_hours',
      desc: '',
      args: [],
    );
  }

  /// `enter item name`
  String get enter_item_name {
    return Intl.message(
      'enter item name',
      name: 'enter_item_name',
      desc: '',
      args: [],
    );
  }

  /// `LE`
  String get pound {
    return Intl.message(
      'LE',
      name: 'pound',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
