class TechModel {
    String? status;
    int? totalResults;
    List<Article>? articles;

    TechModel({
        this.status,
         this.totalResults,
         this.articles,
    });
    TechModel.fromjson(Map<String,dynamic> json){
          
     status = json['status'];
    totalResults = json['totalResults'];
     if (json['articles'] != null) {
      articles = <Article>[];
      json['articles'].forEach((v) {
        articles!.add(Article.fromjson(v));
      });
    } else {
      articles = [];
    }
    }
    
    

   
    }



class Article {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    String? publishedAt;
    String? content;

    Article({
         this.source,
         this.author,
         this.title,
         this.description,
         this.url,
         this.urlToImage,
         this.publishedAt,
         this.content,
    });
    Article.fromjson(Map<String,dynamic>json){
       
       source = Source.fromjson(json['source']);
       author = json[''];
        author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];

      
    }

}

class Source {
    String?id;
    String?  name;

    Source({
         this.id,
         this.name,
    });
    Source.fromjson(Map<String,dynamic> json){
      id = json['id'];
    name = json['name'];
    }
}

enum Id {
    TECHCRUNCH
}

enum Name {
    TECH_CRUNCH
}
