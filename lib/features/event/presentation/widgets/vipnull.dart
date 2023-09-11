import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components.dart';

class VIPisNull extends StatelessWidget {
  const VIPisNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Components.defaulttext(text: AppStringTrans(context).vip),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Components.defaulttext(
                  text: AppStringTrans(context).vipnull,
                  size: 16,
                  textAlign: TextAlign.center,
                  color: AppColors.primercolor,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
