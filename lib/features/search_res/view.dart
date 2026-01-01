import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/detailed_news/view.dart';
import 'package:news_app/features/widgets/search_item.dart';
import 'package:news_app/home/home_cubit.dart';


class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.query});

  final String query;
  @override
  Widget build(BuildContext context) {
    List<String> author = [
      "Rana Mohy",
      "Rana Mohy",
      "Rana Mohy",
      "Rana Mohy",
    ];
    List<String> date = [
      "June 13,2024",
      "June 12,2024",
      "June 11,2024",
      "June 10,2024",];
    List<String> images = ["search1.jpg", "news2.jpg", "search3.jpg", "search4.jpg"];
    List<String> news = [
      "Chhattisgarh Polls: Ex Cong MLA Blames TS Deo For Losing Power",
      "Chhattisgarh Polls: Ex Cong MLA Blames TS Deo For Losing Power",
      "Chhattisgarh Polls: Ex Cong MLA Blames TS Deo For Losing Power",
      "Chhattisgarh Polls: Ex Cong MLA Blames TS Deo For Losing Power",
    ];

    return BlocProvider(
      create: (_) => HomeCubit()..getSearchResults(query),
      child: Scaffold(
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
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            title: Text(
              "Search results",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
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
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            // shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.model.length - 1,
                            itemBuilder: (c, index) =>
                                GestureDetector(
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: SearchItem(
                                        author: state.model[index].author ?? "null",
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
              }
          )
      ),
    );
  }
}
