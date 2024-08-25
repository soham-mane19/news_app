import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/TechModel.dart';
class Techcontroller {


   Future  getNews()async{


Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7250bac8c80f4615a531f7270f3f2013");
              http.Response responce= await http.get(url);
             var  responcedata     = json.decode(responce.body);
//print(responcedata);
                      return TechModel.fromjson(responcedata);
   }
}