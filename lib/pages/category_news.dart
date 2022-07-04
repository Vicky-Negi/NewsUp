import'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import '../helper/news.dart';
import '../modles/ArticleModel.dart';
import 'article_view.dart';
class CategoryNews extends StatefulWidget {
  final String? category;
  CategoryNews({required this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articels=new List<ArticleModel>.empty(growable: true);
  bool _loading=true;
  @override
  void initState(){
    super.initState();
    changecountry(countryname: 'in');
  }
  changecountry({String countryname="in"})
  {
    getCategoryNews(countryname);
  }
  getCategoryNews(String countryname) async{
    CategoryNewsClass newClass=CategoryNewsClass(countryname: countryname);
    await newClass.getNews(widget.category.toString());
    articels=newClass.news;
    setState((){
      _loading=false;
    });
  }
  @override
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
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
       body: _loading? Center(child: Container(child: CircularProgressIndicator(),)):SingleChildScrollView(
           padding: EdgeInsets.symmetric(horizontal: 16),
           child: Container(
         child: Column(
           children: [
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
                 })
             )
           ],
         ),
       )
    ));
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
            SizedBox(height: 2,),
            Align(alignment: Alignment.centerLeft, child: Text(DateFormat("yyyy-MM-dd").parse(date.toString()).toString().substring(0,11))),
            SizedBox(height: 8),
            Text(desc.toString(),style: TextStyle(color: Colors.grey,)),
          ],
        ),
      ),
    );
  }
}