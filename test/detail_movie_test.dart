// import 'package:filmbuzz/features/detail_movie/domain/repositories/detail_movie_repo.dart';
import 'package:filmbuzz/features/detail_movie/data/datasources/remote_details.dart';
import 'package:filmbuzz/features/detail_movie/data/models/detail_movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('test api', () async {
    var genres = [];
    final remoteData = DetailsRemoteData();
    MovieDetailsModel data = await remoteData.getMovieById(278);
    for (var i in data.genres!) {
      genres.add(i.name);
      print(i.name);
    }
    // print(data.genres);
    expect(
      ['Drama', 'Crime'], genres
    );
  });
}
