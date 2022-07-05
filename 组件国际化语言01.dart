library main;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 这个小部件是您的应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //1：定义本地化的代理类的组合
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, //Material国际化
        GlobalCupertinoLocalizations.delegate, //Cupertino国际化
        GlobalWidgetsLocalizations.delegate, //Widgets国际化
      ],
      //定义支持语言的组合
      supportedLocales: [
        const Locale('en', 'US'), //const Locale('en','US'),支持美国英语
        const Locale('zh', 'CN'), //const Locale('zh','CN'),支持中文简体
        //支持其他
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '1组件语言国际化'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '您已经多次按下按钮：',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            //添加日历组件
            MyStatelessWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
