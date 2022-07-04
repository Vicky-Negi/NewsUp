import 'dart:async';
import 'dart:convert';
import '../modles/ArticleModel.dart';
import 'package:http/http.dart' as http;
class News {
  String countryname="";
  News({required this.countryname});
  List<ArticleModel> news=[];
  Future <void> getNews() async{
    String url="https://newsapi.org/v2/top-headlines?country=$countryname&apiKey=0335bbdff19d4d0db151b5f10a9b5be3";
    var response= await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ArticleModel articleModel=ArticleModel(author: element['author'], title: element['title'], desc: element['description'], url: element['url'], urlToImg: element['urlToImage'], content: element['contextt'],publishedAt: element['publishedAt']);
          news.add(articleModel);
        }
    });
    }
  }

}
class CategoryNewsClass{
  String countryname="";
  CategoryNewsClass({required this.countryname});
  List<ArticleModel> news=[];
  Future <void> getNews(String category) async{
    String url="https://newsapi.org/v2/top-headlines?category=$category&country=$countryname&apiKey=0335bbdff19d4d0db151b5f10a9b5be3";
    var response= await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ArticleModel articleModel=ArticleModel(author: element['author'], title: element['title'], desc: element['description'], url: element['url'], urlToImg: element['urlToImage'], content: element['context'],publishedAt: element['publishedAt']);
          news.add(articleModel);
        }
      });
    }
  }
}