import 'package:flutter/material.dart';

/// The InputField for the Create and Edit a Target forms
Widget targetNameInput(TextEditingController targetNameController) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child:
    new TextFormField(
      controller: targetNameController,
      decoration: new InputDecoration(
        labelText: "Pick a name for your target",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25),
          borderSide: new BorderSide(
          ),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: (val) {
        if(val.length==0) {
          return 'Target name cannot be empty';
        }else{
          return null;
        }
      },
      style: new TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 24,
      ),
    ),
  );
}