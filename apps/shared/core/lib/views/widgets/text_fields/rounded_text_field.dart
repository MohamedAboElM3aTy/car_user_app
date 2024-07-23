import 'package:core/core.dart';
import 'package:core/views/widgets/text_fields/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator<String> validator;
  final Function(String) changed;
  final TextEditingController controller;
  final bool autoFocus;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final TextStyle? hintStyle;
  final bool? isMap;
  final VoidCallback? onTap;

  const RoundedTextField({
    this.onTap,
    required this.changed,
    required this.validator,
    required this.hintText,
    required this.controller,
    this.icon = Icons.person,
    this.autoFocus = false,
    this.isMap = false,
    this.focusNode,
    this.onEditingComplete,
    this.hintStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onEditingComplete: onEditingComplete,
        autofocus: autoFocus,
        focusNode: focusNode,
        onChanged: changed,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: context.primaryColor,
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
