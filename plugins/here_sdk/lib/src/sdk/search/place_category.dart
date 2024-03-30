// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

/// Represents a category of place with different levels of granularity.
///
/// This class also defines a set of most commonly used categories.
abstract class PlaceCategory {
  /// Creates a new instance of this class.
  ///
  /// [id] Place category ID.
  /// The HERE places category system provides three levels of granularity:
  /// 1. Level 1 represents high level groupings, such as "Eat and drink".
  ///    Their IDs take the form "xxx", for example "100".
  /// 2. Level 2 represents logical sub-groups or domains, such as "Eat and Drink / Restaurant".
  ///    Their IDs take the form "xxx-xxxx", for example "100-1000".
  /// 3. Level 3 provides the greatest level of granularity about place categorization,
  ///    such as "Eat and Drink / Restaurant / Casual Dining".
  ///    Their IDs take the form "xxx-xxxx-xxxx", for example "100-1000-0001".
  ///    The category ID can be provided as one of the predefined values, such as
  ///    [PlaceCategory.eatAndDrinkRestaurant] or as a literal string that matches
  ///    one of the category IDs defined by the HERE Search service.
  ///    Only level 1 and 2 category IDs are predefined.
  ///    The complete list of supported category IDs, including level 3, can be found online:
  ///    https://developer.here.com/documentation/geocoding-search-api/dev_guide/topics-places/places-category-system-full.html.
  ///
  factory PlaceCategory(String id) => $prototype.make(id);

  /// Top level category for places where food or beverages are prepared or served.
  static final String eatAndDrink = "100";

  /// An establishment that prepares and serves refreshments and prepared meals.
  static final String eatAndDrinkRestaurant = "100-1000";

  /// An establishment that sells drinks, such as coffee and tea, as well as refreshments.
  static final String eatAndDrinkCoffeeTea = "100-1100";

  /// Top level category for places commonly associated with entertainment,
  /// such as bars, cinemas, theatres, casinos and night clubs.
  static final String goingOutEntertainment = "200";

  /// An establishment that provides evening entertainment and usually serves alcoholic beverages.
  static final String goingOutNightlife = "200-2000";

  /// An establishment that shows movies through screen projection.
  static final String goingOutCinema = "200-2100";

  /// An establishment where various types of performing arts are presented.
  static final String goingOutTheatreMusicCulture = "200-2200";

  /// An establishment that provides gambling entertainment.
  static final String goingOutGamblingLotteryBetting = "200-2300";

  /// Top level category for places of special interest,
  /// such as common tourist attractions, museums and places of worship.
  static final String sightsAndMuseums = "300";

  /// A designated area of special interest to tourists.
  static final String sightsLandmarkAttaction = "300-3000";

  /// An establishment dedicated to the preservation and exhibition of artistic, historical, or scientific artifacts.
  static final String sightsMuseum = "300-3100";

  /// An establishment special religious significance or where religious services are held.
  static final String sightsReligiousPlace = "300-3200";

  /// Top level category for natural or man-made areas of regional importance,
  /// such as bodies of water, mountains, forested areas and other geographic areas.
  static final String naturalAndGeographical = "350";

  /// A natural and geographical feature of the earth's surface that is covered with water, such as a lake, river, stream or ocean.
  static final String naturalAndGeographicalBodyOfWater = "350-3500";

  /// A natural and geographical feature that is higher than the surrounding land.
  static final String naturalAndGeographicalMountainOrHill = "350-3510";

  /// A natural or artificial feature that is below sea level.
  static final String naturalAndGeographicalUnderseaFeature = "350-3520";

  /// A dense growth of trees, open uncultivated land or other large masses of vegetation.
  static final String naturalAndGeographicalForestHealthOtherVegetation = "350-3522";

  /// A feature not classified as a Body of Water, Mountain or Hill, Undersea Feature, or Forest, Heath or Other Vegetation.
  static final String naturalAndGeographicalOther = "350-3550";

  /// Top level category for places commonly associated with pedestrian and cargo transport facilities,
  /// including airports, rail yards and seaports.
  static final String transport = "400";

  /// A designated area that serves various aspects of aviation related sports, including gliders, recreational aircraft and model airplanes.
  static final String transportAirport = "400-4000";

  /// A facility for travelers who are travelling between stops on public transport.
  static final String transportPublic = "400-4100";

  /// A facility that handles some aspect of the transportation of cargo freight.
  static final String transportCargo = "400-4200";

  /// An establishment along a motorway (controlled access road) that provides restrooms and parking.
  static final String transportRestArea = "400-4300";

  /// Top level category for places offering lodging accommodations, dwellings or similar living quarters to travellers,
  /// such as hotels, motels, resorts, cruise ships and campgrounds.
  static final String accommodation = "500";

  /// A business that provides lodging or temporary living quarters.
  static final String accommodationHotelMotel = "500-5000";

  /// A business that provides lodging to the public generally without room service.
  static final String accommodationLodging = "500-5100";

  /// Top level category for places that are designated for sports, recreation, parking, beaches
  /// and other leisure and outdoor activities.
  static final String leisureAndOutdoor = "550";

  /// Public land preserved and maintained for recreational use.
  static final String leisureOutdoorRecreation = "550-5510";

  /// A park that contains rides and/or other entertainment which may be based on a central theme.
  static final String leisureOther = "550-5520";

  /// Top level category for places where consumer goods are commonly sold,
  /// such as clothing stores, grocery stores, hardware stores and other types of shopping centers.
  static final String shopping = "600";

  /// An establishment that sells groceries, candy, toiletries, soft drinks, tobacco products, newspapers and other products.
  static final String shoppingConvenienceStore = "600-6000";

  /// A complex of businesses that are co-located and share common services.
  static final String shoppingMallComplex = "600-6100";

  /// A business that sells a wide variety of merchandise that is organized by product or service departments.
  static final String shoppingDepartmentStore = "600-6200";

  /// A business that sells specialty products of a particular type of food or beverage.
  static final String shoppingFoodAndDrink = "600-6300";

  /// A business that sells medications, toiletry items and other retail cosmetics.
  static final String shoppingDrugstorePharmacy = "600-6400";

  /// A business that sells consumer electronics and electronic entertainment equipment.
  static final String shoppingElectronics = "600-6500";

  /// A business that sells crafts, gardening, remodeling, or decorating items for the home.
  static final String shoppingHardwareHouseGarden = "600-6600";

  /// A business that sells books, magazines and other reading material.
  static final String shoppingBookstore = "600-6700";

  /// A business that sells apparel items, garments or fashion accessories for men, women, and children.
  static final String shoppingClothingAndAccesories = "600-6800";

  /// A business that sells a variety of products targeted to consumers.
  static final String shoppingConsumerGoods = "600-6900";

  /// A business that provides hair styling and personal appearance services.
  /// Places in this category may also sell hair products and other related cosmetic items.
  static final String shoppingHairAndBeauty = "600-6950";

  /// Top level category for places that provide professional services to other businesses,
  /// such as printing, photocopying, graphic design, marketing, advertising and other general business services.
  static final String businessAndServices = "700";

  /// Businesses that specialize in the maintenance, lending, exchange, or issuance of money.
  static final String businessAndServicesBanking = "700-7000";

  /// A computer terminal that allows bank customers to deposit, withdraw, or transfer funds without the assistance of a bank teller.
  static final String businessAndServicesAtm = "700-7010";

  /// Businesses that provide money related services.
  static final String businessAndServicesMoneyCash = "700-7050";

  /// Businesses that provide communication services.
  static final String businessAndServicesCommunicationMedia = "700-7100";

  /// Businesses that provide a service or product for use by other businesses.
  static final String businessAndCommercialServices = "700-7200";

  /// Businesses that employ people in and around the city in which it is located.
  static final String businessAndServicesIndustry = "700-7250";

  /// Municipal emergency services.
  static final String businessAndServicesPoliceFireEmergency = "700-7300";

  /// An organization that provides consumer services for a variety of products for used by the public.
  static final String businessAndConsumerServices = "700-7400";

  /// An office or station that receives, sorts, dispatches and delivers mail to a specific area or region.
  static final String businessAndServicesPostOffice = "700-7450";

  /// Businesses that provide a variety of information for visiting tourists,
  /// such as event schedules, lodging/accommodations, restaurants, attractions and more.
  static final String businessAndServicesTouristInformation = "700-7460";

  /// Businesses that sell fuel for vehicles.
  static final String businessAndServicesFuelingStation = "700-7600";

  /// Businesses that provide recharging services for electric vehicles.
  static final String businessAndServicesEvChargingStation = "700-7600-0322";

  /// Businesses that sell new automobiles and motorcycles.
  static final String businessAndServicesCarDealerSales = "700-7800";

  /// Businesses that provide automotive repair services.
  static final String businessAndServicesCarRepairServices = "700-7850";

  /// Businesses that rent or lease automobiles.
  static final String businessAndServicesCarRental = "700-7851";

  /// Business that sell or service trucks and tractor trailers.
  static final String businessAndServicesTruckSemiDealer = "700-7900";

  /// Top level category for places associated with specialized facilities,
  /// such as sports venues, government buildings, health care centers and other types of facilities.
  static final String facilities = "800";

  /// Facilities that include dental offices, hospitals, nursing homes and other health care-related services.
  static final String facilitiesHospitalHealthcare = "800-8000";

  /// A Place where government services are provided.
  static final String facilitiesGovernmentCommunitty = "800-8100";

  /// Facilities that are used for educational purposes including primary schooling, secondary schooling, universities and more.
  static final String facilitiesEducation = "800-8200";

  /// Facilities that offer books, periodicals, audio, video and other material for public use.
  static final String facilitiesLibrary = "800-8300";

  /// An area or facility used for the hosting of fairs and conventions.
  static final String facilitiesEventSpaces = "800-8400";

  /// Area or building used for parking cars.
  static final String facilitiesParking = "800-8500";

  /// A facility used for individual and team sports including recreational sports.
  static final String facilitiesVenueSports = "800-8600";

  /// Facilities with miscellaneous uses such as Clubhouses, Offices, and Registration Offices.
  static final String facilitiesOther = "800-8700";

  /// Top level category for places that are owned, operated or managed by municipalities,
  /// such as cities, towns, villages, boroughs and shires.
  static final String areasAndBuildings = "900";

  /// Outdoor areas or complexes with designations for specific businesses or interests.
  static final String areasAndBuildingsOutdoorComplex = "900-9200";

  /// Areas and buildings designated for residential or office use.
  static final String areasAndBuildingsResidentalOffice = "900-9300";

  /// Gets the place category ID.
  String get id;

  /// Gets the localised place category name.
  /// It is available only when when `PlaceCategory` is obtained from `Place`.
  /// That means that when `PlaceCategory` is constructed directly by the client,
  /// `name` is always `null`.
  String? get name;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = PlaceCategory$Impl(Pointer<Void>.fromAddress(0));
}


// PlaceCategory "private" section, not exported.

final _sdkSearchPlacecategoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_PlaceCategory_register_finalizer'));
final _sdkSearchPlacecategoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceCategory_copy_handle'));
final _sdkSearchPlacecategoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceCategory_release_handle'));



/// @nodoc
@visibleForTesting
class PlaceCategory$Impl extends __lib.NativeBase implements PlaceCategory {

  PlaceCategory$Impl(Pointer<Void> handle) : super(handle);


  PlaceCategory make(String id) {
    final _result_handle = _make(id);
    final _result = PlaceCategory$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchPlacecategoryRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(String id) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_PlaceCategory_make__String'));
    final _idHandle = stringToFfi(id);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _idHandle);
    stringReleaseFfiHandle(_idHandle);
    return __resultHandle;
  }

  @override
  String get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_PlaceCategory_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String? get name {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_PlaceCategory_name_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkSearchPlacecategoryToFfi(PlaceCategory value) =>
  _sdkSearchPlacecategoryCopyHandle((value as __lib.NativeBase).handle);

PlaceCategory sdkSearchPlacecategoryFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PlaceCategory) return instance;

  final _copiedHandle = _sdkSearchPlacecategoryCopyHandle(handle);
  final result = PlaceCategory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchPlacecategoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchPlacecategoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchPlacecategoryReleaseHandle(handle);

Pointer<Void> sdkSearchPlacecategoryToFfiNullable(PlaceCategory? value) =>
  value != null ? sdkSearchPlacecategoryToFfi(value) : Pointer<Void>.fromAddress(0);

PlaceCategory? sdkSearchPlacecategoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchPlacecategoryFromFfi(handle) : null;

void sdkSearchPlacecategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacecategoryReleaseHandle(handle);

// End of PlaceCategory "private" section.


