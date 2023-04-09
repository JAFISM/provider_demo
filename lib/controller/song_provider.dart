
import 'dart:math';

import 'package:flutter/widgets.dart';

import '../model/song_model.dart';

List<Song> initialData =List.generate(50,
        (index) => Song(
    title: 'Song ${index+1}',
    duration: '${Random().nextInt(100)+60} seconds'));

class SongProvider with ChangeNotifier{

  final List<Song>_songs=initialData;
  List<Song> get songs=>_songs;

  final List<Song>_myList=[];
  List<Song> get myList=>_myList;

  void addToList(Song song){
    _myList.add(song);
    notifyListeners();
  }
  void removeFromList(Song song){
    _myList.remove(song);
    notifyListeners();
  }


}