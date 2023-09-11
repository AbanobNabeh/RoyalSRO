import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:darksro/features/home/presentation/pages/paymentscreen.dart';
import 'package:flutter/material.dart';

Widget BuyDP(BuildContext context, GlobalKey<ScaffoldState> scaffoldState) {
  return Column(
    children: [
      itemlist(
          context: context,
          Qn: 100,
          price: 100,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemlist(
          context: context,
          Qn: 200,
          price: 200,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemlist(
          context: context,
          Qn: 500,
          price: 500,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemlist(
          context: context,
          Qn: 1000,
          price: 1000,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemlist(
          context: context,
          Qn: 3000,
          price: 3000,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemlist(
          context: context,
          Qn: 5000,
          price: 5000,
          ontap: () {},
          scaffoldState: scaffoldState),
    ],
  );
}

Widget SellDP(BuildContext context, GlobalKey<ScaffoldState> scaffoldState,
    HomeState state) {
  return Column(
    children: [
      itemselllist(
        context: context,
        Qn: 100,
        price: 85,
        ontap: () {},
        scaffoldState: scaffoldState,
        state: state,
      ),
      SizedBox(
        height: 12,
      ),
      itemselllist(
          context: context,
          Qn: 200,
          price: 170,
          ontap: () {},
          state: state,
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemselllist(
          context: context,
          Qn: 500,
          price: 425,
          state: state,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemselllist(
          context: context,
          Qn: 1000,
          price: 850,
          state: state,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemselllist(
          context: context,
          Qn: 3000,
          price: 2550,
          state: state,
          ontap: () {},
          scaffoldState: scaffoldState),
      SizedBox(
        height: 12,
      ),
      itemselllist(
          context: context,
          Qn: 5000,
          state: state,
          price: 4250,
          ontap: () {},
          scaffoldState: scaffoldState),
    ],
  );
}

Widget itemlist(
    {required BuildContext context,
    required int Qn,
    required int price,
    required Function() ontap,
    required GlobalKey<ScaffoldState> scaffoldState}) {
  return Hero(
    tag: Qn,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secblack,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components.defaulttext(
                      text: '${Qn} ${AppStringTrans(context).darkpoint}',
                      fontWeight: FontWeight.bold,
                      color: AppColors.primercolor),
                  Components.defaulttext(
                      text: '${price} ${AppStringTrans(context).le}'),
                ],
              ),
            ),
            Expanded(
                child: Components.defaultbutton(
                    text: AppStringTrans(context).buy,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                                {'darkpoint': Qn, "price": price}),
                          ));
                    },
                    boxShadow: 0))
          ],
        ),
      ),
    ),
  );
}

Widget itemselllist(
    {required BuildContext context,
    required int Qn,
    required int price,
    required Function() ontap,
    required GlobalKey<ScaffoldState> scaffoldState,
    required HomeState state}) {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.secblack,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Components.defaulttext(
                    text: '${Qn} ${AppStringTrans(context).darkpoint}',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primercolor),
                Components.defaulttext(
                    text: '${price} ${AppStringTrans(context).le}'),
              ],
            ),
          ),
          Expanded(
              child: Components.defaultbutton(
                  text: AppStringTrans(context).sell,
                  ontap: () {
                    scaffoldState.currentState!.showBottomSheet((context) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.secblack),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Components.defaulttext(
                                                text:
                                                    '${Qn} ${AppStringTrans(context).darkpoint}',
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primercolor),
                                            Components.defaulttext(
                                                text:
                                                    '${price} ${AppStringTrans(context).le}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Form(
                                key: formstate,
                                child: Components.defaultform(
                                    controller:
                                        HomeCubit.get(context).phonenumbersell,
                                    textInputType: TextInputType.phone,
                                    validator: (value) {
                                      String pattern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = new RegExp(pattern);
                                      if (value!.length == 0) {
                                        return AppStringTrans(context)
                                            .phonenumber;
                                      } else if (!regExp.hasMatch(value)) {
                                        return AppStringTrans(context)
                                            .phonenumber;
                                      }
                                      return null;
                                    },
                                    hint: AppStringTrans(context).phonenumber),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Components.defaulttext(
                                  text: AppStringTrans(context).noticsell,
                                  color: AppColors.error,
                                  size: 16),
                              SizedBox(
                                height: 15,
                              ),
                              Components.defaultbutton(
                                  isload: state is SellDarkPointLoading,
                                  boxShadow: 0,
                                  text: AppStringTrans(context).confirm,
                                  ontap: () {
                                    if (formstate.currentState!.validate()) {
                                      HomeCubit.get(context).sell(
                                          dpcount: Qn.toString(),
                                          le: price.toString(),
                                          context: context);
                                    }
                                  })
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  boxShadow: 0))
        ],
      ),
    ),
  );
}
