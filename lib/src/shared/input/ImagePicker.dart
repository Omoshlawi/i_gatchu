import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCustomFormField extends FormField<String> {
    final double size;
    final Color backgroundColor;
    final Color iconColor;
    final void Function(String? image)? onImageChange;
    final TextEditingController? controller;
    final String? error;

  ImagePickerCustomFormField(
      {Key? key,
      this.size = 150,
      this.error,
      this.backgroundColor = Colors.grey,
      this.iconColor = Colors.white,
      String? image,
      void Function(String?)? onSave,
      String? Function(String?)? validator,
      this.onImageChange,
      this.controller})
      : super(
          key: key,
          initialValue: image,
          onSaved: onSave,
          validator: validator,
          builder: (FormFieldState<String> state) {
            return Column(
              children: [
                ImagePickerCustom(
                  size: size,
                  backgroundColor: backgroundColor,
                  iconColor: iconColor,
                  image: state.value,
                  controller: controller,
                  onImageChange: (image) {
                    state.didChange(image);
                    if (onImageChange != null) {
                      onImageChange(image);
                    }
                  },
                  onDelete: () {
                    state.didChange(null);
                    controller?.clear();
                    if (onImageChange != null) {
                      onImageChange(null);
                    }
                  },
                ),
                state.hasError || error != null
                    ? Text(
                        state.errorText ?? error ?? "",
                        style: const TextStyle(color: Colors.red),
                      )
                    : Container()
              ],
            );
          },
        );

  @override
  FormFieldState<String> createState() {
    return ImagePickerCustomFormFieldState();
  }
}

class ImagePickerCustomFormFieldState extends FormFieldState<String> {}

class ImagePickerCustom extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final String? image;
  final void Function(String image)? onImageChange;
  final VoidCallback? onDelete;
  final TextEditingController? controller;

  const ImagePickerCustom({
    Key? key,
    this.size = 200,
    this.backgroundColor = Colors.grey,
    this.iconColor = Colors.white,
    this.image,
    this.onImageChange,
    this.onDelete,
    this.controller,
  }) : super(key: key);

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedFile != null) {
      final imageUri = pickedFile.path;
      controller?.text = imageUri;
      if (onImageChange is Function) {
        onImageChange!(imageUri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isNetworkUri(String uri) {
      final imageUri = Uri.parse(uri);
      final schemes = ['http', 'https', 'ftp', 'ftps'];
      return schemes.contains(imageUri.scheme);
    }

    return GestureDetector(
      onTap: image == null
          ? _pickImage
          : () => showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.85,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  if (onDelete != null) {
                                    controller?.clear();
                                    onDelete!();
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: image != null && isNetworkUri(image!)
                                ? Image.network(
                                    image!,
                                    fit: BoxFit.contain,
                                  )
                                : Image.file(
                                    File.fromUri(
                                      Uri.parse(image!),
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            if (image != null)
              Positioned.fill(
                child: image != null && isNetworkUri(image!)
                    ? ClipOval(
                        child: Image.network(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image.file(
                          File.fromUri(
                            Uri.parse(image!),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            if (image == null)
              CircleAvatar(
                radius: size,
                backgroundColor: backgroundColor,
                child: Center(
                  child: Icon(
                    Icons.camera_alt,
                    size: size * 0.75,
                    color: iconColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
