// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_verificaton_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProgramVerificationContact _$ProgramVerificationContactFromJson(
    Map<String, dynamic> json) {
  return _ProgramVerificationContact.fromJson(json);
}

/// @nodoc
mixin _$ProgramVerificationContact {
  String get type => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgramVerificationContactCopyWith<ProgramVerificationContact>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramVerificationContactCopyWith<$Res> {
  factory $ProgramVerificationContactCopyWith(ProgramVerificationContact value,
          $Res Function(ProgramVerificationContact) then) =
      _$ProgramVerificationContactCopyWithImpl<$Res,
          ProgramVerificationContact>;
  @useResult
  $Res call({String type, String contact});
}

/// @nodoc
class _$ProgramVerificationContactCopyWithImpl<$Res,
        $Val extends ProgramVerificationContact>
    implements $ProgramVerificationContactCopyWith<$Res> {
  _$ProgramVerificationContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? contact = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramVerificationContactImplCopyWith<$Res>
    implements $ProgramVerificationContactCopyWith<$Res> {
  factory _$$ProgramVerificationContactImplCopyWith(
          _$ProgramVerificationContactImpl value,
          $Res Function(_$ProgramVerificationContactImpl) then) =
      __$$ProgramVerificationContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String contact});
}

/// @nodoc
class __$$ProgramVerificationContactImplCopyWithImpl<$Res>
    extends _$ProgramVerificationContactCopyWithImpl<$Res,
        _$ProgramVerificationContactImpl>
    implements _$$ProgramVerificationContactImplCopyWith<$Res> {
  __$$ProgramVerificationContactImplCopyWithImpl(
      _$ProgramVerificationContactImpl _value,
      $Res Function(_$ProgramVerificationContactImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? contact = null,
  }) {
    return _then(_$ProgramVerificationContactImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgramVerificationContactImpl
    with DiagnosticableTreeMixin
    implements _ProgramVerificationContact {
  const _$ProgramVerificationContactImpl(
      {required this.type, required this.contact});

  factory _$ProgramVerificationContactImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProgramVerificationContactImplFromJson(json);

  @override
  final String type;
  @override
  final String contact;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgramVerificationContact(type: $type, contact: $contact)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgramVerificationContact'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('contact', contact));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramVerificationContactImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.contact, contact) || other.contact == contact));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, contact);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramVerificationContactImplCopyWith<_$ProgramVerificationContactImpl>
      get copyWith => __$$ProgramVerificationContactImplCopyWithImpl<
          _$ProgramVerificationContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgramVerificationContactImplToJson(
      this,
    );
  }
}

abstract class _ProgramVerificationContact
    implements ProgramVerificationContact {
  const factory _ProgramVerificationContact(
      {required final String type,
      required final String contact}) = _$ProgramVerificationContactImpl;

  factory _ProgramVerificationContact.fromJson(Map<String, dynamic> json) =
      _$ProgramVerificationContactImpl.fromJson;

  @override
  String get type;
  @override
  String get contact;
  @override
  @JsonKey(ignore: true)
  _$$ProgramVerificationContactImplCopyWith<_$ProgramVerificationContactImpl>
      get copyWith => throw _privateConstructorUsedError;
}
