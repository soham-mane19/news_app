import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/EnterController.dart';
import 'package:news_app/EnterModel.dart';
import 'package:news_app/HomeScreen.dart';


import 'package:news_app/Sports.dart';
import 'package:news_app/Tech.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:url_launcher/url_launcher.dart';

class Enterscree extends StatefulWidget {
  const Enterscree({super.key});
  @override
  State createState() => _EnterscreeState();
}

class _EnterscreeState extends State {
  int catindex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TopStory",
            style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  category(0, "Top Stories"),
                  const SizedBox(
                    width: 18,
                  ),
                  category(1, "Tech"),
                  const SizedBox(
                    width: 18,
                  ),
                  category(2, "entertainment"),
                  const SizedBox(
                    width: 18,
                  ),
                  category(3, "Sports"),
                  const SizedBox(
                    width: 18,
                  ),
                  category(4, "startup"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text(
              "Braking news",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Entercontroller().getEnterNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  const SpinKitFadingCircle(color: Colors.green,);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData ||
                    snapshot.data?.articles == null ||
                    snapshot.data!.articles!.isEmpty) {
                  return const Text('No articles found');
                } else {
                  List<EntArticles> articles = snapshot.data.articles;
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                final Uri url = Uri.parse(articles[index].url!);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                height: 110,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Image.network(
                                     articles[index].urlToImage?? 'https://via.placeholder.com/150',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            articles[index].title!,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                articles[index].publishedAt!,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

   Widget category(int index, String name) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              catindex = index;
              
            });
             if(catindex==0){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return  const  HomeScreen();
              },));
            }
             else if(catindex==1){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return  const Tech();
              },));
            }
            else if(catindex==2){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return  const Enterscree();
              },));
            }
            else if(catindex==3){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                 return  const Sports();
              },));
            }
          },
          child: Text(
            name,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        catindex == index
            ? Container(
                height: 1,
                width: name.length * 8,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.green)),
              )
            : Container()
      ],
    );
  }
}
