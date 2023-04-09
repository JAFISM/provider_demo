import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/song_provider.dart';
import 'package:provider_demo/views/song_fav.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {

    var songs=context.watch<SongProvider>().songs;//original list

    var myList=context.watch<SongProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("PlayList"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const FavSong()));
                },
                label:  Text("Go to My List (${myList.length})"),
              icon: const Icon(Icons.favorite),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 20)
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                  itemBuilder: (_,index) {
                  final currentSong=songs[index];
                    return Card(
                      key: ValueKey(currentSong.title),
                      color: Colors.purple.withOpacity(0.7),
                      elevation: 4,
                      child: ListTile(
                        title: Text(currentSong.title,style: const TextStyle(color: Colors.white),),
                        subtitle: Text(currentSong.duration??'No information',
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite,color: myList.contains(currentSong)?Colors.red:Colors.white,size: 30, ),
                          onPressed: () {
                            if(!myList.contains(currentSong)){
                             context.read<SongProvider>().addToList(currentSong);
                            }else{
                              context.read<SongProvider>().removeFromList(currentSong);
                            }
                          },
                        ),
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
