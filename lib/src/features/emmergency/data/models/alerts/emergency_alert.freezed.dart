// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmergencyAlert _$EmergencyAlertFromJson(Map<String, dynamic> json) {
  return _EmergencyAlert.fromJson(json);
}

/// @nodoc
mixin _$EmergencyAlert {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  SupportService? get supportService => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<EmergencyResponse> get responses => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyAlertCopyWith<EmergencyAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyAlertCopyWith<$Res> {
  factory $EmergencyAlertCopyWith(
          EmergencyAlert value, $Res Function(EmergencyAlert) then) =
      _$EmergencyAlertCopyWithImpl<$Res, EmergencyAlert>;
  @useResult
  $Res call(
      {String? id,
      String title,
      List<String> images,
      Location location,
      String? description,
      SupportService? supportService,
      User user,
      List<EmergencyResponse> responses,
      String createdAt,
      String updatedAt});

  $LocationCopyWith<$Res> get location;
  $SupportServiceCopyWith<$Res>? get supportService;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$EmergencyAlertCopyWithImpl<$Res, $Val extends EmergencyAlert>
    implements $EmergencyAlertCopyWith<$Res> {
  _$EmergencyAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? images = null,
    Object? location = null,
    Object? description = freezed,
    Object? supportService = freezed,
    Object? user = null,
    Object? responses = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      supportService: freezed == supportService
          ? _value.supportService
          : supportService // ignore: cast_nullable_to_non_nullable
              as SupportService?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      responses: null == responses
          ? _value.responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<EmergencyResponse>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SupportServiceCopyWith<$Res>? get supportService {
    if (_value.supportService == null) {
      return null;
    }

    return $SupportServiceCopyWith<$Res>(_value.supportService!, (value) {
      return _then(_value.copyWith(supportService: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmergencyAlertImplCopyWith<$Res>
    implements $EmergencyAlertCopyWith<$Res> {
  factory _$$EmergencyAlertImplCopyWith(_$EmergencyAlertImpl value,
          $Res Function(_$EmergencyAlertImpl) then) =
      __$$EmergencyAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      List<String> images,
      Location location,
      String? description,
      SupportService? supportService,
      User user,
      List<EmergencyResponse> responses,
      String createdAt,
      String updatedAt});

  @override
  $LocationCopyWith<$Res> get location;
  @override
  $SupportServiceCopyWith<$Res>? get supportService;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$EmergencyAlertImplCopyWithImpl<$Res>
    extends _$EmergencyAlertCopyWithImpl<$Res, _$EmergencyAlertImpl>
    implements _$$EmergencyAlertImplCopyWith<$Res> {
  __$$EmergencyAlertImplCopyWithImpl(
      _$EmergencyAlertImpl _value, $Res Function(_$EmergencyAlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? images = null,
    Object? location = null,
    Object? description = freezed,
    Object? supportService = freezed,
    Object? user = null,
    Object? responses = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EmergencyAlertImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      supportService: freezed == supportService
          ? _value.supportService
          : supportService // ignore: cast_nullable_to_non_nullable
              as SupportService?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      responses: null == responses
          ? _value._responses
          : responses // ignore: cast_nullable_to_non_nullable
              as List<EmergencyResponse>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyAlertImpl
    with DiagnosticableTreeMixin
    implements _EmergencyAlert {
  const _$EmergencyAlertImpl(
      {this.id,
      required this.title,
      final List<String> images = const [],
      required this.location,
      this.description,
      this.supportService,
      required this.user,
      final List<EmergencyResponse> responses = const [],
      required this.createdAt,
      required this.updatedAt})
      : _images = images,
        _responses = responses;

  factory _$EmergencyAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyAlertImplFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final Location location;
  @override
  final String? description;
  @override
  final SupportService? supportService;
  @override
  final User user;
  final List<EmergencyResponse> _responses;
  @override
  @JsonKey()
  List<EmergencyResponse> get responses {
    if (_responses is EqualUnmodifiableListView) return _responses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responses);
  }

  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmergencyAlert(id: $id, title: $title, images: $images, location: $location, description: $description, supportService: $supportService, user: $user, responses: $responses, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmergencyAlert'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('supportService', supportService))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('responses', responses))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.supportService, supportService) ||
                other.supportService == supportService) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._responses, _responses) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      const DeepCollectionEquality().hash(_images),
      location,
      description,
      supportService,
      user,
      const DeepCollectionEquality().hash(_responses),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyAlertImplCopyWith<_$EmergencyAlertImpl> get copyWith =>
      __$$EmergencyAlertImplCopyWithImpl<_$EmergencyAlertImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyAlertImplToJson(
      this,
    );
  }
}

abstract class _EmergencyAlert implements EmergencyAlert {
  const factory _EmergencyAlert(
      {final String? id,
      required final String title,
      final List<String> images,
      required final Location location,
      final String? description,
      final SupportService? supportService,
      required final User user,
      final List<EmergencyResponse> responses,
      required final String createdAt,
      required final String updatedAt}) = _$EmergencyAlertImpl;

  factory _EmergencyAlert.fromJson(Map<String, dynamic> json) =
      _$EmergencyAlertImpl.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  List<String> get images;
  @override
  Location get location;
  @override
  String? get description;
  @override
  SupportService? get supportService;
  @override
  User get user;
  @override
  List<EmergencyResponse> get responses;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyAlertImplCopyWith<_$EmergencyAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
