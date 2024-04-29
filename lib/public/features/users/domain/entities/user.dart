class UserModel {
  String name;
  List<String> watchlist;
  List<String> watched;

  UserModel(
      {required this.name, required this.watchlist, required this.watched});
}
