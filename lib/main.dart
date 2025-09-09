import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dashboard_provider.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Responsive Dashboard',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
