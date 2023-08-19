import 'package:test_app_qtim/repository/repository.dart';

class MockNewsRepository {
  @override
  Future<List<NewsForm>> getLatestNews() async {
    return mockNewsData;
  }

  @override
  Future<List<NewsForm>> getFeaturedNews() async {
    return mockNewsData;
  }
}

final mockNewsData = [
  const NewsForm(
    id: '1',
    name: 'NBA schedule',
    previewDescription: 'NBA match schedule',
    mainDescription:
        'Published schedule of NBA matches for the season 2023/2024 Teams Golden State Warriors and Los Angeles Lakers were in first and second place respectively in popularity.',
    imageAsset: 'assets/images/23:24.jpg',
  ),
  const NewsForm(
    id: '2',
    name: 'Curry about 50 points',
    previewDescription: 'GSW-SAC',
    mainDescription:
        'Stephen Curry scored 50 points for the first time in the history of Game 7s, surpassing Kevin Durants 48-point game against the Milwaukee Bucks in 2021. The Warriors trailed by two points at halftime despite 20 points on 8-for-15 shooting from Curry.',
    imageAsset: 'assets/images/lebruh.jpg',
  ),
  const NewsForm(
    id: '3',
    name: 'James in 21 season',
    previewDescription: 'One more season',
    mainDescription:
        'The Lakers star announced Wednesday night at the ESPYS in Los Angeles that he will continue playing.',
    imageAsset: 'assets/images/steph.jpg',
  ),
];
