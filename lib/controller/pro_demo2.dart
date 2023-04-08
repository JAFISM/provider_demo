import 'package:flutter/material.dart';

class ProDemo2 extends ChangeNotifier{
  String demo ="Code with jafis";

  void demoVal(String demonew){
    demo=demonew;
    notifyListeners();
  }
}