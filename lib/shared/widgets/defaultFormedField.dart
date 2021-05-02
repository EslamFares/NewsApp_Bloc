import 'package:flutter/material.dart';

Container defaultFormedField({
  @required TextEditingController controller,
  @required Function validator,
  @required String hintText,
  @required Icon prefixIcon,
  TextInputType type,
  Function onTap,
  Function onChange,
  Function onSubmit,
  bool isPassword = false,
  bool readOnly = false,
}) {
  return Container(
    height: 65,
    width: double.infinity,
    child: TextFormField(
      showCursor: true,
      readOnly: readOnly,
      keyboardType: type ?? TextInputType.text,
      obscureText: isPassword,
      controller: controller,
      validator: validator,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      style: TextStyle(color: Colors.blue, fontSize: 20),
      decoration: InputDecoration(
        // fillColor: Colors.red,
        // filled: true,
        contentPadding: EdgeInsets.all(5),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
        enabled: true,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(5.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(5.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    ),
  );
}
