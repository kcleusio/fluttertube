import 'dart:convert';

import 'package:fluttertube/models/video.dart';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyCwJ52bSKq0PRuJUCpvbl4TmhHh3ZEN3W0";

class api {
  Search(String search) async {
    http.Response response = await http.get(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
    );
    decode(response);
  }
}

List<Video> decode(http.Response response) {
  if (response.statusCode == 200) {
    var decoded = json.decode(response.body);
    List<Video> videos = decoded['Items'].map<Video>(
        (map){
          return Video.fromJson(map);
        }
    ).toList();

    return videos;
  } else {
    throw Exception("Falha ao carregar vídeos");
  }

}
