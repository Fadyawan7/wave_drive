import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/edit_avatar_bottom_sheet.dart';

class AppFilePicker extends StatefulWidget {
  const AppFilePicker({
    super.key,
    required this.onFileChanged,
    required this.name,
    this.buildUnSelected,
    this.buildSelected,
    this.validator,
  });

  final Function(File file) onFileChanged;
  final String name;
  final Widget Function()? buildUnSelected;
  final Widget Function(File file)? buildSelected;
  final FormFieldValidator<File>? validator;

  @override
  State<AppFilePicker> createState() => _AppFilePickerState();
}

class _AppFilePickerState extends State<AppFilePicker> {
  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<File>(
      name: widget.name,
      validator: widget.validator,
      builder: (field) {
        final hasError = field.errorText != null;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                EditAvatarBottomSheet.show(
                  context,
                  onChoosePhoto: () => _pickImage(ImageSource.gallery, field),
                  onTakePhoto: () => _pickImage(ImageSource.camera, field),
                );
              },
              child: _buildContent(field),
            ),

            if (hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  field.errorText!,
                  style: AppTextStyles.text12.copyWith(color: AppColors.error),
                ),
              ),
          ],
        );
      },
    );
  }

  /// Builds the UI when file is selected or not
  Widget _buildContent(FormFieldState<File?> field) {
    // 👉 If file is selected
    if (_selectedFile != null) {
      if (widget.buildSelected != null) {
        return widget.buildSelected!(_selectedFile!);
      }

      // Default selected UI
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _selectedFile!.path.split('/').last,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever_rounded,
              color: AppColors.blackcolor,
            ),
            onPressed: () {
              setState(() => _selectedFile = null);
              field.didChange(null);
            },
          ),
        ],
      );
    }

    // 👉 When no file is selected
    if (widget.buildUnSelected != null) {
      return widget.buildUnSelected!();
    }

    // Default unselected UI
    return Container(
      height: 31,
      width: 118,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.inputboxcolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 16, color: AppColors.primarycolor),
          const SizedBox(width: 4),
          Text(
            "Upload A File",
            style: AppTextStyles.text12.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  /// Picks image and updates FormBuilder field
  Future<void> _pickImage(
    ImageSource source,
    FormFieldState<File?> field,
  ) async {
    final picker = ImagePicker();
    final xFile = await picker.pickImage(source: source);

    if (xFile == null) return;

    final cropped = await _cropImage(xFile.path);
    if (cropped != null) {
      setState(() => _selectedFile = cropped);
      field.didChange(cropped);
      widget.onFileChanged(cropped);
    }
  }

  /// Crops image using ImageCropper
  Future<File?> _cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop image',
          toolbarColor: AppColors.darkPrimary,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false,
          hideBottomControls: true,
        ),
        IOSUiSettings(title: 'Crop image'),
      ],
    );

    if (croppedFile == null) return null;

    return File(croppedFile.path);
  }
}
