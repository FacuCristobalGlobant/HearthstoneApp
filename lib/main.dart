import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/presentation/widget/list_of_cards.dart';
import 'local_notice_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalNoticeService().setup();
  runApp(const HearthStoneApp());
}

class HearthStoneApp extends StatelessWidget {
  const HearthStoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HearthStoneApp',
      home: ListOfCards(),
    );
  }
}
