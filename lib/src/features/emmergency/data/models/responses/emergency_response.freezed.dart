// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmergencyResponse _$EmergencyResponseFromJson(Map<String, dynamic> json) {
  return _EmergencyResponse.fromJson(json);
}

/// @nodoc
mixin _$EmergencyResponse {
  String? get id => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get complete => throw _privateConstructorUsedError;
  String get responderName => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmergencyResponseCopyWith<EmergencyResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyResponseCopyWith<$Res> {
  factory $EmergencyResponseCopyWith(
          EmergencyResponse value, $Res Function(EmergencyResponse) then) =
      _$EmergencyResponseCopyWithImpl<$Res, EmergencyResponse>;
  @useResult
  $Res call(
      {String? id,
      List<String> images,
      String? description,
      bool complete,
      String responderName,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$EmergencyResponseCopyWithImpl<$Res, $Val extends EmergencyResponse>
    implements $EmergencyResponseCopyWith<$Res> {
  _$EmergencyResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = null,
    Object? description = freezed,
    Object? complete = null,
    Object? responderName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      responderName: null == responderName
          ? _value.responderName
          : responderName // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$EmergencyResponseImplCopyWith<$Res>
    implements $EmergencyResponseCopyWith<$Res> {
  factory _$$EmergencyResponseImplCopyWith(_$EmergencyResponseImpl value,
          $Res Function(_$EmergencyResponseImpl) then) =
      __$$EmergencyResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      List<String> images,
      String? description,
      bool complete,
      String responderName,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$EmergencyResponseImplCopyWithImpl<$Res>
    extends _$EmergencyResponseCopyWithImpl<$Res, _$EmergencyResponseImpl>
    implements _$$EmergencyResponseImplCopyWith<$Res> {
  __$$EmergencyResponseImplCopyWithImpl(_$EmergencyResponseImpl _value,
      $Res Function(_$EmergencyResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = null,
    Object? description = freezed,
    Object? complete = null,
    Object? responderName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EmergencyResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      complete: null == complete
          ? _value.complete
          : complete // ignore: cast_nullable_to_non_nullable
              as bool,
      responderName: null == responderName
          ? _value.responderName
          : responderName // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$EmergencyResponseImpl implements _EmergencyResponse {
  const _$EmergencyResponseImpl(
      {this.id,
      final List<String> images = const [],
      this.description,
      required this.complete,
      required this.responderName,
      required this.createdAt,
      required this.updatedAt})
      : _images = images;

  factory _$EmergencyResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyResponseImplFromJson(json);

  @override
  final String? id;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String? description;
  @override
  final bool complete;
  @override
  final String responderName;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'EmergencyResponse(id: $id, images: $images, description: $description, complete: $complete, responderName: $responderName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.complete, complete) ||
                other.complete == complete) &&
            (identical(other.responderName, responderName) ||
                other.responderName == responderName) &&
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
      const DeepCollectionEquality().hash(_images),
      description,
      complete,
      responderName,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyResponseImplCopyWith<_$EmergencyResponseImpl> get copyWith =>
      __$$EmergencyResponseImplCopyWithImpl<_$EmergencyResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyResponseImplToJson(
      this,
    );
  }
}

abstract class _EmergencyResponse implements EmergencyResponse {
  const factory _EmergencyResponse(
      {final String? id,
      final List<String> images,
      final String? description,
      required final bool complete,
      required final String responderName,
      required final String createdAt,
      required final String updatedAt}) = _$EmergencyResponseImpl;

  factory _EmergencyResponse.fromJson(Map<String, dynamic> json) =
      _$EmergencyResponseImpl.fromJson;

  @override
  String? get id;
  @override
  List<String> get images;
  @override
  String? get description;
  @override
  bool get complete;
  @override
  String get responderName;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EmergencyResponseImplCopyWith<_$EmergencyResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
