// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/utils/date_time_format.dart';

mixin FormMixin {
  static const passwordPattern =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  final formKey = GlobalKey<FormBuilderState>();

  final requiredValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final countryValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final passwordValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final avatarValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final nicknameValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final birthdayValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    (val) {
      if (val is String && val.isNotEmpty) {
        final infoDate = val.split('/');
        final ageOfUser =
            double.tryParse(calculateAge(infoDate.reversed.join('-'))) ?? 1;
        if (ageOfUser < minimumAge) {
          return 'Age must be minimum of $minimumAge years';
        }
      }
      return null;
    },
  ]);

  final emailValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    FormBuilderValidators.email(errorText: "Please enter a valid email"),
  ]);

  final phoneValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final genderValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
  ]);

  final confirmPasswordValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    FormBuilderValidators.minLength(
      8,
      errorText: "Contains at least 8 characters",
    ),
    FormBuilderValidators.match(
      RegExp(passwordPattern),
      errorText:
          "Must include an uppercase, lowercase, number & special character (@\$!%*?&).",
    ),
  ]);

  final changePasswordValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    FormBuilderValidators.minLength(
      8,
      errorText: "Contains at least 8 characters",
    ),
    FormBuilderValidators.match(
      RegExp(passwordPattern),
      errorText:
          "Must include an uppercase, lowercase, number & special character (@\$!%*?&).",
    ),
  ]);

  final verifyEmailValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    FormBuilderValidators.email(errorText: ""),
    (val) {
      if (val == null || !val.toString().toLowerCase().endsWith('@gmail.com')) {
        return "Please Enter Valid Email";
      }
      return null;
    },
  ]);

  final inviteIdValidators = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "This field is required"),
    FormBuilderValidators.minLength(
      8,
      errorText: "Contains must be 8 characters",
    ),
  ]);
  final oldPasswordValidator = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "Old password is required"),
    FormBuilderValidators.minLength(
      8,
      errorText: "Password must be at least 8 characters",
    ),
  ]);

  final newPasswordValidator = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "New password is required"),
    FormBuilderValidators.minLength(
      8,
      errorText: "Password must be at least 8 characters",
    ),
    FormBuilderValidators.match(
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$'),
      errorText: "Password must contain at least one letter and one number",
    ),
  ]);

  final confirmPasswordValidator = (String? newPassword) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "This field is required"),
        (value) {
          if (value != newPassword) {
            return "Passwords do not match";
          }
          return null;
        },
      ]);
}
