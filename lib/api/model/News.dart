

import 'package:news_app_c11_sun/api/model/Source.dart';

/// source : {"id":null,"name":"Yahoo Entertainment"}
/// author : "Lawrence Bonk"
/// title : "Meta has reportedly killed its Apple Vision Pro competitor"
/// description : "Meta has canceled its plans for a long-rumored mixed-reality headset that was intended to compete with the Apple Vision Pro, according to reporting by The Information. The company told employees at Reality Labs to stop working on the device after a product re…"
/// url : "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_3ea390c2-c800-4355-ac65-d8697e08b5a6"
/// urlToImage : null
/// publishedAt : "2024-08-23T18:44:47Z"
/// content : "If you click 'Accept all', we and our partners, including 237 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}