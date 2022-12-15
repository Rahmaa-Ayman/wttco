import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 50,
      child: Center(
          child: Platform.isIOS ? const CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.light),
            child: CupertinoActivityIndicator(),
          ) : const Center(
              child: CircularProgressIndicator.adaptive()
          )
      ),
    );
  }
}