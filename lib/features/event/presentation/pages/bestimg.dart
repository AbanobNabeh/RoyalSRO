import 'package:darksro/core/components/app_components.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/event/presentation/cubit/event_cubit.dart';
import 'package:darksro/features/event/presentation/widgets/post.dart';
import 'package:darksro/features/event/presentation/widgets/uploadimg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestIMGScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> Scaffoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..getposts(context),
      child: BlocConsumer<EventCubit, EventState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: Scaffoldstate,
            appBar: AppBar(
              title:
                  Components.defaulttext(text: AppStringTrans(context).BestIMG),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: !EventCubit.get(context).mypost,
                      child: UploadIMGWid(
                          context, Scaffoldstate, EventCubit.get(context)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    state is GetPostLoading
                        ? Center(
                            child: Components.loadingwidget(),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return PostWID(
                                  EventCubit.get(context).posts[index],
                                  Scaffoldstate,
                                  context,
                                  index);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: EventCubit.get(context).posts.length)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
