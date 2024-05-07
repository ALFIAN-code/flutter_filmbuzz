
import 'package:filmbuzz/public/features/genre/data/datasource/genre_data.dart';

class GetGenre {
  static getFromListId(List<int> id) {
    List<String> GenreName = [];
    for (var i in id) {
      for (var j in GenreData.genreList) {
        if (i == j.id) {
          GenreName.add(j.name!);
        }
      }
    }
    return GenreName;
  }
}
