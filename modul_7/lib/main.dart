import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.amber)),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    // Konfigurasi Android
    var androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    // Konfigurasi iOS
    var iosInitializationSettings = DarwinInitializationSettings();

    // Gabungkan pengaturan
    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    // Inisialisasi plugin notifikasi
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  Future<void> onSelectNotification(NotificationResponse response) async {
    String? payload = response.payload;
    if (payload != null) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => NewScreen(payload: payload)));
    }
  }

  Future<void> showNotification() async {
    var androidDetails = AndroidNotificationDetails(
      'id',
      'channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    var iosDetails = DarwinNotificationDetails();

    var notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Flutter Devs',
      'Flutter Local Notification Demo',
      notificationDetails,
      payload: 'Welcome to the Local Notification demo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Notification Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: showNotification,
              child: Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  final String payload;
  NewScreen({required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification Clicked")),
      body: Center(child: Text(payload, style: TextStyle(fontSize: 18))),
    );
  }
}
