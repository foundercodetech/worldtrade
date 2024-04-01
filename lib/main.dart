import 'package:worldtrade/model/colorPredictionResult_provider.dart';
import 'package:worldtrade/res/app_constant.dart';
import 'package:worldtrade/res/provider/Beginner_provider.dart';
import 'package:worldtrade/res/provider/Howtoplay_Provider.dart';
import 'package:worldtrade/res/provider/TermsConditionProvider.dart';
import 'package:worldtrade/res/provider/aboutus_provider.dart';
import 'package:worldtrade/res/provider/addaccount_view_provider.dart';
import 'package:worldtrade/res/provider/addacount_controller.dart';
import 'package:worldtrade/res/provider/auth_provider.dart';
import 'package:worldtrade/res/provider/betColorPrediction_provider.dart';
import 'package:worldtrade/res/provider/betcolorpredictionTRX.dart';
import 'package:worldtrade/res/provider/coins_provider.dart';
import 'package:worldtrade/res/provider/contactus_provider.dart';
import 'package:worldtrade/res/provider/deposit_provider.dart';
import 'package:worldtrade/res/provider/feedback_provider.dart';
import 'package:worldtrade/res/provider/giftcode_provider.dart';
import 'package:worldtrade/res/provider/notification_provider.dart';
import 'package:worldtrade/res/provider/privacypolicy_provider.dart';
import 'package:worldtrade/res/provider/profile_provider.dart';
import 'package:worldtrade/res/provider/promotion_count_provider.dart';
import 'package:worldtrade/res/provider/slider_provider.dart';
import 'package:worldtrade/res/provider/user_view_provider.dart';
import 'package:worldtrade/res/provider/wallet_provider.dart';
import 'package:worldtrade/res/provider/withdrawhistory_provider.dart';
import 'package:worldtrade/utils/routes/routes.dart';
import 'package:worldtrade/utils/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'view/home/mini/Aviator/aviator_provider.dart';

void main() {
  runApp(const MyApp());
  setPathUrlStrategy();
}
double height = 0.0;
double width = 0.0;
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = kIsWeb ? 380 : MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAuthProvider()),
        ChangeNotifierProvider(create: (context) => AviatorWallet()),
        ChangeNotifierProvider(create: (context) => UserViewProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => PromotionCountProvider()),
        ChangeNotifierProvider(create: (context) => DepositProvider()),
        ChangeNotifierProvider(create: (context) => WithdrawHistoryProvider()),
        ChangeNotifierProvider(create: (context) => AboutusProvider()),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => AddacountProvider()),
        ChangeNotifierProvider(create: (context) => AddacountViewProvider()),
        ChangeNotifierProvider(create: (context) => BeginnerProvider()),
        ChangeNotifierProvider(create: (context) => HowtoplayProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => GiftcardProvider()),
        ChangeNotifierProvider(create: (context) => CoinProvider()),
        ChangeNotifierProvider(create: (context) => ColorPredictionProvider()),
        ChangeNotifierProvider(create: (context) => BetColorResultProvider()),
        ChangeNotifierProvider(create: (context) => FeedbackProvider()),
        ChangeNotifierProvider(create: (context) => TermsConditionProvider()),
        ChangeNotifierProvider(create: (context) => PrivacyPolicyProvider()),
        ChangeNotifierProvider(create: (context) => ContactUsProvider()),
        ChangeNotifierProvider(create: (context) => BetColorResultProviderTRX()),
      ],
      child:  Builder(
        builder: (context) {
          if (kIsWeb) {
            print("aaa");
            width = 380;
            return MaterialApp(
              builder: (context, child) {
                return Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 380,
                    ),
                    child: child,
                  ),
                );
              },
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              color:const Color(0xffef3a38),
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          } else {
            print("bbbb");
            return   MaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.splashScreen,
              color:const Color(0xffef3a38),
              onGenerateRoute: (settings) {
                if (settings.name != null) {
                  return MaterialPageRoute(
                    builder: Routers.generateRoute(settings.name!),
                    settings: settings,
                  );
                }
                return null;
              },
            );
          }
        },
      ),

      // MaterialApp(
      //   title: AppConstants.appName,
      //   debugShowCheckedModeBanner: false,
      //   initialRoute: RoutesName.splashScreen,
      //   onGenerateRoute: (settings) {
      //     if (settings.name != null) {
      //       return MaterialPageRoute(
      //         builder: Routers.generateRoute(settings.name!),
      //         settings: settings,
      //       );
      //     }
      //     return null;
      //   },
      // ),
    );
  }
}
