import 'dart:io';

import 'package:flutter/material.dart';
import 'package:i_gatchu/src/utils/helpers.dart';

class AppAvatar extends StatelessWidget {
  final String? image;
  final Widget alt;
  final double? radius;

  const AppAvatar({super.key, this.image, required this.alt, this.radius});

  _buildUserImage(String imagePath) {
    return isNetworkUri(imagePath)
        ? NetworkImage(
            imagePath,
          )
        : FileImage(
            File.fromUri(Uri.parse(imagePath)),
          );
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: image != null ? _buildUserImage(image!) : null,
      child: ClipOval(
        child: image == null ? alt : null,
      ),
    );
  }
}
