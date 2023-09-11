import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:darksro/features/settings/presentation/widgets/supportwid..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocConsumer<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title:
                  Components.defaulttext(text: AppStringTrans(context).support),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    createticket(SettingsCubit.get(context), context, state),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is CreateTicketSuccess) {
            Navigator.pop(context);
            SettingsCubit.get(context).checkticket(context);
          }
        },
      ),
    );
  }
}
