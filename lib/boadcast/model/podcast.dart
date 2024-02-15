class Podcast {
  int idPodcast;
  int? rating;
  String? title;
  String? text;
  String? img;
  String? audio;
  int registerId;
  bool? isLiked;

  Podcast({
    required this.idPodcast,
    this.rating,
    this.title,
    this.text,
    this.img,
    this.audio,
    required this.registerId,
    this.isLiked,
  });

  factory Podcast.fromJson(Map<String, dynamic> json) {
    return Podcast(
      idPodcast: json['idPodcast'],
      rating: json['rating'],
      title: json['title'],
      text: json['text'],
      img: json['img'],
      audio: json['audio'],
      registerId: json['registerId'],
    );
  }

  Podcast fetchAndLoadStudentData({int? itemID}) {
    return Podcast(
      idPodcast: idPodcast,
      rating: rating,
      title: title,
      text: text,
      img: img,
      audio: audio,
      registerId: registerId,
    );
  }
}
