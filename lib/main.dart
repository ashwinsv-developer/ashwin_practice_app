import 'dart:ui';
import 'package:ashwin_practice_app/bloc/bloc/bottom_nav_bloc.dart';
import 'package:ashwin_practice_app/model/list_item_data.dart';
import 'package:ashwin_practice_app/route/generatedRoute.dart';
import 'package:ashwin_practice_app/utills/constants.dart';
import 'package:ashwin_practice_app/widgets/bottom_navigation_widget.dart';
import 'package:ashwin_practice_app/widgets/dashboard_widget.dart';
import 'package:ashwin_practice_app/widgets/home_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model/bottom_navi_data.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  // await PushNotificationService().initialize();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      onGenerateRoute: GenerateRoute.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  static const String screenName= "homePage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItemData> itemData = [
    ListItemData(
        name: "GOLD",
        qty: 11.05,
        pricePerQty: 1999,
        purity: 0.97,
        change: -0.4,
        colour: Color(0xffdada1a)),
    ListItemData(
        name: "SILVER",
        qty: 0.00,
        pricePerQty: 26.20,
        purity: 0.0,
        change: -0.15,
        colour: Color(0xffa6a6a6)),
    ListItemData(
        name: "PLATINUM",
        qty: 0.00,
        pricePerQty: 1102.20,
        purity: 0.0,
        change: -0.08,
        colour: Color(0xffd580ff))
  ];
  List<BottomNavData> bottomData = [
    BottomNavData(
        title: "Home", iconNmae: Icons.home, isSelected: true, position: 0),
    BottomNavData(
        title: "Portfolio",
        iconNmae: Icons.pie_chart,
        isSelected: false,
        position: 1),
    BottomNavData(
        title: "",
        iconNmae: Icons.account_circle_sharp,
        isSelected: false,
        position: 2),
    BottomNavData(
        title: "Prices",
        iconNmae: Icons.line_axis_rounded,
        isSelected: false,
        position: 3),
    BottomNavData(
        title: "Settings",
        iconNmae: Icons.settings,
        isSelected: false,
        position: 4),
  ];

  @override
  void initState() {
    // TODO: implement initState
    // registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.white,
        child: BlocProvider(
          create: (context) => BottomNavBloc(),
          child: BottomNavigationWidget(
            listData: bottomData,
            onDataReceived: (data) {
              setState(() {
                bottomData = data;
              });
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  DashBoardWidget(),
                  Container(
                      margin: const EdgeInsets.only(top: 200),
                      child: HomeListWidget(itemList: itemData)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(Constants.do_more_with_onegold,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              HomeListWidget(itemList: itemData)
            ],
          ),
        ),
      ),
    );
  }

  // void registerNotification() async {
  //
  //   await Firebase.initializeApp();
  //   _messaging = FirebaseMessaging.instance;
  //
  //   fetchRemoteConfigData();
  //   NotificationSettings settings = await _messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted permission');
  //
  //     // Add the following line
  //     // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //     getToken();
  //     // For handling the received notifications
  //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //       print("message $message");
  //       // Parse the message received
  //       PushNotification notification = PushNotification(
  //         title: message.notification?.title,
  //         body: message.notification?.body,
  //       );
  //       getToken();
  //
  //
  //       // setState(() {
  //       //   _notificationInfo = notification;
  //       //   _totalNotifications++;
  //       // });
  //     });
  //   } else {
  //     print('User declined or has not accepted permission');
  //   }
  // }

  // Future<String?> getToken() async {
  //   String? token = await _messaging.getToken();
  //   print('Token: $token');
  //   return token;
  // }

  // Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //   print("Handling a background message: ${message.messageId}");
  // }

  // Future<void >fetchRemoteConfigData()async{
  //   final remoteConfig = FirebaseRemoteConfig.instance;
  //   await remoteConfig.setConfigSettings(RemoteConfigSettings(
  //     fetchTimeout: const Duration(minutes: 1),
  //     minimumFetchInterval: const Duration(hours: 1),
  //   ));
  // }


}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
