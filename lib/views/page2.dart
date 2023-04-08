import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/pro_demo.dart';
import 'package:provider_demo/views/page3.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Page3()));
                },
                child: const Text('page 2')),
            Text(Provider.of<ProviderDemo>(context).test1),
            Provider.of<ProviderDemo>(context).widget(),
          ],
        ),
      ),
    );
  }
}
