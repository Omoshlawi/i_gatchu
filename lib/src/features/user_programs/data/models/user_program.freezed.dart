// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProgram _$UserProgramFromJson(Map<String, dynamic> json) {
  return _UserProgram.fromJson(json);
}

/// @nodoc
mixin _$UserProgram {
  String? get id => throw _privateConstructorUsedError;
  Program get program => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProgramCopyWith<UserProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgramCopyWith<$Res> {
  factory $UserProgramCopyWith(
          UserProgram value, $Res Function(UserProgram) then) =
      _$UserProgramCopyWithImpl<$Res, UserProgram>;
  @useResult
  $Res call({String? id, Program program, bool isActive, String createdAt});

  $ProgramCopyWith<$Res> get program;
}

/// @nodoc
class _$UserProgramCopyWithImpl<$Res, $Val extends UserProgram>
    implements $UserProgramCopyWith<$Res> {
  _$UserProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? program = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as Program,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgramCopyWith<$Res> get program {
    return $ProgramCopyWith<$Res>(_value.program, (value) {
      return _then(_value.copyWith(program: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProgramImplCopyWith<$Res>
    implements $UserProgramCopyWith<$Res> {
  factory _$$UserProgramImplCopyWith(
          _$UserProgramImpl value, $Res Function(_$UserProgramImpl) then) =
      __$$UserProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, Program program, bool isActive, String createdAt});

  @override
  $ProgramCopyWith<$Res> get program;
}

/// @nodoc
class __$$UserProgramImplCopyWithImpl<$Res>
    extends _$UserProgramCopyWithImpl<$Res, _$UserProgramImpl>
    implements _$$UserProgramImplCopyWith<$Res> {
  __$$UserProgramImplCopyWithImpl(
      _$UserProgramImpl _value, $Res Function(_$UserProgramImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? program = null,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_$UserProgramImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      program: null == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as Program,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgramImpl with DiagnosticableTreeMixin implements _UserProgram {
  const _$UserProgramImpl(
      {this.id,
      required this.program,
      this.isActive = false,
      required this.createdAt});

  factory _$UserProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgramImplFromJson(json);

  @override
  final String? id;
  @override
  final Program program;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProgram(id: $id, program: $program, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProgram'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('program', program))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.program, program) || other.program == program) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, program, isActive, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgramImplCopyWith<_$UserProgramImpl> get copyWith =>
      __$$UserProgramImplCopyWithImpl<_$UserProgramImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgramImplToJson(
      this,
    );
  }
}

abstract class _UserProgram implements UserProgram {
  const factory _UserProgram(
      {final String? id,
      required final Program program,
      final bool isActive,
      required final String createdAt}) = _$UserProgramImpl;

  factory _UserProgram.fromJson(Map<String, dynamic> json) =
      _$UserProgramImpl.fromJson;

  @override
  String? get id;
  @override
  Program get program;
  @override
  bool get isActive;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserProgramImplCopyWith<_$UserProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
