import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/song_provider.dart';

class FavSong extends StatefulWidget {
  const FavSong({Key? key}) : super(key: key);

  @override
  State<FavSong> createState() => _FavSongState();
}

class _FavSongState extends State<FavSong> {
  @override
  Widget build(BuildContext context) {
    final myList=context.watch<SongProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${myList.length})"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (_,index) {
            final currentSong=myList[index];
            return Card(
              key: ValueKey(currentSong.title),
              color: Colors.purple.withOpacity(0.7),
              elevation: 4,
              child: ListTile(
                title: Text(currentSong.title,style: const TextStyle(color: Colors.white),),
                subtitle: Text(currentSong.duration??'',
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete,color: myList.contains(currentSong)?Colors.red:Colors.white,size: 30, ),
                  onPressed: () {
                      context.read<SongProvider>().removeFromList(currentSong);
                  },
                ),
              ),
            );
          }),
    );
  }
}
