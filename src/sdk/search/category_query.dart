// Copyright (c) 2018-2022 HERE Global B.V. and its affiliate(s).
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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:meta/meta.dart';






















/// The options to specify a query by categories.

class CategoryQuery {
  /// List of categories.
  List<PlaceCategory> categories;

  /// List of subcategories to exclude.
  List<PlaceCategory> excludeCategories;

  /// Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based on other parameters provided.
  String? filter;

  /// Area in which to provide the most relevant places.
  CategoryQueryArea area;

  /// Geographic coordinates of the center around which to provide the most relevant places.
  @Deprecated("Will be removed in v4.14.0. Please use `CategoryQuery.Area.area_center` instead.")
  GeoCoordinates areaCenter;

  /// Geographic rectangle area in which to provide the most relevant places.
  /// Usage of rectangle area in category search query is not supported when using offline search
  /// in OfflineSearchEngine.
  @Deprecated("Will be removed in v4.14.0. Please use `CategoryQuery.Area.box_area` instead.")
  GeoBox? boxArea;

  /// Geographic circle area in which to provide the most relevant places.
  /// Usage of circle area in category search query is not supported when using offline search in
  /// OfflineSearchEngine.
  @Deprecated("Will be removed in v4.14.0. Please use `CategoryQuery.Area.circle_area` instead.")
  GeoCircle? circleArea;

  /// Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  /// When [CategoryQuery.corridorArea] is provided,
  /// [CategoryQuery.areaCenter] has to be within it, otherwise
  /// [CategoryQuery.areaCenter] is ignored when searching.
  @Deprecated("Will be removed in v4.14.0. Please use `CategoryQuery.Area.corridor_area` instead.")
  GeoCorridor? corridorArea;

  CategoryQuery._(this.categories, this.excludeCategories, this.filter, this.area, this.areaCenter, this.boxArea, this.circleArea, this.corridorArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoryInArea(PlaceCategory category, CategoryQueryArea area) => $prototype.withCategoryInArea(category, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoriesInArea(List<PlaceCategory> categories, CategoryQueryArea area) => $prototype.withCategoriesInArea(categories, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoryAndFilterInArea(PlaceCategory category, String filter, CategoryQueryArea area) => $prototype.withCategoryAndFilterInArea(category, filter, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoriesAndFilterInArea(List<PlaceCategory> categories, String filter, CategoryQueryArea area) => $prototype.withCategoriesAndFilterInArea(categories, filter, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) => $prototype.withFilter(categories, filter, areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) => $prototype.withCategoryAndFilter(category, filter, areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery(List<PlaceCategory> categories, GeoCoordinates areaCenter) => $prototype.$init(categories, areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategory(PlaceCategory category, GeoCoordinates areaCenter) => $prototype.withCategory(category, areaCenter);
  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.nearCenterInBoxArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.nearCenterInBoxArea(categories, areaCenter, boxArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic rectangle
  /// area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withFilterNearCenterInBoxArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.withFilterNearCenterInBoxArea(categories, filter, areaCenter, boxArea);
  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryNearCenterInBoxArea(PlaceCategory category, GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.withCategoryNearCenterInBoxArea(category, areaCenter, boxArea);
  /// Constructs a CategoryQuery from the provided category and geographic rectangle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryAndFilterNearCenterInBoxArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.withCategoryAndFilterNearCenterInBoxArea(category, filter, areaCenter, boxArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.nearCenterInCircleArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.nearCenterInCircleArea(categories, areaCenter, circleArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withFilterNearCenterInCircleArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.withFilterNearCenterInCircleArea(categories, filter, areaCenter, circleArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryNearCenterInCircleArea(PlaceCategory category, GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.withCategoryNearCenterInCircleArea(category, areaCenter, circleArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic circle area.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryAndFilterNearCenterInCircleArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.withCategoryAndFilterNearCenterInCircleArea(category, filter, areaCenter, circleArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) => $prototype.withCorridorArea(categories, corridorArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) => $prototype.withCategoryAndCorridorArea(category, corridorArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) => $prototype.withFilterAndCorridorArea(categories, filter, corridorArea);
  /// Constructs a CategoryQuery from the provided list of categories and geographic corridor.
  ///
  /// The corridor represents the route to be searched.
  /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  /// [category] Category for query.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based only on the list of categories provided.
  ///
  /// [corridorArea] Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  ///
  @Deprecated("Will be removed in v4.14.0. Please use the constructor taking `CategoryQuery.Area`.")

  factory CategoryQuery.withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) => $prototype.withCategoryAndFilterAndCorridorArea(category, filter, corridorArea);
  /// Sets the list of subcategories to exclude.
  ///
  @Deprecated("Will be removed in v4.14.0.")

  CategoryQuery withExcludeCategories(List<PlaceCategory> categories) => $prototype.withExcludeCategories(this, categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQuery) return false;
    CategoryQuery _other = other;
    return DeepCollectionEquality().equals(categories, _other.categories) &&
        DeepCollectionEquality().equals(excludeCategories, _other.excludeCategories) &&
        filter == _other.filter &&
        area == _other.area &&
        areaCenter == _other.areaCenter &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + DeepCollectionEquality().hash(excludeCategories);
    result = 31 * result + filter.hashCode;
    result = 31 * result + area.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CategoryQuery$Impl();
}





@immutable
class CategoryQueryArea {
  /// Geographic coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// Geographic rectangle area in which to provide the most relevant places.
  /// Usage of rectangle area in category search query is not supported when using offline search
  /// in OfflineSearchEngine.
  final GeoBox? boxArea;

  /// Geographic circle area in which to provide the most relevant places.
  /// Usage of circle area in category search query is not supported when using offline search in
  /// OfflineSearchEngine.
  final GeoCircle? circleArea;

  /// Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  /// When [CategoryQuery.corridorArea] is provided,
  /// [CategoryQuery.areaCenter] has to be within it, otherwise
  /// [CategoryQuery.areaCenter] is ignored when searching.
  final GeoCorridor? corridorArea;

  const CategoryQueryArea._(this.areaCenter, this.boxArea, this.circleArea, this.corridorArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCenter(GeoCoordinates areaCenter) => $prototype.withCenter(areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withBox(GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.withBox(areaCenter, boxArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCircle(GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.withCircle(areaCenter, circleArea);
  /// Geographic corridor area in which to provide the most relevant places.
  ///
  /// The contained polyline and half-width define the area that will be used in a search query.
  ///
  /// [corridorArea] Geographic circle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCorridor(GeoCorridor corridorArea) => $prototype.withCorridor(corridorArea);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQueryArea) return false;
    CategoryQueryArea _other = other;
    return areaCenter == _other.areaCenter &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CategoryQueryArea$Impl();
}


// CategoryQueryArea "private" section, not exported.

final _sdkSearchCategoryqueryAreaCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_create_handle'));
final _sdkSearchCategoryqueryAreaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_release_handle'));
final _sdkSearchCategoryqueryAreaGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_areaCenter'));
final _sdkSearchCategoryqueryAreaGetFieldboxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_boxArea'));
final _sdkSearchCategoryqueryAreaGetFieldcircleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_circleArea'));
final _sdkSearchCategoryqueryAreaGetFieldcorridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_corridorArea'));



/// @nodoc
@visibleForTesting
class CategoryQueryArea$Impl {
  CategoryQueryArea withCenter(GeoCoordinates areaCenter) {
    final _withCenterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCenterFfi(__lib.LibraryContext.isolateId, _areaCenterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withBox(GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates_GeoBox'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withBoxFfi(__lib.LibraryContext.isolateId, _areaCenterHandle, _boxAreaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withCircle(GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates_GeoCircle'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCircleFfi(__lib.LibraryContext.isolateId, _areaCenterHandle, _circleAreaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withCorridor(GeoCorridor corridorArea) {
    final _withCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCorridor'));
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCorridorFfi(__lib.LibraryContext.isolateId, _corridorAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchCategoryqueryAreaToFfi(CategoryQueryArea value) {
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(value.areaCenter);
  final _boxAreaHandle = sdkCoreGeoboxToFfiNullable(value.boxArea);
  final _circleAreaHandle = sdkCoreGeocircleToFfiNullable(value.circleArea);
  final _corridorAreaHandle = sdkCoreGeocorridorToFfiNullable(value.corridorArea);
  final _result = _sdkSearchCategoryqueryAreaCreateHandle(_areaCenterHandle, _boxAreaHandle, _circleAreaHandle, _corridorAreaHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
  sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
  sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  return _result;
}

CategoryQueryArea sdkSearchCategoryqueryAreaFromFfi(Pointer<Void> handle) {
  final _areaCenterHandle = _sdkSearchCategoryqueryAreaGetFieldareaCenter(handle);
  final _boxAreaHandle = _sdkSearchCategoryqueryAreaGetFieldboxArea(handle);
  final _circleAreaHandle = _sdkSearchCategoryqueryAreaGetFieldcircleArea(handle);
  final _corridorAreaHandle = _sdkSearchCategoryqueryAreaGetFieldcorridorArea(handle);
  try {
    return CategoryQueryArea._(
      sdkCoreGeocoordinatesFromFfi(_areaCenterHandle), 
      sdkCoreGeoboxFromFfiNullable(_boxAreaHandle), 
      sdkCoreGeocircleFromFfiNullable(_circleAreaHandle), 
      sdkCoreGeocorridorFromFfiNullable(_corridorAreaHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
    sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  }
}

void sdkSearchCategoryqueryAreaReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchCategoryqueryAreaReleaseHandle(handle);

// Nullable CategoryQueryArea

final _sdkSearchCategoryqueryAreaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_create_handle_nullable'));
final _sdkSearchCategoryqueryAreaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_release_handle_nullable'));
final _sdkSearchCategoryqueryAreaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_value_nullable'));

Pointer<Void> sdkSearchCategoryqueryAreaToFfiNullable(CategoryQueryArea? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchCategoryqueryAreaToFfi(value);
  final result = _sdkSearchCategoryqueryAreaCreateHandleNullable(_handle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_handle);
  return result;
}

CategoryQueryArea? sdkSearchCategoryqueryAreaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchCategoryqueryAreaGetValueNullable(handle);
  final result = sdkSearchCategoryqueryAreaFromFfi(_handle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchCategoryqueryAreaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchCategoryqueryAreaReleaseHandleNullable(handle);

// End of CategoryQueryArea "private" section.

// CategoryQuery "private" section, not exported.

final _sdkSearchCategoryqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle'));
final _sdkSearchCategoryqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle'));
final _sdkSearchCategoryqueryGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_categories'));
final _sdkSearchCategoryqueryGetFieldexcludeCategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_excludeCategories'));
final _sdkSearchCategoryqueryGetFieldfilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_filter'));
final _sdkSearchCategoryqueryGetFieldarea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_area'));
final _sdkSearchCategoryqueryGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_areaCenter'));
final _sdkSearchCategoryqueryGetFieldboxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_boxArea'));
final _sdkSearchCategoryqueryGetFieldcircleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_circleArea'));
final _sdkSearchCategoryqueryGetFieldcorridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_corridorArea'));



/// @nodoc
@visibleForTesting
class CategoryQuery$Impl {
  CategoryQuery withCategoryInArea(PlaceCategory category, CategoryQueryArea area) {
    final _withCategoryInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_Area'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoryInAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoriesInArea(List<PlaceCategory> categories, CategoryQueryArea area) {
    final _withCategoriesInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_Area'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoriesInAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilterInArea(PlaceCategory category, String filter, CategoryQueryArea area) {
    final _withCategoryAndFilterInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_Area'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoryAndFilterInAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoriesAndFilterInArea(List<PlaceCategory> categories, String filter, CategoryQueryArea area) {
    final _withCategoriesAndFilterInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_Area'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoriesAndFilterInAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withFilter(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter) {
    final _withFilterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_GeoCoordinates'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withFilterFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilter(PlaceCategory category, String filter, GeoCoordinates areaCenter) {
    final _withCategoryAndFilterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCategoryAndFilterFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery $init(List<PlaceCategory> categories, GeoCoordinates areaCenter) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_GeoCoordinates'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategory(PlaceCategory category, GeoCoordinates areaCenter) {
    final _withCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCategoryFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery nearCenterInBoxArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _nearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_GeoCoordinates_GeoBox'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _nearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle, _boxAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withFilterNearCenterInBoxArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withFilterNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_GeoCoordinates_GeoBox'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withFilterNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle, _boxAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryNearCenterInBoxArea(PlaceCategory category, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withCategoryNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates_GeoBox'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withCategoryNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle, _boxAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilterNearCenterInBoxArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withCategoryAndFilterNearCenterInBoxAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates_GeoBox'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withCategoryAndFilterNearCenterInBoxAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle, _boxAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery nearCenterInCircleArea(List<PlaceCategory> categories, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _nearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_GeoCoordinates_GeoCircle'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _nearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaCenterHandle, _circleAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withFilterNearCenterInCircleArea(List<PlaceCategory> categories, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withFilterNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_GeoCoordinates_GeoCircle'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withFilterNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaCenterHandle, _circleAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryNearCenterInCircleArea(PlaceCategory category, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCategoryNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCoordinates_GeoCircle'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCategoryNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaCenterHandle, _circleAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilterNearCenterInCircleArea(PlaceCategory category, String filter, GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCategoryAndFilterNearCenterInCircleAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCoordinates_GeoCircle'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCategoryAndFilterNearCenterInCircleAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaCenterHandle, _circleAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCorridorArea(List<PlaceCategory> categories, GeoCorridor corridorArea) {
    final _withCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_GeoCorridor'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _corridorAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndCorridorArea(PlaceCategory category, GeoCorridor corridorArea) {
    final _withCategoryAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_GeoCorridor'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCategoryAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _corridorAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withFilterAndCorridorArea(List<PlaceCategory> categories, String filter, GeoCorridor corridorArea) {
    final _withFilterAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_GeoCorridor'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withFilterAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _corridorAreaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilterAndCorridorArea(PlaceCategory category, String filter, GeoCorridor corridorArea) {
    final _withCategoryAndFilterAndCorridorAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_GeoCorridor'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCategoryAndFilterAndCorridorAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _corridorAreaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withExcludeCategories(CategoryQuery $that, List<PlaceCategory> categories) {
    final _withExcludeCategoriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_withExcludeCategories__ListOf_sdk_search_PlaceCategory'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _handle = sdkSearchCategoryqueryToFfi($that);
    final __resultHandle = _withExcludeCategoriesFfi(_handle, __lib.LibraryContext.isolateId, _categoriesHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_handle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchCategoryqueryToFfi(CategoryQuery value) {
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _excludeCategoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.excludeCategories);
  final _filterHandle = stringToFfiNullable(value.filter);
  final _areaHandle = sdkSearchCategoryqueryAreaToFfi(value.area);
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(value.areaCenter);
  final _boxAreaHandle = sdkCoreGeoboxToFfiNullable(value.boxArea);
  final _circleAreaHandle = sdkCoreGeocircleToFfiNullable(value.circleArea);
  final _corridorAreaHandle = sdkCoreGeocorridorToFfiNullable(value.corridorArea);
  final _result = _sdkSearchCategoryqueryCreateHandle(_categoriesHandle, _excludeCategoriesHandle, _filterHandle, _areaHandle, _areaCenterHandle, _boxAreaHandle, _circleAreaHandle, _corridorAreaHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_excludeCategoriesHandle);
  stringReleaseFfiHandleNullable(_filterHandle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
  sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
  sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  return _result;
}

CategoryQuery sdkSearchCategoryqueryFromFfi(Pointer<Void> handle) {
  final _categoriesHandle = _sdkSearchCategoryqueryGetFieldcategories(handle);
  final _excludeCategoriesHandle = _sdkSearchCategoryqueryGetFieldexcludeCategories(handle);
  final _filterHandle = _sdkSearchCategoryqueryGetFieldfilter(handle);
  final _areaHandle = _sdkSearchCategoryqueryGetFieldarea(handle);
  final _areaCenterHandle = _sdkSearchCategoryqueryGetFieldareaCenter(handle);
  final _boxAreaHandle = _sdkSearchCategoryqueryGetFieldboxArea(handle);
  final _circleAreaHandle = _sdkSearchCategoryqueryGetFieldcircleArea(handle);
  final _corridorAreaHandle = _sdkSearchCategoryqueryGetFieldcorridorArea(handle);
  try {
    return CategoryQuery._(
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_excludeCategoriesHandle), 
      stringFromFfiNullable(_filterHandle), 
      sdkSearchCategoryqueryAreaFromFfi(_areaHandle), 
      sdkCoreGeocoordinatesFromFfi(_areaCenterHandle), 
      sdkCoreGeoboxFromFfiNullable(_boxAreaHandle), 
      sdkCoreGeocircleFromFfiNullable(_circleAreaHandle), 
      sdkCoreGeocorridorFromFfiNullable(_corridorAreaHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_excludeCategoriesHandle);
    stringReleaseFfiHandleNullable(_filterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
    sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  }
}

void sdkSearchCategoryqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchCategoryqueryReleaseHandle(handle);

// Nullable CategoryQuery

final _sdkSearchCategoryqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle_nullable'));
final _sdkSearchCategoryqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle_nullable'));
final _sdkSearchCategoryqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_value_nullable'));

Pointer<Void> sdkSearchCategoryqueryToFfiNullable(CategoryQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchCategoryqueryToFfi(value);
  final result = _sdkSearchCategoryqueryCreateHandleNullable(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

CategoryQuery? sdkSearchCategoryqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchCategoryqueryGetValueNullable(handle);
  final result = sdkSearchCategoryqueryFromFfi(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchCategoryqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchCategoryqueryReleaseHandleNullable(handle);

// End of CategoryQuery "private" section.


