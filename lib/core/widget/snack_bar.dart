import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void showSnackBar({required BuildContext context, required String message, String? subMessage
  ,bool top = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    elevation: 20,
    content: subMessage != null ? Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(message),
        Text( subMessage),
      ],
    ) : Text(message),
  ));
}