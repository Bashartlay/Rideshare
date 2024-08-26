import 'package:flutter/material.dart';
import 'package:rideshare/resources/app_assets.dart';
import 'package:rideshare/resources/app_colors.dart';

abstract class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomTextField({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class PrimaryTextField extends CustomTextField {
  final bool obscureText;

  PrimaryTextField({
    required TextEditingController controller,
    required String hintText,
    this.obscureText = false,
  }) : super(controller: controller, hintText: hintText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText, 
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.griyColor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final List<String> countryCodes;
  final String initialCountryCode;

  const PhoneNumberField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.countryCodes,
    required this.initialCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    String selectedCountryCode = initialCountryCode;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD0D0D0), width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: DropdownButton<String>(
              value: selectedCountryCode,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  selectedCountryCode = newValue;
                }
              },
              items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      // Image.network(
                      //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxECwgtGSw7Mt0eODEF53rZuI2TjfY40DGqA&s',
                      Image.asset(
                        AppAssets.syria,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              underline: Container(),
            ),
          ),
          const VerticalDivider(
            color: Color(0xffD0D0D0),
            thickness: 1,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlexibleTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final bool isSearchField;
  final IconData? prefixIcon;

  FlexibleTextField({
    required this.controller,
    required this.hintText,
    this.isPasswordField = false,
    this.isSearchField = false,
    this.prefixIcon,
  });

  @override
  _FlexibleTextFieldState createState() => _FlexibleTextFieldState();
}

class _FlexibleTextFieldState extends State<FlexibleTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.griyColor),
        prefixIcon: widget.isSearchField
            ? const Icon(Icons.search, color: AppColors.griyColor)
            : widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: AppColors.griyColor)
                : null,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.griyColor),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD0D0D0),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xffD0D0D0),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  final String hintText;
  final List<String> options;
  String? initialValue;

  DropdownField({
    super.key,
    required this.hintText,
    required this.options,
    this.initialValue,
    // required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: options.contains(initialValue) ? initialValue : null,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffD0D0D0),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffD0D0D0),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      onChanged: (val) {
        initialValue = val;
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class CustTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;

  CustTextField({
    required this.controller,
    required this.hintText,
    this.width = double.infinity,
    this.height = 118.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
