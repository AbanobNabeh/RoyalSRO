import 'package:darksro/config/network/url.dart';
import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_size.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/Auth/data/models/ModelChar.dart';
import 'package:darksro/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCharScreen extends StatelessWidget {
  String jid;
  SelectCharScreen(this.jid);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..getallchar(jid),
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Components.defaulttext(
                  text: AppStringTrans(context).selectchar),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: state is SelectCharLoading
                    ? Components.loadingwidget()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  cubit.showconfbtn();
                                  cubit.char = cubit.Chars[index].charID;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: cubit.char ==
                                              cubit.Chars[index].charID
                                          ? AppColors.primercolor
                                          : AppColors.secblack),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Components.defchachedimg(
                                                "${AppUrl.CharIMg}${cubit.Chars[index].refObjID}.gif")),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Components.defaulttext(
                                            text:
                                                "${cubit.Chars[index].charName16!} ",
                                            size: 14),
                                        Components.defaulttext(
                                            text:
                                                "[LVL ${cubit.Chars[index].curLevel}]",
                                            size: 12)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: cubit.Chars.length,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                  activeColor: AppColors.primercolor,
                                  focusColor: AppColors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => AppColors.primercolor),
                                  value: cubit.savechar,
                                  onChanged: (value) {
                                    cubit.charsave(value!);
                                  }),
                              Components.defaulttext(
                                  text: AppStringTrans(context).savechar,
                                  size: 18)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            child: Components.defaultbutton(
                                text: AppStringTrans(context).confirm,
                                ontap: () => cubit.confselect(context)),
                            visible: cubit.char != null ? true : false,
                          )
                        ],
                      ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
/*

DropdownButtonFormField(
                            hint: Components.defaulttext(
                                text: AppStringTrans(context).noselect),
                            dropdownColor: AppColors.secblack,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primercolor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primercolor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.white, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: AppColors.secblack,
                            ),
                            items: cubit.Chars.map<DropdownMenuItem<String>>(
                                (ModelChar value) {
                              return DropdownMenuItem<String>(
                                value: value.charID,
                                child: Components.defaulttext(
                                    text:
                                        "${value.charName16!} [LVL ${value.curLevel}]",
                                    size: 16),
                              );
                            }).toList(),
                            value: cubit.char,
                            onChanged: (String? value) {
                              cubit.showconfbtn();
                              cubit.char = value;
                            },
                          ),
                          
 */