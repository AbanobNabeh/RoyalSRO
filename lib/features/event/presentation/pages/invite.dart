import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/invitewid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InviteScreen extends StatelessWidget {
  InviteScreen({super.key});
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..checkinvite(context),
      child: BlocConsumer<EventCubit, EventState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Components.defaulttext(
                    text: AppStringTrans(context).inviteplayer),
              ),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: state is CheckIniteLoading
                    ? Components.loadingwidget()
                    : Center(
                        child: EventCubit.get(context).rdeme == true
                            ? redemCode(context, EventCubit.get(context), state)
                            : continfo(
                                context,
                                EventCubit.get(context),
                                state,
                                EventCubit.get(context).infoinv[0],
                                formstate,
                              ),
                      ),
              )));
        },
        listener: (context, state) {},
      ),
    );
  }
}
