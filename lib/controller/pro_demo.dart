import 'package:flutter/material.dart';

class ProviderDemo extends ChangeNotifier{
   String test1='Jafis';
   int _count=0;

   void changeValue(String val){
     test1=val;
     notifyListeners();
   }

   int get count => _count;
   void increment() {
     _count++;
     notifyListeners();
   }
   void decrement() {
     _count--;
     notifyListeners();
   }

   void reset() {
     _count = 0;
     notifyListeners();
   }

   Widget widget (){
     return Container(
       height: 100,
       width: 100,
       decoration: BoxDecoration(
         color: Colors.orange,
         shape: BoxShape.circle
       ),
     );
   }

}