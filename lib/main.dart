import 'package:flutter/material.dart';
import 'package:learnify_app/core/services/routes/route_settings.dart';
import 'package:provider/provider.dart';

import 'features/otp/providers/otp_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OtpProvider(),
      child: MaterialApp(
        title: 'Learnify',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
