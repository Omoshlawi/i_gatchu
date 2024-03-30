import 'dart:io';

import 'package:flutter/material.dart';
import 'package:i_gatchu/src/shared/display/AppAvatar.dart';
import 'package:i_gatchu/src/shared/extensions/extensions.dart';
import 'package:i_gatchu/src/utils/helpers.dart';

class UserDrawerHeader extends StatelessWidget {
  final String? email;
  final String name;
  final String phoneNumber;
  final String? image;

  const UserDrawerHeader(
      {super.key,
      this.email,
      required this.name,
      required this.phoneNumber,
      this.image});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DrawerHeader(
      child: Row(
        children: [
          AppAvatar(
            radius: 50,
            image: image,
            alt: Text((name).abbreviation),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        email ?? "None",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      color: theme.colorScheme.onTertiaryContainer,
                      Icons.phone,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        phoneNumber,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

_buildUserImage(String imagePath) {
  return isNetworkUri(imagePath)
      ? NetworkImage(
          imagePath,
        )
      : FileImage(
          File.fromUri(Uri.parse(imagePath)),
        );
}
