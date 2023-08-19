import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_qtim/repository/models/news_form.dart';
import 'package:test_app_qtim/repository/news_repository.dart';

part 'news_list_state.dart';
part 'news_list_event.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(this.mockNewsRepository) : super(NewsListInitial()) {
    on<LoadNewsList>((event, emit) async {
      try {
        if (state is! NewsListLoaded) {
          emit(NewsListLoading());
        }
        final newsLatestList = await mockNewsRepository.getLatestNews();
        final newsFeatureList = await mockNewsRepository.getFeaturedNews();
        emit(NewsListLoaded(newsList: newsLatestList));
        emit(NewsListLoaded(newsList: newsFeatureList));
      } catch (e) {
        emit(NewsListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final MockNewsRepository mockNewsRepository;
}
