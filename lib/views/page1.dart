import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/views/page2.dart';

import '../controller/pro_demo.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget height=const SizedBox(height: 10,);
    print("Page rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Page2()));
                },
                child: const Text('page 1')),
            height,
            Consumer<ProviderDemo>(
              builder: (context, value, child) {
                print("consumer rebuild");
                return Text(value.test1);
              }),
            height,
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: (){
                  Provider.of<ProviderDemo>(context,listen: false).changeValue("Code...");
                },
                child: const Text('Change Value')),
            height,
            Provider.of<ProviderDemo>(context).widget(),
            height,
            GestureDetector(
              onTap: (){
                print("ontap test");
                Provider.of<ProviderDemo>(context,listen: false).increment();
              },
              child: Container(
                height: 100,
                width: 100,
                decoration:  BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Tap Here",style: TextStyle(color: Colors.white),),
                    Consumer<ProviderDemo>(
                      builder: (context, value, child) {
                        return Text(Provider.of<ProviderDemo>(context).count.toString(),style: const TextStyle(fontSize: 30),);
                      }),
                  ],
                )),
              ),
            ),
            height,
            ElevatedButton(onPressed: (){
              Provider.of<ProviderDemo>(context, listen: false).reset();
            }, child: const Text("Clear button"),),
            height,
            ElevatedButton(onPressed: (){
              Provider.of<ProviderDemo>(context, listen: false).decrement();
            }, child: const Text("Decrement button"),),
            height,
            ElevatedButton(onPressed: (){
              Provider.of<ProviderDemo>(context, listen: false).increment();
            }, child: const Text("Increment button"),),
          ],
        ),
      ),
    );
  }
}
