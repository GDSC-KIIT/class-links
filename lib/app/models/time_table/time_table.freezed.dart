// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'time_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeTable _$TimeTableFromJson(Map<String, dynamic> json) {
  return _TimeTable.fromJson(json);
}

/// @nodoc
class _$TimeTableTearOff {
  const _$TimeTableTearOff();

  _TimeTable call(
      {required List<Day> week,
      required String creatorId,
      required String batch,
      required int year,
      required DateTime date}) {
    return _TimeTable(
      week: week,
      creatorId: creatorId,
      batch: batch,
      year: year,
      date: date,
    );
  }

  TimeTable fromJson(Map<String, Object?> json) {
    return TimeTable.fromJson(json);
  }
}

/// @nodoc
const $TimeTable = _$TimeTableTearOff();

/// @nodoc
mixin _$TimeTable {
  List<Day> get week => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  String get batch => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeTableCopyWith<TimeTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeTableCopyWith<$Res> {
  factory $TimeTableCopyWith(TimeTable value, $Res Function(TimeTable) then) =
      _$TimeTableCopyWithImpl<$Res>;
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      DateTime date});
}

/// @nodoc
class _$TimeTableCopyWithImpl<$Res> implements $TimeTableCopyWith<$Res> {
  _$TimeTableCopyWithImpl(this._value, this._then);

  final TimeTable _value;
  // ignore: unused_field
  final $Res Function(TimeTable) _then;

  @override
  $Res call({
    Object? week = freezed,
    Object? creatorId = freezed,
    Object? batch = freezed,
    Object? year = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TimeTableCopyWith<$Res> implements $TimeTableCopyWith<$Res> {
  factory _$TimeTableCopyWith(
          _TimeTable value, $Res Function(_TimeTable) then) =
      __$TimeTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Day> week,
      String creatorId,
      String batch,
      int year,
      DateTime date});
}

/// @nodoc
class __$TimeTableCopyWithImpl<$Res> extends _$TimeTableCopyWithImpl<$Res>
    implements _$TimeTableCopyWith<$Res> {
  __$TimeTableCopyWithImpl(_TimeTable _value, $Res Function(_TimeTable) _then)
      : super(_value, (v) => _then(v as _TimeTable));

  @override
  _TimeTable get _value => super._value as _TimeTable;

  @override
  $Res call({
    Object? week = freezed,
    Object? creatorId = freezed,
    Object? batch = freezed,
    Object? year = freezed,
    Object? date = freezed,
  }) {
    return _then(_TimeTable(
      week: week == freezed
          ? _value.week
          : week // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      batch: batch == freezed
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimeTable implements _TimeTable {
  const _$_TimeTable(
      {required this.week,
      required this.creatorId,
      required this.batch,
      required this.year,
      required this.date});

  factory _$_TimeTable.fromJson(Map<String, dynamic> json) =>
      _$$_TimeTableFromJson(json);

  @override
  final List<Day> week;
  @override
  final String creatorId;
  @override
  final String batch;
  @override
  final int year;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'TimeTable(week: $week, creatorId: $creatorId, batch: $batch, year: $year, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeTable &&
            const DeepCollectionEquality().equals(other.week, week) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(week), creatorId, batch, year, date);

  @JsonKey(ignore: true)
  @override
  _$TimeTableCopyWith<_TimeTable> get copyWith =>
      __$TimeTableCopyWithImpl<_TimeTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimeTableToJson(this);
  }
}

abstract class _TimeTable implements TimeTable {
  const factory _TimeTable(
      {required List<Day> week,
      required String creatorId,
      required String batch,
      required int year,
      required DateTime date}) = _$_TimeTable;

  factory _TimeTable.fromJson(Map<String, dynamic> json) =
      _$_TimeTable.fromJson;

  @override
  List<Day> get week;
  @override
  String get creatorId;
  @override
  String get batch;
  @override
  int get year;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$TimeTableCopyWith<_TimeTable> get copyWith =>
      throw _privateConstructorUsedError;
}

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
class _$DayTearOff {
  const _$DayTearOff();

  _Day call({required String day, required List<Subject> subjects}) {
    return _Day(
      day: day,
      subjects: subjects,
    );
  }

  Day fromJson(Map<String, Object?> json) {
    return Day.fromJson(json);
  }
}

/// @nodoc
const $Day = _$DayTearOff();

/// @nodoc
mixin _$Day {
  String get day => throw _privateConstructorUsedError;
  List<Subject> get subjects => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res>;
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class _$DayCopyWithImpl<$Res> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  final Day _value;
  // ignore: unused_field
  final $Res Function(Day) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
abstract class _$DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$DayCopyWith(_Day value, $Res Function(_Day) then) =
      __$DayCopyWithImpl<$Res>;
  @override
  $Res call({String day, List<Subject> subjects});
}

/// @nodoc
class __$DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res>
    implements _$DayCopyWith<$Res> {
  __$DayCopyWithImpl(_Day _value, $Res Function(_Day) _then)
      : super(_value, (v) => _then(v as _Day));

  @override
  _Day get _value => super._value as _Day;

  @override
  $Res call({
    Object? day = freezed,
    Object? subjects = freezed,
  }) {
    return _then(_Day(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      subjects: subjects == freezed
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<Subject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Day implements _Day {
  const _$_Day({required this.day, required this.subjects});

  factory _$_Day.fromJson(Map<String, dynamic> json) => _$$_DayFromJson(json);

  @override
  final String day;
  @override
  final List<Subject> subjects;

  @override
  String toString() {
    return 'Day(day: $day, subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Day &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(subjects));

  @JsonKey(ignore: true)
  @override
  _$DayCopyWith<_Day> get copyWith =>
      __$DayCopyWithImpl<_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayToJson(this);
  }
}

abstract class _Day implements Day {
  const factory _Day({required String day, required List<Subject> subjects}) =
      _$_Day;

  factory _Day.fromJson(Map<String, dynamic> json) = _$_Day.fromJson;

  @override
  String get day;
  @override
  List<Subject> get subjects;
  @override
  @JsonKey(ignore: true)
  _$DayCopyWith<_Day> get copyWith => throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
class _$SubjectTearOff {
  const _$SubjectTearOff();

  _Subject call(
      {required String subjectName,
      required String remark,
      required DateTime startTime}) {
    return _Subject(
      subjectName: subjectName,
      remark: remark,
      startTime: startTime,
    );
  }

  Subject fromJson(Map<String, Object?> json) {
    return Subject.fromJson(json);
  }
}

/// @nodoc
const $Subject = _$SubjectTearOff();

/// @nodoc
mixin _$Subject {
  String get subjectName => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res>;
  $Res call({String subjectName, String remark, DateTime startTime});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res> implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  final Subject _value;
  // ignore: unused_field
  final $Res Function(Subject) _then;

  @override
  $Res call({
    Object? subjectName = freezed,
    Object? remark = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) then) =
      __$SubjectCopyWithImpl<$Res>;
  @override
  $Res call({String subjectName, String remark, DateTime startTime});
}

/// @nodoc
class __$SubjectCopyWithImpl<$Res> extends _$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(_Subject _value, $Res Function(_Subject) _then)
      : super(_value, (v) => _then(v as _Subject));

  @override
  _Subject get _value => super._value as _Subject;

  @override
  $Res call({
    Object? subjectName = freezed,
    Object? remark = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_Subject(
      subjectName: subjectName == freezed
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subject implements _Subject {
  const _$_Subject(
      {required this.subjectName,
      required this.remark,
      required this.startTime});

  factory _$_Subject.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectFromJson(json);

  @override
  final String subjectName;
  @override
  final String remark;
  @override
  final DateTime startTime;

  @override
  String toString() {
    return 'Subject(subjectName: $subjectName, remark: $remark, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Subject &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjectName, remark, startTime);

  @JsonKey(ignore: true)
  @override
  _$SubjectCopyWith<_Subject> get copyWith =>
      __$SubjectCopyWithImpl<_Subject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectToJson(this);
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {required String subjectName,
      required String remark,
      required DateTime startTime}) = _$_Subject;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$_Subject.fromJson;

  @override
  String get subjectName;
  @override
  String get remark;
  @override
  DateTime get startTime;
  @override
  @JsonKey(ignore: true)
  _$SubjectCopyWith<_Subject> get copyWith =>
      throw _privateConstructorUsedError;
}