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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '自定义文字多语言'),
      //1：定义本地化的代理类的组合
      localizationsDelegates: [
        YuYanBao.delegate,
        GlobalMaterialLocalizations.delegate, //Material国际化
        GlobalCupertinoLocalizations.delegate, //Cupertino国际化
        GlobalWidgetsLocalizations.delegate, //Widgets国际化
        //使用本地创建的文字国际化类
      ],
      //定义支持语言的组合
      supportedLocales: [
        const Locale('en', 'US'), //const Locale('en','US'),支持美国英语
        const Locale('zh', 'CN'), //const Locale('zh','CN'),支持中文简体
        //支持其他
      ],
      //查看检测设备，语言，城市位置信息
      localeResolutionCallback: (locale, supportedLocales) {
        print('dviceLocale设备终端本地化信息:$locale');
        print('languageCode语言编码:{$locale.languageCode}');
        print('countryCode国家城市编码:{$locale.countryCode}');
        //检测当前添加的语言组合中是否有当前设备使用的语言和国家城市
        //如果有，则使用本地的语言包
        //如果没有，则使用语言列表中第一个语言包
        for (var s in supportedLocales) {
          if (s.languageCode == locale?.languageCode &&
              s.countryCode == locale?.countryCode) {
            return s;
          }
        }
        return supportedLocales.first;
      },
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
            //文字多语言位置
            // Text("zh中文a项的值")==Localizations.of(context, Zifu).fanhui("a"),
            Text(YuYanBao.of(context).t("a")),
            Text(YuYanBao.of(context).t("b")),
            Text(YuYanBao.of(context).t("c")),
            Text(YuYanBao.of(context).t("d")),
            Text(YuYanBao.of(context).t("e")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // 这个尾随逗号使构建方法的自动格式化更好。
    );
  }
}

//=====================================

