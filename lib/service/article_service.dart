import 'package:dio/dio.dart';
import 'package:news_app_api/model/card_model.dart';

class ArticleService {
  Future<List<CardModel>> getArticles(String cat) async {
    try{
      var res = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=cc03f3e77b644eb08cb4c721af67b7cb&category=$cat");
      Map<String, dynamic> json = res.data;
      List<dynamic> art = json["articles"];
      List<CardModel> cards = [];
      for (var article in art) {
        if (article["author"] != null &&
            article["title"]!= null &&
            article["description"] != null &&
            article["urlToImage"] != null &&
            article["url"] != null) {
          String date = article["publishedAt"].split("T")[0]??"";
          String time = article["publishedAt"].split("T")[1]??"";
          CardModel card = CardModel(
            title: article["title"],
            description: article["description"],
            img: article["urlToImage"],
            url: article["url"],
            date: date,
            time: time,
            name: article["source"]["name"],
            author: article["author"],
          );
          cards.add(card);
        } else {
          continue;
        }
      }
      return cards;
    } catch (error) {
      throw Exception(error);
    }
  }
}
