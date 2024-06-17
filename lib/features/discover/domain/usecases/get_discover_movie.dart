import 'package:filmbuzz/features/discover/domain/repositories/discover_repository.dart';

class GetDiscoverMovie {
  DiscoverRepository repository;

  GetDiscoverMovie(this.repository);

  Future getDiscover(int page) async {
    try {
      return await repository.getDiscover(page);
    } catch (e) {
      rethrow;
    }
  }

  Future getDiscoverTv(int page) async {
    try {
      return await repository.getDiscoverTv(page);
    } catch (e) {
      rethrow;
    }
  }
}
