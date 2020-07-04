class Video {

  final String id;
  final String title;
  final String channel;
  final String thumb;

  Video({this.id, this.title, this.channel, this.thumb});
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumb: json['snippet']['thumbnail']['high']['url'],
      channel: json['snippet']['channelTitle']
    );
  }
}
