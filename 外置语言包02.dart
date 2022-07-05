import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //rootBundle.loadString需要用到这个库
import 'dart:convert'; //json解析需要用这个库

class YuYanBao {
  final Locale locale;

  YuYanBao(this.locale);
  //声明语言包内的Map数据

  Map<String, String>? _yuyanbao; //声明语言包变量，但是不赋值
  //通过异步的方式去给【_yuyanbao】赋值
  //定义函数名为【loadJson()】的方法
  Future<bool> loadJson() async {
    //返回来的内容是字符串
    //获取rootBundle中的
    //${locale.languageCode}鸟事当前本地的语言编码【lang/en.json】
    String jsonString = await rootBundle
        .loadString('lang/${locale.languageCode}.json'); //判断语言编码
    //对json包进行解析为dart数据
    //对获取到的json数据文件进行解析
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    //把解析好的数据内容赋值给语言包变量【_yuyanbao】
    _yuyanbao = jsonMap.map((key, value) {
      // MapEntry生成Map中的信息
      //第2和value需要转换成字符串，因为【Map<String, String> _yuyanbao;】中定义的第2个数据是字符串
      return MapEntry(key, value.toString());
    });
    return true; //函数的返回雷士是一个布尔类型
  }

  t(String key) {
    //_bendihuaValues["zh"]["a"]
    //_bendihuaValues["en"]["b"]
    //返回1个一维的值
    return _yuyanbao?[key];
  }

  static YuYanBao of(BuildContext context) {
    return Localizations.of(context, YuYanBao);
  }

  static YuYanBaoDelegate delegate = YuYanBaoDelegate();
}

class YuYanBaoDelegate extends LocalizationsDelegate<YuYanBao> {
  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<YuYanBao> load(Locale locale) async {
    //使用异步的方式去返回内容
    YuYanBao localizations = YuYanBao(locale); //一个实例化对象
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<YuYanBao> old) {
    return false;
    //不希望频繁的更新，返回false
  }
}
