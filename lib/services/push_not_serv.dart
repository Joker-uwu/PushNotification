import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();

  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    final argumento = message.data['comida'] ?? 'no-data';
    _messageStream.sink.add(argumento);
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    final argumento = message.data['comida'] ?? 'no-data';
    _messageStream.sink.add(argumento);
  }

  static Future _onMessOpenApp(RemoteMessage message) async {
    final argumento = message.data['comida'] ?? 'no-data';
    _messageStream.sink.add(argumento);
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessOpenApp);
  }

  static closeStreams() {
    _messageStream.close();
  }
}
