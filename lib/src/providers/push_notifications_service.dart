import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  //BACKGROUND
  static Future _backgroundHandler(RemoteMessage message) async {
    final argumento = message.data['producto'] ?? 'not--data';
    _messageStream.sink.add(argumento);
    //print('onBackground HANDLER: ${message.messageId}');
    print(message.data);
    //_messageStream.add(message.notification?.body ?? 'No title');
  }

  //ON MESSAGE
  static Future _onMessageHandler(RemoteMessage message) async {
    final argumento = message.data['producto'] ?? 'not--data';
    _messageStream.sink.add(argumento);
    //print('onMessage HANDLER: ${message.messageId}');
    print(message.data);
    //_messageStream.add(message.notification?.body ?? 'No title');
  }

  //ON MESSAGE OPEN APP
  static Future _onMessageOpenApp(RemoteMessage message) async {
    final argumento = message.data['producto'] ?? 'not--data';
    _messageStream.sink.add(argumento);
    //print('onMessageOpenApp HANDLER: ${message.messageId}');
    print(message.data);
    //_messageStream.add(message.notification?.body ?? 'No title');
  }

  //Inicarlizar
  static Future initializeApp() async {
    //PUSH NOTIFICACIONS
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('TOKEN: $token');

    //HANDLERS
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //LOCAL NOTIFICATIONS
  }

  static closeStreams() {
    _messageStream.close();
  }
}
