import 'package:flutter/material.dart';
import 'package:vitus_app/ui/common/app_color.dart';

class AppTextfield extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onChange;
  final Function(String?)? onSaved;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final Color disbaleBorderColor;
  final Color focusColor;
  final Color errorBorderColor;
  final bool? enabled;
  final String? hintText;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  const AppTextfield({
    super.key,
    required this.validator,
    required this.controller,
    this.onChange,
    this.onSaved,
    this.borderWidth = 1,
    this.borderRadius = 5.0,
    this.borderColor = const Color(0xff595858),
    this.disbaleBorderColor = const Color(0xffc5c5c5),
    this.errorBorderColor = LightThemeColor.errorColor,
    this.focusColor = LightThemeColor.textFieldFocusedBorderColor,
    this.enabled = true,
    this.hintText,
    this.fillColor,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
        enabled: widget.enabled,
        validator: widget.validator,
        onChanged: widget.onChange,
        onSaved: widget.onSaved,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(
            color: LightThemeColor.textColor,
            decorationThickness: 0,
            decoration: TextDecoration.none),
        decoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.only(start:10),
            isCollapsed: false,
            filled: widget.fillColor == null ? false : true,
            fillColor: widget.fillColor,
            // labelText: "label",
            // labelStyle: TextStyle(
            //   color: Colors.yellow,
            // ),
            // helperText: "helperText",
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: LightThemeColor.hintColor),
            counterText: widget.controller.text.length.toString(),
            errorStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: LightThemeColor.errorColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.focusColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.disbaleBorderColor,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.errorBorderColor,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.errorBorderColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor,
                )),
            prefixIcon: Icon(Icons.account_box, size: 28.0),
            prefixIconColor: widget.prefixIconColor,
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                // IconButton(
                //   icon: Icon(Icons.close),
                //   onPressed: () {
                //     widget.controller.clear();
                //   },
                // ),
                // IconButton(onPressed: () {
                //
                // }, icon: Icon(Icons.send)),
              ],
            ),
          suffixIconColor: widget.suffixIconColor,
        ));

  }
}
