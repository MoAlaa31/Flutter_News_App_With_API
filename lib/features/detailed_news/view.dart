import 'package:flutter/material.dart';
import 'package:news_app/cores/resources/app_images.dart';
import 'package:news_app/model/article_model.dart';

class DetailedNews extends StatelessWidget {
  const DetailedNews({super.key, required this.model});

  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf9f9),
      appBar: AppBar(
        backgroundColor: Color(0xfffaf9f9),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
              ),
            ),
          ),
        ),
        title: Text(
          "News Detail",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Icon(
                Icons.favorite_border_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.s,
          children: [
            Center(
              child: Container(
                height: 194,
                width: 372,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(model.urlToImage ?? "", fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.author ?? "",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border_rounded),
                      SizedBox(width: 6),
                      Text(
                        "204",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      textAlign: TextAlign.start,
                      model.publishedAt ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    model.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    // maxLines: 3,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 50),
                  Text(
                    model.description ?? "",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "In a statement shared with FE over email, a company spokesperson said  that, “Xiaomi has a strong retail presence across multiple offline  channels besides Mi stores and Mi Homes including multi-brand stores, Mi  Preferred Partners as well as large format stores like Reliance,  Vijay Sales, Poorvika, Sangeetha, etc,” adding that brick-and-mortar  channels have been contributing to 50 percent of its smart TV sales in  the country.",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Underscoring the importance of offline to showcase “the superior quality  of Xiaomi smart TVs, and compare it with other marginal, fragmented  players,” the spokesperson reiterated that Xiaomi will continue to  strengthen its offline business across all categories, smart TVs  included, giving the best experience and choices across channels to its  customers.",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
