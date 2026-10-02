import 'package:flutter/material.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.controller,
    this.validator,
    required this.labelText,
    this.prefixIcon,
    this.obscureText,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String labelText;
  final Widget? prefixIcon;
  final bool? obscureText;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  bool? isHide;

  @override
  void initState() {
    isHide = widget.obscureText;
    super.initState();
  }

  void changeIsHide() {
    isHide = !(isHide ?? false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHide ?? false,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textInputAction: TextInputAction.next,
      validator: widget.validator,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.grey),
        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: () {
                  changeIsHide();
                },
                child: isHide ?? false
                    ? Icon(Icons.visibility_off, color: Colors.grey)
                    : Icon(Icons.visibility, color: Theme.of(context).colorScheme.primary, size: 30),
              )
            : null,
        prefixIcon: widget.prefixIcon,
        errorStyle: TextStyle(
          fontSize: 12,
          height: 0.9,
          
          fontFamily: 'quiksand',
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
        errorMaxLines: 2,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );
  }
}
