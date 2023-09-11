import 'package:darksro/features/Auth/presentation/pages/signin.dart';
import 'package:darksro/features/Auth/presentation/pages/signup.dart';
import 'package:darksro/features/event/presentation/pages/alchemy.dart';
import 'package:darksro/features/event/presentation/pages/bestimg.dart';
import 'package:darksro/features/event/presentation/pages/gift.dart';
import 'package:darksro/features/event/presentation/pages/invite.dart';
import 'package:darksro/features/event/presentation/pages/luckyspin.dart';
import 'package:darksro/features/event/presentation/pages/nightmarket.dart';
import 'package:darksro/features/event/presentation/pages/royalpass.dart';
import 'package:darksro/features/event/presentation/pages/vip.dart';
import 'package:darksro/features/settings/presentation/pages/changepw.dart';
import 'package:darksro/features/settings/presentation/pages/donatelist.dart';
import 'package:darksro/features/settings/presentation/pages/logscreen.dart';
import 'package:darksro/features/settings/presentation/pages/support.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/pricelistdp.dart';
import '../../features/settings/presentation/pages/chatscreen.dart';
import '../../features/settings/presentation/pages/gmscreen.dart';

class AppRoutes {
  static const String Signin = '/signin';
  static const String Signup = '/signup';
  static const String charselect = '/charselect';
  static const String luckspin = '/luckspin';
  static const String VIP = '/VIP';
  static const String BESTImg = '/BESTImg';
  static const String Invite = '/Invite';
  static const String gift = '/gift';
  static const String nightmarket = '/nightmarket';
  static const String alchemy = '/alchemy';
  static const String royalpass = '/royalpass';
  static const String pricedp = '/pricedp';
  static const String changepw = '/changepw';
  static const String support = '/support';
  static const String GMscreen = '/gmscreen';
  static const String logscreen = '/logscreen';
  static const String donatescreen = '/donatescreen';

  static routepush(
      {required BuildContext context, required String namescreen}) {
    return Navigator.pushNamed(context, namescreen);
  }

  static routeremove(
      {required BuildContext context, required String namescreen}) {
    return Navigator.pushNamed(context, namescreen);
  }
}

class RouteGenerate {
  static Route? onGenerateroute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.Signin:
        return MaterialPageRoute(builder: ((context) => SignInScreen()));
      case AppRoutes.Signup:
        return MaterialPageRoute(builder: ((context) => SignUpScreen()));
      case AppRoutes.luckspin:
        return MaterialPageRoute(builder: ((context) => LuckySpin()));
      case AppRoutes.VIP:
        return MaterialPageRoute(builder: ((context) => VipScreen()));
      case AppRoutes.BESTImg:
        return MaterialPageRoute(builder: ((context) => BestIMGScreen()));
      case AppRoutes.Invite:
        return MaterialPageRoute(builder: ((context) => InviteScreen()));
      case AppRoutes.gift:
        return MaterialPageRoute(builder: ((context) => GiftScreen()));
      case AppRoutes.nightmarket:
        return MaterialPageRoute(builder: ((context) => NightMarletScreen()));
      case AppRoutes.alchemy:
        return MaterialPageRoute(builder: ((context) => AlchemyScreen()));
      case AppRoutes.royalpass:
        return MaterialPageRoute(builder: ((context) => RoyalPassScreen()));
      case AppRoutes.pricedp:
        return MaterialPageRoute(builder: ((context) => PriceDPScreen()));
      case AppRoutes.changepw:
        return MaterialPageRoute(
            builder: ((context) => ChangePasswordScreen()));
      case AppRoutes.support:
        return MaterialPageRoute(builder: ((context) => SupportScreen()));
      case AppRoutes.GMscreen:
        return MaterialPageRoute(builder: ((context) => GMScreen()));

      case AppRoutes.logscreen:
        return MaterialPageRoute(builder: ((context) => LogScreen()));
      case AppRoutes.donatescreen:
        return MaterialPageRoute(builder: ((context) => DonateList()));
      default:
        return null;
    }
  }
}
