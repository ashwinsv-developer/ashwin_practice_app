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
import 'package:workmanager/workmanager.dart';
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
  await  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  runApp(const MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case "oneTimeTask":
        debugPrint("Normal task is getting execurted  ${inputData} ");
        break;

      case "simplePeriodicTask":
        debugPrint("Timing interval task is getting execurted  ${inputData} ");
        break;
    }
    return Future.value(true);
  });
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

@override
void initState() {
  super.initState();
}

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


}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
