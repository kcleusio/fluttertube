import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/models/video.dart';

class FavoritosBloc implements BlocBase{

  Map<String, Video> _favoritos ={};

  final StreamController<Map<String, Video>> _favController = StreamController<Map<String, Video>>.broadcast();

  Stream<Map<String, Video>> get outFav => _favController.stream;

  // passar dados para dentro do bloc Através de função
  void toggleFavoritos(Video video){
    if(_favoritos.containsKey(video.id)) _favoritos.remove(video.id);
    else _favoritos[video.id] = video;
    
    _favController.sink.add(_favoritos);
  }

  @override
  void dispose() {
    _favController.close();
  }

}