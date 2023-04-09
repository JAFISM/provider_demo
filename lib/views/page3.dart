import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/pro_demo2.dart';
import 'package:provider_demo/views/page1.dart';
import 'package:provider_demo/views/song_screen.dart';


class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Page1()));
                },
                child: const Text('page 3')),
            Consumer<ProDemo2>(
              builder: (context, value, child) {
                return Text(value.demo);
              }),
            IconButton(onPressed: (){
              Provider.of<ProDemo2>(context,listen: false).demoVal("Flutter...");
            }, icon: const Icon(Icons.refresh)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const SongScreen()));
            }, child: const Text("PlayList"))
          ],
        ),
      ),
    );
  }
}
