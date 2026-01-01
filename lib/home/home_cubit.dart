import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/article_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  Future<void> getHeadLineData() async {
    try {
      emit(HomeLoading());
      final Response response =
          await
          // dio.get("https://newsapi.org/v2/everything?q=everything&apiKey=0b5c8b08d3574e0594e70a2112049440");
          dio.get(
            "https://newsapi.org/v2/everything",
            queryParameters: {
              'q': "everything",
              'apiKey': '6b795f5a38ee4ff1902d3f90e55dc15a',
            },
          );

      final articles = response.data['articles'] as List;
      print(articles);
      final data = articles.map((art) => ArticleModel.fromJson(art)).toList();
      print(data);
      emit(HomeSuccess(data));
    } on DioException catch (e) {
      print(e.message ?? "there is an error");
      emit(HomeFailure(e.message ?? ""));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
  Future<void> getSearchResults(String query) async {
    try {
      emit(HomeLoading());

      final finalQuery = query.trim();
      if (finalQuery.isEmpty) return;

      final Response response = await dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          'q': finalQuery,
          'apiKey': '6b795f5a38ee4ff1902d3f90e55dc15a',
        },
      );

      final articles = response.data['articles'] as List;

      final data =
      articles.map((art) => ArticleModel.fromJson(art)).toList();

      emit(HomeSuccess(data));
    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? "Network error"));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

}
