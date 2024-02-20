import 'package:flutter/material.dart';
import 'package:project_a/view/1splash%20screen.dart';
import 'package:project_a/view/6prof.dart';
import 'package:project_a/view/Vediodetails.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => VideoDetailsProvider()),
        ],
        child: MaterialApp(
          home: Splash(),debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
