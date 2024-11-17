import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 翻訳情報を手動で指定する場合
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      //
      // サポートする言語を手動で指定する場合
      // supportedLocales: const [
      //   Locale('ja', 'JP'),
      // ],

      // 翻訳情報を自動生成コードで指定する場合
      localizationsDelegates: L10n.localizationsDelegates,

      // サポートする言語を自動生成コードで指定する場合
      supportedLocales: L10n.supportedLocales,

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  Widget build(BuildContext context) {
    // Intl.defaultLocale = 'ja';
    Intl.defaultLocale = Localizations.localeOf(context).toString();

    final l10n = L10n.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(),
            Text(
              DateFormat.yMEd().format(DateTime.now()),
            ),
            Text(
              l10n.helloWorld
            ),
            Text(
              l10n.numOfSearchResult(0),
            ),
            Text(
              l10n.numOfSearchResult(10),
            ),
          ],
        ),
      ),
    );
  }
}
