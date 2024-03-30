// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_verification_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramVerificationDetail _$ProgramVerificationDetailFromJson(
    Map<String, dynamic> json) {
  return _ProgramVerificationDetail.fromJson(json);
}

/// @nodoc
mixin _$ProgramVerificationDetail {
  String get programCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ProgramVerificationContact> get contacts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramVerificationDetailCopyWith<ProgramVerificationDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramVerificationDetailCopyWith<$Res> {
  factory $ProgramVerificationDetailCopyWith(ProgramVerificationDetail value,
          $Res Function(ProgramVerificationDetail) then) =
      _$ProgramVerificationDetailCopyWithImpl<$Res, ProgramVerificationDetail>;
  @useResult
  $Res call(
      {String programCode,
      String message,
      List<ProgramVerificationContact> contacts});
}

/// @nodoc
class _$ProgramVerificationDetailCopyWithImpl<$Res,
        $Val extends ProgramVerificationDetail>
    implements $ProgramVerificationDetailCopyWith<$Res> {
  _$ProgramVerificationDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programCode = null,
    Object? message = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      programCode: null == programCode
          ? _value.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ProgramVerificationContact>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramVerificationDetailImplCopyWith<$Res>
    implements $ProgramVerificationDetailCopyWith<$Res> {
  factory _$$ProgramVerificationDetailImplCopyWith(
          _$ProgramVerificationDetailImpl value,
          $Res Function(_$ProgramVerificationDetailImpl) then) =
      __$$ProgramVerificationDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String programCode,
      String message,
      List<ProgramVerificationContact> contacts});
}

/// @nodoc
class __$$ProgramVerificationDetailImplCopyWithImpl<$Res>
    extends _$ProgramVerificationDetailCopyWithImpl<$Res,
        _$ProgramVerificationDetailImpl>
    implements _$$ProgramVerificationDetailImplCopyWith<$Res> {
  __$$ProgramVerificationDetailImplCopyWithImpl(
      _$ProgramVerificationDetailImpl _value,
      $Res Function(_$ProgramVerificationDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? programCode = null,
    Object? message = null,
    Object? contacts = null,
  }) {
    return _then(_$ProgramVerificationDetailImpl(
      programCode: null == programCode
          ? _value.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ProgramVerificationContact>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramVerificationDetailImpl
    with DiagnosticableTreeMixin
    implements _ProgramVerificationDetail {
  const _$ProgramVerificationDetailImpl(
      {required this.programCode,
      required this.message,
      final List<ProgramVerificationContact> contacts = const []})
      : _contacts = contacts;

  factory _$ProgramVerificationDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgramVerificationDetailImplFromJson(json);

  @override
  final String programCode;
  @override
  final String message;
  final List<ProgramVerificationContact> _contacts;
  @override
  @JsonKey()
  List<ProgramVerificationContact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgramVerificationDetail(programCode: $programCode, message: $message, contacts: $contacts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgramVerificationDetail'))
      ..add(DiagnosticsProperty('programCode', programCode))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('contacts', contacts));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramVerificationDetailImpl &&
            (identical(other.programCode, programCode) ||
                other.programCode == programCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, programCode, message,
      const DeepCollectionEquality().hash(_contacts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramVerificationDetailImplCopyWith<_$ProgramVerificationDetailImpl>
      get copyWith => __$$ProgramVerificationDetailImplCopyWithImpl<
          _$ProgramVerificationDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramVerificationDetailImplToJson(
      this,
    );
  }
}

abstract class _ProgramVerificationDetail implements ProgramVerificationDetail {
  const factory _ProgramVerificationDetail(
          {required final String programCode,
          required final String message,
          final List<ProgramVerificationContact> contacts}) =
      _$ProgramVerificationDetailImpl;

  factory _ProgramVerificationDetail.fromJson(Map<String, dynamic> json) =
      _$ProgramVerificationDetailImpl.fromJson;

  @override
  String get programCode;
  @override
  String get message;
  @override
  List<ProgramVerificationContact> get contacts;
  @override
  @JsonKey(ignore: true)
  _$$ProgramVerificationDetailImplCopyWith<_$ProgramVerificationDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
