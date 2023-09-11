import 'package:darksro/core/components/app_components.dart';
import 'package:flutter/material.dart';

class updatemsg extends StatelessWidget {
  String msg;
  updatemsg(this.msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Components.defaulttext(text: msg),
      ),
    );
  }
}
