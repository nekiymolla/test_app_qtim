import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_qtim/global_widgets/texts.dart';

import '../../../repository/models/news_form.dart';
import '../../../repository/news_repository.dart';
import '../../news_list/bloc/news_list_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsListBloc = NewsListBloc(GetIt.I<MockNewsRepository>());

  String? newsName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide args');
    newsName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            pinned: true,
            toolbarHeight: 50,
            expandedHeight: 220,
            elevation: 50,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/23:24.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                child: Center(
                  child: headerText(newsName ?? "...", Colors.black),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: subtitleText(newsName ?? "", Colors.black),
          )
        ],
      ),
    );
  }
}
