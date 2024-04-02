import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:i_gatchu/src/shared/exeptions/http_exceptions.dart';
import 'package:url_launcher/url_launcher.dart';


Future<String> loadJsonData(String path) async {
  final String data = await rootBundle.loadString(path);
  return data;
}

bool isNetworkUri(String uri) {
  final imageUri = Uri.parse(uri);
  final schemes = ['http', 'https', 'ftp', 'ftps'];
  return schemes.contains(imageUri.scheme);
}

void handleResponseError(
    BuildContext context,
    Map<String, FormBuilderFieldState<FormBuilderField<dynamic>, dynamic>>
        formState,
    err,
    void Function() onLogout) {
  switch (err) {
    case BadRequestException e:
      for (var err in e.errors.entries) {
        formState[err.key]?.invalidate(err.value);
      }
      break;
    case ResourceNotFoundException e:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
      break;
    case ForbiddenException e:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
      break;
    case UnauthorizedException e:
      onLogout();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
      break;
    case InternalServerErrorException e:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message.toString())),
      );
      break;
    default:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
  }
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(err.toString()),
  //   ),
  // );
}


Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}