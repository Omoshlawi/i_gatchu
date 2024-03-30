import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'announcement.freezed.dart';
part 'announcement.g.dart';

@Freezed()
class Announcement with _$Announcement {
  const factory Announcement({
    String? id,
    required String image,
    required String source,
    required String title,
    String? description,
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, dynamic> json)=> _$AnnouncementFromJson(json);
}