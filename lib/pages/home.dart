import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:newsup/helper/data.dart';
import 'package:newsup/modles/ArticleModel.dart';
import 'package:newsup/modles/categoryModel.dart';
import 'package:newsup/modles/categoryModel.dart';
import 'package:newsup/pages/article_view.dart';

import '../helper/news.dart';
import 'category_news.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);
  List<ArticleModel> articels=List<ArticleModel>.empty(growable: true);
  bool _loading=true;
  @override
  void initState(){
    super.initState();
    categories=getCategories();
    changecountry(countryname: 'in');
  }
  changecountry({String countryname="in"})
  {
    getNews(countryname);
  }
  getNews(String countryname) async{
    News newsClass =News(countryname: countryname);
    await newsClass.getNews();
    articels=newsClass.news;
    setState((){
      _loading=false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Image.asset('icons/flags/png/in.png', package: 'country_icons'),
            onTap: ()=>{changecountry(countryname: 'in')},
          ),
          SpeedDialChild(
            child: Image.asset('icons/flags/png/us.png', package: 'country_icons'),
            onTap:()=>{changecountry(countryname: 'us')},
          ),
          SpeedDialChild(
            child: Image.asset('icons/flags/png/ru.png', package: 'country_icons'),
            onTap:()=>{changecountry(countryname: 'ru')},
          ),
        ],
      ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("News",style: TextStyle(color: Colors.black),),
              Text("Up", style: TextStyle(color: Colors.blue),),
            ],
          ),
          elevation: 0.0,
        ),
    body:_loading? Center(child: Container(child: CircularProgressIndicator(),)):SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              ///Categories
              Container(
                height: 70,
                child: ListView.builder(itemBuilder: (context,index){
                  return CategoryTile(
                    imgUrl: categories[index].imgurl,
                    categoryName: categories[index].categoryName,
                  );
                }, scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories.length),
              ),

              ///Blogs
              Container(
                padding: EdgeInsets.only(top:16),
                child: ListView.builder(
                    itemCount: articels.length,shrinkWrap: true, physics: ClampingScrollPhysics(), itemBuilder: (context,index){
                  return BlogTile(
                    imgUrl: articels[index].urlToImg,
                    title: articels[index].title,
                    desc: articels[index].desc,
                    url: articels[index].url,
                    date: articels[index].publishedAt,
                  );
                }),
              )
            ],
          ),
      ),
    ),);
  }
}
class CategoryTile extends StatelessWidget {
  final imgUrl,categoryName;
  CategoryTile({this.imgUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(category: categoryName.toLowerCase())))
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(width: 120,height: 60,fit: BoxFit.cover, imageUrl: imgUrl,)),
            Container(
              alignment: Alignment.center,
              width:120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(categoryName,style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String? imgUrl, title, desc,date,url;
  BlogTile({required this.imgUrl,required this.title,required this.desc,required this.url,required this.date});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Article_View(blogUrl: url.toString())))
      },
      child: Container(
        margin: EdgeInsets.only(bottom:16),
        child: Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(6), child: Image.network(imgUrl.toString())),
            SizedBox(height: 4,),
            Text(title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            Align(alignment: Alignment.centerLeft, child: Text(DateFormat("yyyy-MM-dd").parse(date.toString()).toString().substring(0,11))),
            SizedBox(height: 8),
            Text(desc.toString(),style: TextStyle(color: Colors.grey,)),
          ],
        ),
      ),
    );
  }
}

