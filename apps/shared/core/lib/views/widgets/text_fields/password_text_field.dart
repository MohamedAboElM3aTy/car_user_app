import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'text_field_container.dart';

class PasswordTextField extends StatefulWidget {
  final FormFieldValidator<String> validator;
  final Function(String) onTap;
  final TextEditingController controller;
  final FocusNode focusNode;

  const PasswordTextField({
    required this.onTap,
    required this.validator,
    required this.controller,
    required this.focusNode,
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  void _toggleObscure() => setState(() => _isObscure = !_isObscure);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: false,
        onChanged: widget.onTap,
        validator: widget.validator,
        textInputAction: TextInputAction.done,
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: context.primaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: context.primaryColor,
            ),
            onPressed: _toggleObscure,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
