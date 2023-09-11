import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KioskScreen extends StatelessWidget {
  const KioskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(ImgAssets.logo),
            SizedBox(
              height: MediaQueryValues(context).height / 5,
            ),
            Components.defaulttext(
                text: AppStringTrans(context).kiosdes,
                textAlign: TextAlign.center,
                color: AppColors.primercolor),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.secblack),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Components.defaulttext(
                      text: AppString.refcode,
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: AppString.refcode));
                      },
                      icon: Icon(Icons.copy),
                      color: AppColors.primercolor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
