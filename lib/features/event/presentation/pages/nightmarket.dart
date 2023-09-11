import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/itemnightmarket.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NightMarletScreen extends StatelessWidget {
  var Scaffoldstate = GlobalKey<ScaffoldState>();
  var formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()
        ..getnightmarket(
            minsilk: '1', maxsilk: '999999', minprice: '1', maxprice: '999999'),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          return Scaffold(
            key: Scaffoldstate,
            appBar: AppBar(
              title: Components.defaulttext(
                  text: AppStringTrans(context).nightmarket),
              actions: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => EventCubit.get(context).filterstate(),
                      child: Components.defaulttext(
                          text: AppStringTrans(context).filter,
                          color: AppColors.primercolor),
                    ),
                  ),
                )
              ],
            ),
            floatingActionButton: state is LoadingAddNightMarket
                ? Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Components.loadingwidget(),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.grey),
                    ),
                  )
                : Visibility(
                    visible: EventCubit.get(context).vipmarket,
                    child: FloatingActionButton(
                      onPressed: EventCubit.get(context).isshow == false
                          ? () {
                              EventCubit.get(context).changestat();
                              Scaffoldstate.currentState!
                                  .showBottomSheet((context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.white
                                                  .withOpacity(0.5)),
                                          color: AppColors.black,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Form(
                                            key: formstate,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Components.defaultform(
                                                    controller:
                                                        EventCubit.get(context)
                                                            .silk,
                                                    textInputType: TextInputType
                                                        .numberWithOptions(
                                                            decimal: true),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppStringTrans(
                                                                context)
                                                            .silks;
                                                      }
                                                    },
                                                    hint:
                                                        AppStringTrans(context)
                                                            .silks),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Components.defaultform(
                                                    controller:
                                                        EventCubit.get(context)
                                                            .price,
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return AppStringTrans(
                                                                context)
                                                            .price;
                                                      }
                                                    },
                                                    textInputType: TextInputType
                                                        .numberWithOptions(
                                                            decimal: true),
                                                    textInputAction:
                                                        TextInputAction.go,
                                                    hint:
                                                        AppStringTrans(context)
                                                            .price),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .closed
                                  .then((value) {
                                    EventCubit.get(context).changestat();
                                  });
                            }
                          : () {
                              if (formstate.currentState!.validate()) {
                                EventCubit.get(context).addNightmarket(
                                    HomeCubit.get(context), context);
                              }
                            },
                      backgroundColor: AppColors.primercolor,
                      child: EventCubit.get(context).isshow
                          ? Icon(Icons.done)
                          : Icon(Icons.add),
                    ),
                  ),
            body: state is GetNightMarketLoading
                ? Center(
                    child: Components.loadingwidget(),
                  )
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Filter(EventCubit.get(context), context),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ItemNight(
                                    EventCubit.get(context).nightmarket[index],
                                    context);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount:
                                  EventCubit.get(context).nightmarket.length),
                        )
                      ],
                    ),
                  ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
