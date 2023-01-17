class TrendsModel {
  String? category;
  String? hashtag;
  String? tweetCount;

  TrendsModel({this.category, this.hashtag, this.tweetCount});

  TrendsModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    hashtag = json['hashtag'];
    tweetCount = json['tweetCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['hashtag'] = hashtag;
    data['tweetCount'] = tweetCount;
    return data;
  }
}
