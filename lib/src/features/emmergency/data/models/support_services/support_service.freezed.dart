// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportService _$SupportServiceFromJson(Map<String, dynamic> json) {
  return _SupportService.fromJson(json);
}

/// @nodoc
mixin _$SupportService {
  String? get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportServiceCopyWith<SupportService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportServiceCopyWith<$Res> {
  factory $SupportServiceCopyWith(
          SupportService value, $Res Function(SupportService) then) =
      _$SupportServiceCopyWithImpl<$Res, SupportService>;
  @useResult
  $Res call(
      {String? id,
      String image,
      String name,
      String phoneNumber,
      String email,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$SupportServiceCopyWithImpl<$Res, $Val extends SupportService>
    implements $SupportServiceCopyWith<$Res> {
  _$SupportServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SupportServiceImplCopyWith<$Res>
    implements $SupportServiceCopyWith<$Res> {
  factory _$$SupportServiceImplCopyWith(_$SupportServiceImpl value,
          $Res Function(_$SupportServiceImpl) then) =
      __$$SupportServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String image,
      String name,
      String phoneNumber,
      String email,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$SupportServiceImplCopyWithImpl<$Res>
    extends _$SupportServiceCopyWithImpl<$Res, _$SupportServiceImpl>
    implements _$$SupportServiceImplCopyWith<$Res> {
  __$$SupportServiceImplCopyWithImpl(
      _$SupportServiceImpl _value, $Res Function(_$SupportServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SupportServiceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$SupportServiceImpl
    with DiagnosticableTreeMixin
    implements _SupportService {
  const _$SupportServiceImpl(
      {this.id,
      required this.image,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.createdAt,
      required this.updatedAt});

  factory _$SupportServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportServiceImplFromJson(json);

  @override
  final String? id;
  @override
  final String image;
  @override
  final String name;
  @override
  final String phoneNumber;
  @override
  final String email;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupportService(id: $id, image: $image, name: $name, phoneNumber: $phoneNumber, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SupportService'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportServiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, image, name, phoneNumber, email, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportServiceImplCopyWith<_$SupportServiceImpl> get copyWith =>
      __$$SupportServiceImplCopyWithImpl<_$SupportServiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportServiceImplToJson(
      this,
    );
  }
}

abstract class _SupportService implements SupportService {
  const factory _SupportService(
      {final String? id,
      required final String image,
      required final String name,
      required final String phoneNumber,
      required final String email,
      required final String createdAt,
      required final String updatedAt}) = _$SupportServiceImpl;

  factory _SupportService.fromJson(Map<String, dynamic> json) =
      _$SupportServiceImpl.fromJson;

  @override
  String? get id;
  @override
  String get image;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  String get email;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SupportServiceImplCopyWith<_$SupportServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
