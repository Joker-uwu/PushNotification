import 'package:flutter/material.dart';
import 'package:notification_Eydher/pages/homepage.dart';
import 'package:notification_Eydher/pages/mensajepage.dart';
import 'package:notification_Eydher/services/push_not_serv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();

    PushNotService.messagesStream.listen((data) {
      print('MyApp: $data');
      navkey.currentState?.pushNamed('mensaje', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      navigatorKey: navkey,
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (BuildContext c) => HomePage(),
        'mensaje': (BuildContext c) => MensajePage()
      },
    );
  }
}
