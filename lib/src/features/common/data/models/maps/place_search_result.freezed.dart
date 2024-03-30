// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceSearchResult _$PlaceSearchResultFromJson(Map<String, dynamic> json) {
  return _PlaceSearchResult.fromJson(json);
}

/// @nodoc
mixin _$PlaceSearchResult {
  String get display => throw _privateConstructorUsedError;
  Coordinate get coordinates => throw _privateConstructorUsedError;
  Property get properties => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceSearchResultCopyWith<PlaceSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceSearchResultCopyWith<$Res> {
  factory $PlaceSearchResultCopyWith(
          PlaceSearchResult value, $Res Function(PlaceSearchResult) then) =
      _$PlaceSearchResultCopyWithImpl<$Res, PlaceSearchResult>;
  @useResult
  $Res call(
      {String display,
      Coordinate coordinates,
      Property properties,
      String? name});

  $CoordinateCopyWith<$Res> get coordinates;
  $PropertyCopyWith<$Res> get properties;
}

/// @nodoc
class _$PlaceSearchResultCopyWithImpl<$Res, $Val extends PlaceSearchResult>
    implements $PlaceSearchResultCopyWith<$Res> {
  _$PlaceSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
    Object? coordinates = null,
    Object? properties = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Property,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinateCopyWith<$Res> get coordinates {
    return $CoordinateCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res> get properties {
    return $PropertyCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceSearchResultImplCopyWith<$Res>
    implements $PlaceSearchResultCopyWith<$Res> {
  factory _$$PlaceSearchResultImplCopyWith(_$PlaceSearchResultImpl value,
          $Res Function(_$PlaceSearchResultImpl) then) =
      __$$PlaceSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String display,
      Coordinate coordinates,
      Property properties,
      String? name});

  @override
  $CoordinateCopyWith<$Res> get coordinates;
  @override
  $PropertyCopyWith<$Res> get properties;
}

/// @nodoc
class __$$PlaceSearchResultImplCopyWithImpl<$Res>
    extends _$PlaceSearchResultCopyWithImpl<$Res, _$PlaceSearchResultImpl>
    implements _$$PlaceSearchResultImplCopyWith<$Res> {
  __$$PlaceSearchResultImplCopyWithImpl(_$PlaceSearchResultImpl _value,
      $Res Function(_$PlaceSearchResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
    Object? coordinates = null,
    Object? properties = null,
    Object? name = freezed,
  }) {
    return _then(_$PlaceSearchResultImpl(
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinate,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Property,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceSearchResultImpl
    with DiagnosticableTreeMixin
    implements _PlaceSearchResult {
  const _$PlaceSearchResultImpl(
      {required this.display,
      required this.coordinates,
      required this.properties,
      this.name});

  factory _$PlaceSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceSearchResultImplFromJson(json);

  @override
  final String display;
  @override
  final Coordinate coordinates;
  @override
  final Property properties;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlaceSearchResult(display: $display, coordinates: $coordinates, properties: $properties, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlaceSearchResult'))
      ..add(DiagnosticsProperty('display', display))
      ..add(DiagnosticsProperty('coordinates', coordinates))
      ..add(DiagnosticsProperty('properties', properties))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceSearchResultImpl &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, display, coordinates, properties, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceSearchResultImplCopyWith<_$PlaceSearchResultImpl> get copyWith =>
      __$$PlaceSearchResultImplCopyWithImpl<_$PlaceSearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceSearchResultImplToJson(
      this,
    );
  }
}

abstract class _PlaceSearchResult implements PlaceSearchResult {
  const factory _PlaceSearchResult(
      {required final String display,
      required final Coordinate coordinates,
      required final Property properties,
      final String? name}) = _$PlaceSearchResultImpl;

  factory _PlaceSearchResult.fromJson(Map<String, dynamic> json) =
      _$PlaceSearchResultImpl.fromJson;

  @override
  String get display;
  @override
  Coordinate get coordinates;
  @override
  Property get properties;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$PlaceSearchResultImplCopyWith<_$PlaceSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
