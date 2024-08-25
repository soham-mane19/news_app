import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:news_app/HomeModel.dart';

class Homecon{
 

  Future   getTopNews()async{

  Uri  url=  Uri.parse("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7250bac8c80f4615a531f7270f3f2013");
         http.Response response = await http.get(url); 
    
          var responcedata   =json.decode(response.body);

              return HomeModel.fromJson(responcedata);


 

  }

}