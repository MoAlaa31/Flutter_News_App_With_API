import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cores/resources/app_colors.dart';
import 'package:news_app/cores/resources/app_images.dart';
import 'package:news_app/features/detailed_news/view.dart';
import 'package:news_app/features/search/view.dart';
import 'package:news_app/features/search_res/view.dart';
import 'package:news_app/features/widgets/news_item.dart';
import 'package:news_app/features/widgets/news_tile_item.dart';
import 'package:news_app/home/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> news = [
      "All",
      "travel", "Technology", "Business", "Entertainment",
      "Electronics",
    ];
    List<Color> colors = [
      Color(0xffFFA500),
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
    List<bool> isBordered = [false, true, true, true, true, true];

    return BlocProvider(
      create: (_) => HomeCubit()..getHeadLineData(),
      child: Scaffold(
        backgroundColor: Color(0xfffaf9f9),
        appBar: AppBar(
          backgroundColor: Color(0xfffaf9f9),
          leading: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Icon(
                Icons.format_list_bulleted,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          // leadingWidth: 54,
          actions: [
            Row(
              spacing: 18,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SearchPage();
                        },
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.search, color: Colors.black, size: 20),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(width: 18),
              ],
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            print("==============$state===============");
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return Container(child: Text(state.msg));
            }
            if (state is HomeSuccess) {
              // print("============hello from success==$state===============");
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Breaking News",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Show More",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Container(
                        height: 194,
                        width: 372,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            state.model[0].urlToImage ?? "",
                            // AppImages.breakingNews
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 39,
                      child: ListView.builder(
                        itemCount: news.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, index) => Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SearchResult(query: news[index]),
                                  ),
                                );
                              },
                              child: NewsItem(
                                News: news[index],
                                color: colors[index],
                                bordered: isBordered[index],
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "News For You",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Show More",
                          style: TextStyle(
                            color: AppColors.blueColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 4,
                      child: ListView.builder(
                        itemCount: state.model.length - 1,
                        itemBuilder: (c, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailedNews(model: state.model[index]);
                                  },
                                ),
                              );
                            },
                            child: Expanded(
                              child: NewsTileItem(
                                title: state.model[index].author ?? "null",
                                date: state.model[index].publishedAt ?? "null",
                                image: state.model[index].urlToImage ?? "null",
                                news: state.model[index].description ?? "null",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(child: Text("No state"));
          },
        ),
      ),
    );
  }
}
